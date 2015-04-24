#!/usr/bin/env venv/bin/python
# coding=utf-8
__author__ = 'dimv36'
from sys import argv
from re import match
from webtests.models import Process
from sqlalchemy.orm.exc import NoResultFound

if __name__ == '__main__':
    # if len(argv) != 2:
    #     print('Too few arguments for script')
    #     exit(1)
    # file_name = argv[1]
    file_name = 'files/questions'
    out_file = open(file_name + '.sql', 'w')
    with open(file_name) as questions_file:
        sql = str()
        process_id = int()
        marks = str()
        process_name = str()
        correct_answers = str()
        count = int()
        weight = str()
        for line in questions_file.readlines():
            line = line.rstrip('\n')
            # Парсим имя вопроса
            if match(r"^\d{1,2}.\s\S+", line):
                # Обрабатываем полученные данные
                if marks:
                    sql = sql[0:-2] + '}\', '
                if marks and weight:
                    if count == 0:
                        sql += marks + '}\', NULL, ' + weight + ', ' + str(process_id - 1) + ');\n'
                    else:
                        sql += marks + '}\', NULL, ' + weight + ', ' + str(process_id) + ');\n'
                if correct_answers:
                    correct_answers = correct_answers[0:-2]
                    sql = sql[0:-2]
                    sql += u'}\', NULL, ' + correct_answers + u'}\', NULL, ' + str(process_id) + u');\n'
                marks = str()
                correct_answers = str()
                weight = str()
                if process_name:
                    sql += process_name
                    process_name = str()
                sql += u'INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) ' \
                       u'VALUES (DEFAULT, '
                line = ' '.join(line.split(' ')[1:])
                sql += u'\'%s\', \'{' % line.decode('utf-8')
                count += 1
            # Парсим имя процесса
            elif line.startswith('GP') or line.startswith('SSP') or line.startswith('TSP') or line.startswith('OSP'):
                try:
                    process_id = Process.query.filter(Process.name.like(line + '%')).one().id
                    if process_id == 1:
                        process_name = u'-- Process: %s\n' % line.rstrip(':')
                    else:
                        process_name += u'\n\n-- Process: %s\n' % line
                except NoResultFound:
                    print(u'Could not find process with name like %s' % line)
                    exit(1)
                count = 0
            # Парсим варианты ответов
            elif line.startswith('-'):
                sql += u'%s, ' % line.lstrip('-').decode('utf-8')
            elif match(r"^\d-\S+", line):
                mark = line.split('-')[0]
                variant = line.split('-')[1]
                sql += u'%s, ' % variant.decode('utf-8')
                if not marks:
                    marks = '\'{' + mark
                else:
                    marks += ', ' + mark
            # Парсим правильные ответы, если они есть
            elif line.startswith('+'):
                answers = line.lstrip('+')
                answers.replace(',', ', ')
                correct_answers = '\'{%s}\'' % answers
            # Парсим вес вопроса, если он есть
            elif match(r"^\d{1,2}", line):
                weight = line
            elif line == 'END':
                sql = sql[0:-2]
                sql += u'}\', %s}\', NULL, %s, %d);' % (marks, weight, process_id)
    out_file.write(sql.encode('utf-8'))
    out_file.close()