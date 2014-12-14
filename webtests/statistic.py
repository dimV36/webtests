# coding=utf-8
__author__ = 'dimv36'
import webtests.models as m

MATURITY_LEVELS = {1: u'Оптимизированный',
                   2: u'Контролируемый',
                   3: u'Описанный',
                   4: u'Управляемый',
                   5: u'Начальный'}


def get_statistic_by_first_algorithm(user):
    processes = m.Process.processes_by_role(user.role_id).filter(m.Process.is_important).all()
    for process in processes:
        questions = m.Question.query.filter(m.Question.correct_answer == -1).filter(m.Question.process_id == process.id)
        level = int()
        if not questions.all() == []:
            for question in questions.all():
                user_choice = m.UserChoice.query.filter(m.UserChoice.user_id == user.id).filter(m.UserChoice.question ==
                                                                                                question.name).one()
                if len(question.variants) == 2 and user_choice.choice == 2:
                    print(question)
                    level = 5
                if user_choice.choice > level:
                    level = user_choice.choice
        print(u'\nprocess: %s, level: %d, description: %s' % (process.name, level, MATURITY_LEVELS[level]))


def get_statistic_by_second_algorithm(user):
    processes = m.Process.processes_by_role(user.role_id).filter(not m.Process.is_important).all()
    for process in processes:
        questions = m.Question.query.filter(not m.Question.correct_answer == -1).fiter(m.Question.process_id == process.id)
        level = int()
        if not questions.all() == []:
            for question in questions.all():
                user_choice = m.UserChoice.query

if __name__ == '__main__':
    user = m.User.user_by_name('cio').one()
    get_statistic_by_first_algorithm(user)