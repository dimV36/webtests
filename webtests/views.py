# coding=utf-8
__author__ = 'dimv36'
from flask import redirect, render_template, url_for, g, flash
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound
from os.path import exists
from os import mkdir, remove, listdir
from types import ListType

from webtests.roles import *
from forms import LoginForm, RegisteredUserForm, HeadmasterForm, CSOForm, DeleteUserForm, TestForm
from models import ApplicationData, Role, User, UserChoice, Question
from config import STATISTIC_DIR
from webtests import app
from statistic import make_statistic


@app.before_request
def before_request():
    """
    Функция, исполняемая до каждого запроса к приложению
    В ней реализуется определение текущего пользователя, а также некоторая логика приложения
    :return: None
    """
    g.user = current_user
    is_headmaster_started_testing = ApplicationData.is_headmaster_started_testing()
    # Создаём директорию для хранения диаграмм
    if not exists(STATISTIC_DIR):
        mkdir(STATISTIC_DIR)
    # Если флаг начала тестирования установлен в False,
    # Сбрасываем все параметры таблицы ApplicationData в False -- начальное состояние системы
    if not is_headmaster_started_testing.status:
        ApplicationData.reset_application_data()
        # Если остались какие-либо старые диаграммы, удаляем их
        for file_name in listdir(STATISTIC_DIR):
            remove(STATISTIC_DIR + '/' + file_name)


@app.route('/admin/', methods=('GET', 'POST'))
@login_required
def admin():
    if User.is_admin(g.user.username):
        return render_template('roles/admin.html')
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/admin/register', methods=('GET', 'POST'))
@login_required
def register_user():
    if User.is_admin(g.user.username):
        form = RegisteredUserForm()
        if form.prev.data:
            return redirect(url_for('admin'))
        if form.validate_on_submit():
            role = Role.role_by_name(form.role.data).one()
            User.create(username=form.username.data, password=form.password.data, role_id=role.id)
            flash(u'Пользователь "%s" успешно зарегистрирован в системе.' % form.username.data)
        return render_template('users/register.html', form=form)
    else:
        return u'Вы не можете получить доступ к этой странице.'


@app.route('/admin/delete', methods=('GET', 'POST'))
@login_required
def delete_user():
    if User.is_admin(g.user.username):
        form = DeleteUserForm()
        users = User.users()
        if form.prev.data:
            return redirect(url_for('admin'))
        if form.validate_on_submit():
            for user_id in form.users.data:
                user = User.user_by_id(user_id).one()
                flash(u'Пользователь %s был успешно удалён.' % user.username)
                user.delete()
        return render_template('users/delete.html', form=form, users=users)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/headmaster/', methods=('GET', 'POST'))
