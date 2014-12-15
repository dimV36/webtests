# coding=utf-8
__author__ = 'dimv36'
import webtests.models as m


def level_by_flags(flags):
    if not flags[5]:
        return 1
    for i in range(1, len(flags)):
        flag = flags[i - 1]
        if not flag:
            return i


def get_statistic_by_first_algorithm(user):
    results = []
    # Нужна однозначная легенда для алгоритмов
    INVERSE = {1: 5, 2: 4, 3: 3, 4: 2, 5: 1}
    processes = m.Process.processes_by_role(user.role_id).filter(m.Process.is_important).all()
    for process in processes:
        questions = m.Question.query.filter(m.Question.process_id == process.id)
        level = int()
        flags = [False for _ in range(0, 6)]
        if not questions.all() == []:
            question_number = 1
            for question in questions.all():
                user_choice = m.UserChoice.query.filter(m.UserChoice.user_id == user.id).filter(m.UserChoice.question ==
                                                                                                question.name).one()
                if question.correct_answer not in [-2, -1]:
                    flags[question_number - 1] = bool(question.correct_answer == user_choice.choice)
                if question.correct_answer == -1:
                    if len(question.variants) == 2 and user_choice.choice == 2:
                        level = 5
                    if user_choice.choice > level:
                        level = user_choice.choice
                if question.correct_answer == -2:
                    headmaster_role = m.Role.role_by_id(2).one()
                    headmaster_user = m.User.user_by_id(headmaster_role.role_id).one()
                    headmaster_choice = m.UserChoice.query.filter(m.UserChoice.user_id == headmaster_user.id).one()
                    if not headmaster_choice.choice == user_choice.choice:
                        level = 5
                question_number += 1
        short_process_name = process.name.split(' ')[0]
        level = max(level, level_by_flags(flags))
        results.append((short_process_name, INVERSE[level]))
    return results


def get_statistic_by_second_algorithm(user):
    processes = m.Process.processes_by_role(user.role_id).filter(not m.Process.is_important).all()
    flags = [False for _ in range(0, 12)]
    print('\nflags: ' + str(flags) + '\n')
    for process in processes:
        questions = m.Question.query.fiter(m.Question.process_id == process.id)
        level = int()
        if not questions.all() == []:
            question_number = 1
            for question in questions.all():
                user_choice = m.UserChoice.query.filter(m.UserChoice.user_id == user.id).filter(m.UserChoice.question ==
                                                                                                question.name).one()



if __name__ == '__main__':
    user = m.User.user_by_name('cio').one()
    get_statistic_by_first_algorithm(user)
    # get_statistic_by_second_algorithm(user)