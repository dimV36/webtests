# coding=utf-8
from flask import redirect, render_template, url_for, g, flash
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound
from os.path import exists
from os import mkdir, remove, listdir

from webtests.roles import *
from forms import LoginForm, RegisteredUserForm, HeadmasterFormDynamic, CSOFormDynamic, TestFormDynamic, \
    DeleteUserFormDynamic
from models import ApplicationData, Role, User, UserChoice, Process, InvestmentLevel, Question
from config import STATISTIC_DIR
from webtests import app
from statistic import make_statistic


@app.before_request
def before_request():
    g.user = current_user
    is_headmaster_started_testing = ApplicationData.is_headmaster_started_testing()
    if not exists(STATISTIC_DIR):
        mkdir(STATISTIC_DIR)
    if not is_headmaster_started_testing.status:
        ApplicationData.reset_application_data()
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
        form = DeleteUserFormDynamic()
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
        form = HeadmasterFormDynamic(is_headmaster_started_testing.status)
        try:
            investment_level = UserChoice.user_choice_chosen_investment_level()
        except NoResultFound:
            investment_level = None
        if form.validate_on_submit():
            if not is_headmaster_started_testing.status:
                choice = form.variants.data
                answer = InvestmentLevel().investment_level(choice)
                UserChoice.create_investment_level_choice(g.user.username, choice, answer.one().name)
            else:
                choices = UserChoice.query.all()
                for choice in choices:
                    UserChoice.delete(choice)
            is_headmaster_started_testing.status = bool(not is_headmaster_started_testing.status)
            is_headmaster_started_testing.update()
            return redirect(url_for('headmaster'))
        return render_template('roles/headmaster.html', form=form,
                               headmaster_is_started_testing=is_headmaster_started_testing,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               investment_level=investment_level)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/', methods=('GET', 'POST'))
@login_required
def cso():
    if g.user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
        is_headmaster_started_testing = ApplicationData.is_headmaster_started_testing()
        is_cso_choose_processes = ApplicationData.is_cso_choose_processes()
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        is_cso_answered_on_questions = ApplicationData.is_cso_answered_on_questions()
        if is_headmaster_started_testing.status and \
                is_om_answered_on_questions.status and \
                not is_cso_answered_on_questions.status:
            return redirect(url_for('cso_testing', page=1))
        form = CSOFormDynamic()
        investment_level = UserChoice.user_choice_chosen_investment_level()
        try:
            processes = UserChoice.user_choice_processes()
        except NoResultFound:
            processes = None
        if form.validate_on_submit():
            if not is_cso_choose_processes.status:
                for choice in form.variants.data:
                    answer = Process.process_by_id(choice)
                    UserChoice.create_process_choice(g.user.username, choice, answer.one().name)
            is_cso_choose_processes.status = bool(not is_cso_choose_processes.status)
            is_cso_choose_processes.update()
        return render_template('roles/cso.html', form=form,
                               is_headmaster_started_testing=is_headmaster_started_testing,
                               is_cso_choose_processes=is_cso_choose_processes,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               investment_level=investment_level,
                               processes=processes)
    else:
        return u'Вы не можете получить доступ к этой странице'


def save_answers_to_db(entries, user_role, page, process_id):
    process = UserChoice.user_choice_processes_by_role(user_role).paginate(page, 1, False).items[0]
    questions = Question.chosen_questions(process.choice).all()
    for i in range(0, len(entries)):
        entry = entries[i]
        question_name = questions[i].name
        question = Question.question(question_name, process_id).one()
        choice = entry.variants.data
        UserChoice.create_question_choice(username=g.user.username,
                                          process_id=process_id,
                                          question=question_name,
                                          choice=choice,
                                          answer=question.question_answer(choice))