@login_required
def headmaster():
    if g.user.role.name == ROLE_HEAD_OF_ORGANIZATION:
        is_headmaster_started_testing = ApplicationData.is_headmaster_started_testing()
        is_cso_answered_on_questions = ApplicationData.is_cso_answered_on_questions()
        form = HeadmasterForm()
        if form.validate_on_submit():
            if not is_headmaster_started_testing.status:
                choice = form.investment_levels.data
                UserChoice.create_investment_level_choice(g.user.id, choice)
            else:
                choices = UserChoice.query.all()
                for choice in choices:
                    UserChoice.delete(choice)
            is_headmaster_started_testing.status = bool(not is_headmaster_started_testing.status)
            is_headmaster_started_testing.update()
            return redirect(url_for('headmaster'))
        html = render_template('roles/headmaster.html', form=form,
                               headmaster_is_started_testing=is_headmaster_started_testing,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/', methods=('GET', 'POST'))
@login_required
def cso():
    """
    Отображение страницы для CSO
    :return: html
    """
    # Проверяем полномочия пользователя (пользователь может просматривать страницы только по своему уровню доступа)
    if g.user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
        # Получаем информацию о состоянии системы
        is_headmaster_started_testing = ApplicationData.is_headmaster_started_testing()
        is_cso_choose_processes = ApplicationData.is_cso_choose_processes()
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        is_cso_answered_on_questions = ApplicationData.is_cso_answered_on_questions()
        # Владелец начал тестирование, OM прошёл его, а CSO не ответил на вопросы?
        if is_headmaster_started_testing.status and \
                is_om_answered_on_questions.status and \
                not is_cso_answered_on_questions.status:
            # Запускаем тестирование для CSO
            return redirect(url_for('cso_testing', page=1))
        # Создаём форму для пользователя CSO
        form = CSOForm()
        # Получаем список процессов из БД
        try:
            processes = UserChoice.user_choice_processes().one().choice_name()
        except NoResultFound:
            processes = None
        # Форма прошла вадидацию и отправлена?
        if form.validate_on_submit():
            # Если CSO не выбрал процессы, то создаём сущность в БД, содержащий выбор процессов CSO
            if not is_cso_choose_processes.status:
                UserChoice.create_process_choice(g.user.id, form.processes.data)
                # Обновляем информацию о состоянии системы: пользователь CSO выбрал вопросы
                is_cso_choose_processes.status = bool(not is_cso_choose_processes.status)
                is_cso_choose_processes.update()
            return redirect(url_for('cso'))
        # Генерируем форму для отображения (см. roles/cso.html)
        html = render_template('roles/cso.html', form=form,
                               is_headmaster_started_testing=is_headmaster_started_testing,
                               is_cso_choose_processes=is_cso_choose_processes,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               investment_level=UserChoice.user_choice_chosen_investment_level(),
                               processes=processes)
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


def __make_question_choice_for_fields(entries, user_id, process_id):
    """
    Вспомогательная функция сохранения ответов на вопросы пользователя
    :param entries: список виджетов, которые используются для отображения и получения ответов пользователя (list)
    :param user_id: идентификатор пользователя (int)
    :param process_id: идентификатор процесса (int)
    :return: None
    """
    for entry in entries:
        # Получаем ответ пользователя
        choice = entry.data
        # Обращаемся к БД, получаем запись вопроса по его имени и идентификатору процесса
        question = Question.question(entry.label, process_id).one()
        # Формируем JSON, включая в него список необходимых параметров для анализа
        user_choice = {'process_id': process_id,
                       'question_id': question.id,
                       'mark': question.question_mark(choice),
                       'weight': question.weight,
                       'correct_answers': question.correct_answers}
        if not type(choice) == ListType:
            choice = [choice]
        user_choice['choice'] = choice
        # Создаём новую запись в таблице UserChoice с типом ответа 'question'
        UserChoice.create_question_choice(user_id=user_id,
                                          choice=user_choice)


def save_answers_to_db(form, user_id, process_id):
    """
    Главная функция сохранения ответов пользователя.
    :param form: форма (TestForm)
    :param user_id: идентификатор пользователя (int)
    :param process_id: идентификатор процесса
    :return: None
    """
    __make_question_choice_for_fields(form.questions_with_one_answer.entries, user_id, process_id)
    __make_question_choice_for_fields(form.questions_with_many_answers.entries, user_id, process_id)


@app.route('/cio/', methods=('GET', 'POST'))
@app.route('/cio/process<int:page>', methods=['GET', 'POST'])
@login_required
def cio(page=1):
    """
    Отображение страницы для CIO
    :param page: номер страницы (int)
    :return: html
    """
    # Проверяем полномочия пользователя (пользователь может просматривать страницы только по своему уровню доступа)
    if g.user.role.name == ROLE_HEAD_OF_BASE_LEVEL:
        # Получаем информацию о состоянии системы
        is_cso_choose_processes = ApplicationData.is_cso_choose_processes()
        # Получаем процессы, по которым должен пользователь пройти тестирование
        # метод paginate(page, count, error_out) возвращает список объектов в количестве count на страницу page
        # тем самым добиваемся того, что тестирование по 1 процессу является 1 страница
        try:
            chosen_processes = UserChoice.user_choice_processes_by_role_id(g.user.role_id).paginate(page, 1, False)
        except NoResultFound:
            chosen_processes = []
        if is_cso_choose_processes.status:
            # Определяем текущий процесс и список вопросов, которые нужно будет отрисовать на форме
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.id).all()
        else:
            # Эта ветвь необходима для корректного завершения функции (например, когда тестирование не началось,
            # а CSO прошёл аутентификацию
            current_process = None
            questions_by_process = []
        # Создаём форму, в которую будут поступать ответы пользователя
        form = TestForm(questions=questions_by_process)
        is_cio_answered_on_questions = ApplicationData.is_cio_answered_on_questions()
        # Форма прошла валидацию и отправлена?
        if form.validate_on_submit():
            # Тестирование завершено?
            if form.finish.data:
                page = chosen_processes.pages
                # Сохраняем ответы в базу данных
                save_answers_to_db(form, g.user.role_id, current_process.id)
                if not is_cio_answered_on_questions.status:
                    # Изменяем параметр пройденности тестирования пользователя cio на обратное (False -> True)
                    is_cio_answered_on_questions.status = bool(not is_cio_answered_on_questions.status)
                    # Сохраняем параметр в базе данных
                    is_cio_answered_on_questions.update()
            # Если пользователю предстоит проходить тестирование по нескольким процессам,
            # и есть ещё процессы, на вопросы которых он не ответил,
            # то сохраняем ответы со страницы и изменяем номер страницы на 1
            if form.next_page.data:
                save_answers_to_db(form, g.user.role_id, current_process.id)
                page = chosen_processes.next_num
            # Перенаправление пользователя на новый номер страницы
            return redirect(url_for('cio', page=page))
        # Отрисовка страницы
        html = render_template('roles/cio.html', form=form,
                               current_process=current_process,
                               is_cso_choose_processes=is_cso_choose_processes,
                               is_cio_answered_on_questions=is_cio_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/om/', methods=('GET', 'POST'))
@app.route('/om/process<int:page>', methods=['GET', 'POST'])
@login_required
def om(page=1):
    if g.user.role.name == ROLE_HEAD_OF_OPERATIONAL_LEVEL:
        is_cio_answered_on_questions = ApplicationData.is_cio_answered_on_questions()
        try:
            chosen_processes = UserChoice.user_choice_processes_by_role_id(g.user.role_id).paginate(page, 1, False)
        except NoResultFound:
            chosen_processes = []
        if is_cio_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.id).all()
        else:
            current_process = None
            questions_by_process = []
        form = TestForm(questions=questions_by_process)
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form, g.user.role_id, current_process.id)
                if not is_om_answered_on_questions.status:
                    is_om_answered_on_questions.status = bool(not is_om_answered_on_questions.status)
                    is_om_answered_on_questions.update()
            if form.next_page.data:
                save_answers_to_db(form, g.user.role_id, current_process.id)
                page = chosen_processes.next_num
            return redirect(url_for('om', page=page))
        html = render_template('roles/om.html', form=form,
                               current_process=current_process,
                               is_cio_answered_on_questions=is_cio_answered_on_questions,
                               is_om_answered_on_questions=is_om_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/tm/', methods=('GET', 'POST'))
@app.route('/tm/process<int:page>', methods=['GET', 'POST'])
@login_required
def tm(page=1):
    if g.user.role.name == ROLE_HEAD_OF_TACTICAL_LEVEL:
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        try:
            chosen_processes = UserChoice.user_choice_processes_by_role_id(g.user.role_id).paginate(page, 1, False)
        except NoResultFound:
            chosen_processes = []
        if is_om_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.id).all()
        else:
            current_process = None
            questions_by_process = []
        form = TestForm(questions=questions_by_process)
        is_tm_answered_on_questions = ApplicationData.is_tm_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form, g.user.role_id, current_process.id)
                if not is_tm_answered_on_questions.status:
                    is_tm_answered_on_questions.status = bool(not is_tm_answered_on_questions.status)
                    is_tm_answered_on_questions.update()
            if form.next_page.data:
                save_answers_to_db(form, g.user.role_id, current_process.id)
                page = chosen_processes.next_num
            return redirect(url_for('tm', page=page))
        html = render_template('roles/tm.html', form=form,
                               current_process=current_process,
                               is_om_answered_on_questions=is_om_answered_on_questions,
                               is_tm_answered_on_questions=is_tm_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/process<int:page>', methods=['GET', 'POST'])
def cso_testing(page=1):
    if g.user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
        is_tm_answered_on_questions = ApplicationData.is_tm_answered_on_questions()
        chosen_processes = UserChoice.user_choice_processes_by_role_id(g.user.role_id).paginate(page, 1, False)
        if is_tm_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.id).all()
        else:
            current_process = None
            questions_by_process = []
        form = TestForm(questions=questions_by_process)
        is_cso_answered_on_questions = ApplicationData.is_cso_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                save_answers_to_db(form, g.user.role_id, current_process.id)
                if not is_cso_answered_on_questions.status:
                    is_cso_answered_on_questions.status = bool(not is_cso_answered_on_questions.status)
                    is_cso_answered_on_questions.update()
                    make_statistic()
                return redirect(url_for('cso'))
            if form.next_page.data:
                save_answers_to_db(form, g.user.role_id, current_process.id)
                page = chosen_processes.next_num
            return redirect(url_for('cso_testing', page=page))
        html = render_template('roles/cso_testing.html', form=form,
                               current_process=current_process,
                               is_tm_answered_on_questions=is_tm_answered_on_questions,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
        return __make_tooltips(html)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/', methods=('GET', 'POST'))
def login():
    """
    Отображение страницы для входа пользователей
    :return: html
    """
    form = LoginForm()
    # Форма прошла валидацию?
    if form.validate_on_submit():
        # Впускаем пользователя
        login_user(form.user)
        # Перенапраляем пользователя на его страницу
        return redirect('/%s' % g.user.username)
    return render_template('users/login.html', form=form)


@app.route('/logout/')
@login_required
def logout():
    """
    Функция выхода пользователя из системы
    :return:
    """
    logout_user()
    # Осуществляем перенаправление на страницу входа
    return redirect(url_for('login'))


@app.route('/<username>', methods=('GET', 'POST'))
@login_required
def user_page(username):
    """
    Функция проверки прав доступа к странице (определение роли пользователя по его имени).
    Функция определяет роль пользователя, после чего выдаёт пользователю страницу согласно его роли.
    :param username: имя пользователя (str)
    :return: html
    """
    user = None
    try:
        user = User.query.filter(User.username == username).one()
    except NoResultFound:
        pass
    if user is not None:
        if user.role.name == ROLE_HEAD_OF_ORGANIZATION:
            return redirect(url_for('headmaster'))
        elif user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
            return redirect(url_for('cso'))
        elif user.role.name == ROLE_HEAD_OF_BASE_LEVEL:
            return redirect(url_for('cio'))
        elif user.role.name == ROLE_HEAD_OF_OPERATIONAL_LEVEL:
            return redirect(url_for('om'))
        elif user.role.name == ROLE_HEAD_OF_TACTICAL_LEVEL:
            return redirect(url_for('tm'))


def __make_tooltips(html):
    """
    Функция создания tooltips (Подсказок)
    :param html: html-страница, unicode
    :return: unicode
    """
    html = html.replace(u'ISM3 LEVEL 1', u'<a class="htooltip"> ISM3 LEVEL 1 <span> Этот уровень должен привести '
                                         u'к значительному снижению риска, связанный с техническими угрозами, '
                                         u'при минимальных инвестициях в основные процессы. Этот уровень рекомендуется '
                                         u'для организаций с невысокими целями ИБ при маловероятном риске. '
                                         u'</span> </a>')
    html = html.replace(u'ISM3 LEVEL 2', u'<a class="htooltip"> ISM3 LEVEL 2 <span> Этот уровень должен привести '
                                         u'к дальнейшему снижению риска от технических угроз при умеренных инвестициях '
                                         u'в процессы. Этот уровень рекомендуется для организаций с нормальными целями '
                                         u'ИБ в средне вероятной среде риска, которые должны продемонстрировать '
                                         u'хорошую практику партнерам и стремление, чтобы избежать инцидентов. '
                                         u'</span> </a>')
    html = html.replace(u'ISM3 LEVEL 3', u'<a class="htooltip"> ISM3 LEVEL 3 <span> '
                                         u'Этот уровень должен привести к сокращению рисков с высокой вероятностью '
                                         u'технических угроз при серьезных инвестициях в процессы. '
                                         u'Этот уровень рекомендуется для организаций с высокими целями ИБ в группах '
                                         u'риска высокой вероятности. </span> </a>')
    html = html.replace(u'ISM3 LEVEL 4', u'<a class="htooltip"> ISM3 LEVEL 4 <span> Этот уровень должен привести '
                                         u'к сокращению рисков с самой высокой вероятностью от технических и внутренних'
                                         u' угроз при серьезных инвестициях в области ИБ процессов. Этот уровень '
                                         u'рекомендуется для организаций, которые зависят от конкретных требований '
                                         u'(например, коммунальные услуги, финансовые учреждения) с высокими целями ИБ '
                                         u'с нормальной или высокой степенью риска. </span> </a>')
    html = html.replace(u'ISM3 LEVEL 5', u'<a class="htooltip"> ISM3 LEVEL 5 <span> Разница между этим уровнем и '
                                         u'ISM3 Level 4 является обязательное использование технических показателей. '
                                         u'Зрелые организации, имеющий некоторый опыт, работающего под управлением '
                                         u'системы ISM3 Level4, могут оптимизировать и постоянно улучшать свою систему '
                                         u'ISM на этом уровне. При оценке зрелости процессов 5 уровня входные данные '
                                         u'по метрикам должны совпадать с базовым описанием всех метрик '
                                         u'для этого процесса, т.е. наличие всех метрик '
                                         u'</span> </a>')
    return html