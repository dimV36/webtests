# coding=utf-8
__author__ = 'dimv36'
import webtests.models as m
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
from config import STATISTIC_DIR

mpl.rcParams['font.sans-serif'] = 'DejaVu Sans'


def __get_statistic(role):
    """
    Функция получения статистических данных о процессах и результатах тестирования по ним
    :param role: роль пользователя (Role)
    :return: list(tuple), где tuple ('Короткое_имя_процесса', Оценка_тестирования)
    """
    results = []
    # Получаем список процессов, тестирование по которым проходил пользователь
    processes = m.UserChoice.user_choice_processes_by_role_id(role.id).all()
    for process in processes:
        # Для каждого процесса ищем ответы пользователя согласно идентификатору процесса
        questions = m.UserChoice.user_choice_questions_by_process_id(process.id)
        weighted_marks = float()
        all_weights = float()
        level = None
        for question in questions:
            answer = question.answer
            # Определяем тип вопроса по присутствию веса ответа
            if answer['weight'] is not None:
                all_weights += answer['weight']
                weighted_marks += answer['weight'] * answer['mark']
            # Вопрос имеет правильный ответ
            else:
                # Если нашли несовпадение в ответах и правильных ответах,
                # то процесс имеет уровень зрелости 0
                if not answer['choice'] == answer['correct_answers']:
                    level = 0
                    break
        short_process_name = m.Process.process_by_id(process.id).name.split(' ')[0]
        if level is None:
            level = int(round(weighted_marks / all_weights))
            # level = 1
            # if 0 <= question_mark <= 25:
            #     level = 2
            # elif 25 < question_mark <= 50:
            #     level = 3
            # elif 50 < question_mark <= 75:
            #     level = 4
            # elif 75 < question_mark <= 100:
            #     level = 5
        results.append((short_process_name, level))
    return results


def __make_statistic_for_user(role):
    """
    Функция отрисовки изображений для роли
    :param role: роль пользователя (Role)
    :return: None
    """
    results = sorted(__get_statistic(role))
    role_name = role.name
    x = tuple(i for i in range(0, len(results)))
    y = tuple(item[1] for item in results)
    process_names = tuple(str(item[0].strip(':')) for item in results)
    index = np.arange(len(results))
    width = 1
    plt.clf()
    plt.bar(x, y, width)
    plt.ylabel(u'Уровень зрелости')
    plt.xlabel(u'Процессы')
    plt.xticks(index + width / 2., process_names)
    plt.yticks(np.arange(1, 6, 1))
    plt.savefig(STATISTIC_DIR + '/%s.png' % role_name)


def make_statistic():
    """
    Функция запуска построения диаграмм ответов для пользователей системы
    :return: None
    """
    roles = m.Role.testing_roles().all()
    for role in roles:
        __make_statistic_for_user(role)