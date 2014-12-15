#!/usr/bin/python
# coding=utf-8
__author__ = 'dimv36'
from sys import argv
from webtests.models import Process
from sqlalchemy.orm.exc import NoResultFound

if __name__ == '__main__':
    if len(argv) != 2:
        print('Too few arguments for script')
        exit(1)
    file_name = argv[1]
    out_file = open(file_name + '.sql', 'w')
    with open(file_name) as questions_file:
        sql = str()
        process_id = int()
        question_name = str()
        variants = str()
        correct_answer = str()
        metric = str()
        found = False
        count = 0
        for line in questions_file.readlines():
            line = line.rstrip('\n')
            if line.startswith('GP') or line.startswith('SSP') or line.startswith('TSP') or line.startswith('OSP'):
                count += 1
                try:
                    process_id = Process.query.filter(Process.name.like(line + '%')).one().id
                except NoResultFound:
                    print(u'Could not find process with name like %s' % line)
                    exit(1)
                found = True
            # Парсим имя вопроса
            if not process_id == 0 and not question_name and not found:
                question_name = ' '.join(line.split(' ')[1:])
                found = True
            # Парсим варианты ответа
            if question_name and line.startswith('-') and not found:
                if not variants:
                    variants = '\'{' + line.lstrip('-') + ', '
                else:
                    variants += line.lstrip('-') + ', '
                found = True
            # Парсим правильный вариант ответа
            if variants and line.startswith('+') and not found:
                variants = variants[0:len(variants) - 2]
                variants += '}\''
                correct_answer = line.lstrip('+')
                if correct_answer == 'NULL':
                    correct_answer = str(-1)
                elif correct_answer == '?':
                    correct_answer = str(-2)
                else:
                    correct_answer = str(int(correct_answer) - 1)
                found = True
            if correct_answer and line and not found:
                metric = line
                count += 1
                sql += u"INSERT INTO questions(id, name, variants, correct_answer, metric, process_id) VALUES" \
                       u"(DEFAULT, '%s', %s, %d, '%s', %d) RETURNING id;\n" % (question_name.decode('utf-8'),
                                                                                 variants.decode('utf-8'),
                                                                                 int(correct_answer),
                                                                                 metric.decode('utf-8'),
                                                                                 process_id)
                question_name = str()
                variants = str()
                correct_answer = str()
                metric = str()
            if not line:
                count = 0
                process_id = 0
            found = False
    out_file.write(sql.encode('utf-8'))
    out_file.close()