# coding=utf-8
__author__ = 'dimv36'
import webtests.models as m
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
from config import STATISTIC_DIR

mpl.rcParams['font.sans-serif'] = 'DejaVu Sans'

__SECOND_LEVEL_METRICS = [u'Деятельность', u'Область действия', u'Недоступность', u'Эффективность']
__THIRD_LEVEL_METRICS = __SECOND_LEVEL_METRICS + [u'Нагрузка']
__FORTH_LEVEL_METRICS = __THIRD_LEVEL_METRICS + [u'Результативность', u'Качество', u'Непрерывность', u'Инцидентность']
__FIFTH_LEVEL_METRICS = __FORTH_LEVEL_METRICS + [u'Экономическая эффективность']
__METRIC_LEVELS = [__SECOND_LEVEL_METRICS, __THIRD_LEVEL_METRICS, __FORTH_LEVEL_METRICS, __FIFTH_LEVEL_METRICS]


def __level_by_flags(flags):
    if not flags[5]:
        return 5
    for i in range(1, len(flags)):
        flag = flags[i - 1]
        if not flag:
            if not i == 1:
                return i - 1
            else:
                return 1
    return 1


def __level_by_control(answers):
    if not answers[str(6)]:
        return 1
    for i in range(1, 6):
        value = answers[str(i)]
        if not value:
            if not i == 1:
                return i - 1
            else:
                return 1
    return 5


def __level_by_metric(answers):
    result = True
    level = 1
    for metric_level in __METRIC_LEVELS:
        for metric in metric_level:
            try:
                result = result and answers[metric]
            except KeyError:
                pass
        if not result:
            if level == 1:
                return level
            else:
                return level - 1
        level += 1
    return level


def __get_statistic_by_first_algorithm(user):
    results = []
    # Нужна однозначная легенда для алгоритмов
    INVERSE = {1: 5, 2: 4, 3: 3, 4: 2, 5: 1}
    processes = m.Process.testing_processes(user.role_id, True).all()
    for process in processes:
        questions = m.Question.query.filter(m.Question.process_id == process.id)
        level = int()
        flags = [False for _ in range(0, 6)]
        if not questions.all() == []:
            question_number = 1
            for question in questions.all():
                user_choice = m.UserChoice.query.\
                    filter(m.UserChoice.user_id == user.id).\
                    filter(m.UserChoice.question == question.name).\
                    filter(m.UserChoice.field == 'question ' + str(process.id)).one()
                if question.correct_answer not in [-2, -1]:
                    try:
                        flags[question_number - 1] = bool(question.correct_answer == user_choice.choice)
                    except IndexError:
                        pass
                if question.correct_answer == -1:
                    if len(question.variants) == 2 and user_choice.choice == 2:
                        level = 5
                    if user_choice.choice > level:
                        level = user_choice.choice
                if question.correct_answer == -2:
                    headmaster_role = m.Role.role_by_id(2).one()
                    headmaster_user = m.User.user_by_role_id(headmaster_role.id).one()
                    headmaster_choice = m.UserChoice.query.filter(m.UserChoice.user_id == headmaster_user.id).\
                                                           filter(m.UserChoice.field == 'question 0').one()
                    if not headmaster_choice.choice == user_choice.choice:
                        level = 5
                question_number += 1
        short_process_name = process.name.split(' ')[0]
        level = max(level, __level_by_flags(flags))
        results.append((short_process_name, INVERSE[level]))
    return results


def __get_statistic_by_second_algorithm(user):
    results = []
    processes = m.Process.testing_processes(user.role_id, False).all()
    answers = {}
    for process in processes:
        questions = m.Question.query.filter(m.Question.process_id == process.id)
        level = 5
        if not questions.all() == []:
            for question in questions.all():
                user_choice = m.UserChoice.query.\
                    filter(m.UserChoice.user_id == user.id).\
                    filter(m.UserChoice.question == question.name).\
                    filter(m.UserChoice.field == 'question ' + str(process.id)).one()
                if question.correct_answer == -2:
                    headmaster_role = m.Role.role_by_id(2).one()
                    headmaster_user = m.User.user_by_role_id(headmaster_role.id).one()
                    headmaster_choice = m.UserChoice.query.filter(m.UserChoice.user_id == headmaster_user.id).\
                                                           filter(m.UserChoice.field == 'question 0').one()
                    choice = str()
                    if headmaster_choice.answer == u'КВО':
                        choice = 't1'
                    elif headmaster_choice.answer in [u'КИИ', u'КСИИ']:
                        choice = 't2'
                    elif headmaster_choice.answer == u'АСУ':
                        choice = 't3'
                    if not headmaster_choice.choice == choice:
                        answers[question.metric] = False
                        level = 1
                    else:
                        answers[question.metric] = True
                else:
                    answers[question.metric] = bool(user_choice.choice == question.correct_answer)
        short_process_name = process.name.split(' ')[0]
        level = min(__level_by_control(answers), __level_by_metric(answers), level)
        results.append((short_process_name, level))
    return results


def __make_statistic_for_user(user):
    pass
    # results = sorted(__get_statistic_by_first_algorithm(user) + __get_statistic_by_second_algorithm(user))
    # role_name = user.role.name
    # x = tuple(i for i in range(0, len(results)))
    # y = tuple(item[1] for item in results)
    # process_names = tuple(str(item[0].strip(':')) for item in results)
    # index = np.arange(len(results))
    # width = 1
    # plt.clf()
    # plt.bar(x, y, width)
    # plt.ylabel(u'Уровень зрелости')
    # plt.xlabel(u'Процессы')
    # plt.xticks(index + width / 2., process_names)
    # plt.yticks(np.arange(1, 6, 1))
    # plt.savefig(STATISTIC_DIR + '/%s.png' % role_name)


def make_statistic():
    roles = m.Role.testing_roles().all()
    for role in roles:
        user = m.User.user_by_role_id(role.id).one()
        __make_statistic_for_user(user)