@app.route('/cio/', methods=('GET', 'POST'))
@app.route('/cio/process<int:page>', methods=['GET', 'POST'])
@login_required
def cio(page=1):
    if g.user.role.name == ROLE_HEAD_OF_BASE_LEVEL:
        is_cso_choose_processes = ApplicationData.is_cso_choose_processes()
        chosen_processes = UserChoice.user_choice_processes_by_role(ROLE_HEAD_OF_BASE_LEVEL).paginate(page, 1, False)
        if is_cso_choose_processes.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.choice).all()
            process = Process.process_by_id(current_process.choice).one()
        else:
            questions_by_process = []
            process = None
        form = TestFormDynamic(questions_by_process)
        is_cio_answered_on_questions = ApplicationData.is_cio_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form.questions, ROLE_HEAD_OF_BASE_LEVEL, page, process.id)
                if not is_cio_answered_on_questions.status:
                    is_cio_answered_on_questions.status = bool(not is_cio_answered_on_questions.status)
                    is_cio_answered_on_questions.update()
            if form.next_page.data:
                save_answers_to_db(form.questions, ROLE_HEAD_OF_BASE_LEVEL, page, process.id)
                page = chosen_processes.next_num
            return redirect(url_for('cio', page=page))
        return render_template('roles/cio.html', form=form,
                               process_name=process,
                               is_cso_choose_processes=is_cso_choose_processes,
                               is_cio_answered_on_questions=is_cio_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/om/', methods=('GET', 'POST'))
@app.route('/om/process<int:page>', methods=['GET', 'POST'])
@login_required
def om(page=1):
    if g.user.role.name == ROLE_HEAD_OF_OPERATIONAL_LEVEL:
        is_cio_answered_on_questions = ApplicationData.is_cio_answered_on_questions()
        chosen_processes = UserChoice.user_choice_processes_by_role(ROLE_HEAD_OF_OPERATIONAL_LEVEL).paginate(page, 1, False)
        if is_cio_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.choice).all()
            process = Process.process_by_id(current_process.choice).one()
        else:
            questions_by_process = []
            process = None
        form = TestFormDynamic(questions_by_process)
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form.questions, ROLE_HEAD_OF_OPERATIONAL_LEVEL, page, process.id)
                if not is_om_answered_on_questions.status:
                    is_om_answered_on_questions.status = bool(not is_om_answered_on_questions.status)
                    is_om_answered_on_questions.update()
            if form.next_page.data:
                save_answers_to_db(form.questions, ROLE_HEAD_OF_OPERATIONAL_LEVEL, page, process.id)
                page = chosen_processes.next_num
            return redirect(url_for('om', page=page))
        return render_template('roles/om.html', form=form,
                               process_name=process,
                               is_cio_answered_on_questions=is_cio_answered_on_questions,
                               is_om_answered_on_questions=is_om_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/tm/', methods=('GET', 'POST'))
@app.route('/tm/process<int:page>', methods=['GET', 'POST'])
@login_required
def tm(page=1):
    if g.user.role.name == ROLE_HEAD_OF_TACTICAL_LEVEL:
        is_om_answered_on_questions = ApplicationData.is_om_answered_on_questions()
        chosen_processes = UserChoice.user_choice_processes_by_role(ROLE_HEAD_OF_TACTICAL_LEVEL).paginate(page, 1, False)
        if is_om_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.choice).all()
            process = Process.process_by_id(current_process.choice).one()
        else:
            questions_by_process = []
            process = None
        form = TestFormDynamic(questions_by_process)
        is_tm_answered_on_questions = ApplicationData.is_tm_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form.questions, ROLE_HEAD_OF_TACTICAL_LEVEL, page, process.id)
                if not is_tm_answered_on_questions.status:
                    is_tm_answered_on_questions.status = bool(not is_tm_answered_on_questions.status)
                    is_tm_answered_on_questions.update()
            if form.next_page.data:
                save_answers_to_db(form.questions, ROLE_HEAD_OF_TACTICAL_LEVEL, page, process.id)
                page = chosen_processes.next_num
            return redirect(url_for('tm', page=page))
        return render_template('roles/tm.html', form=form,
                               process_name=process,
                               is_om_answered_on_questions=is_om_answered_on_questions,
                               is_tm_answered_on_questions=is_tm_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/process<int:page>', methods=['GET', 'POST'])
def cso_testing(page=1):
    if g.user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
        is_tm_answered_on_questions = ApplicationData.is_tm_answered_on_questions()
        chosen_processes = UserChoice.user_choice_processes_by_role(ROLE_HEAD_OF_INFORMATION_SECURITY).paginate(page, 1, False)
        if is_tm_answered_on_questions.status:
            current_process = chosen_processes.items[0]
            questions_by_process = Question.chosen_questions(current_process.choice).all()
            process = Process.process_by_id(current_process.choice).one()
        else:
            questions_by_process = []
            process = None
        form = TestFormDynamic(questions_by_process)
        is_cso_answered_on_questions = ApplicationData.is_cso_answered_on_questions()
        if form.validate_on_submit():
            if form.finish.data:
                page = chosen_processes.pages
                save_answers_to_db(form.questions, ROLE_HEAD_OF_INFORMATION_SECURITY, page, process.id)
                if not is_cso_answered_on_questions.status:
                    is_cso_answered_on_questions.status = bool(not is_cso_answered_on_questions.status)
                    is_cso_answered_on_questions.update()
                    make_statistic()
                return redirect(url_for('cso'))
            if form.next_page.data:
                save_answers_to_db(form.questions, ROLE_HEAD_OF_INFORMATION_SECURITY, page, process.id)
                page = chosen_processes.next_num
            return redirect(url_for('cso_testing', page=page))
        return render_template('roles/cso_testing.html', form=form,
                               process_name=process,
                               is_tm_answered_on_questions=is_tm_answered_on_questions,
                               is_cso_answered_on_questions=is_cso_answered_on_questions,
                               processes=chosen_processes,
                               investment_level=UserChoice.user_choice_chosen_investment_level())
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/', methods=('GET', 'POST'))
def login():
    form = LoginForm()
    if form.validate_on_submit():
        login_user(form.user)
        # There's a subtle security hole in this code, which we will be fixing in our next article.
        # Don't use this exact pattern in anything important.
        return redirect('/%s' % g.user.username)
    return render_template('users/login.html', form=form)


@app.route('/logout/')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))


@app.route('/<username>', methods=('GET', 'POST'))
@login_required
def user_page(username):
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

