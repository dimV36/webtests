#!/usr/bin/python
__author__ = 'dimv36'
from sys import argv

if __name__ == '__main__':
    if len(argv) != 2:
        print('Too few arguments for script')
        exit(1)
    out_file = open(argv[1] + '.sql', 'w')
    with open(argv[1]) as process_file:
        sql = str()
        for line in process_file.readlines():
            line = line.rstrip('\n')
            role_id = int()
            if line.startswith('SSP'):
                role_id = 3
            elif line.startswith('GP'):
                role_id = 4
            elif line.startswith('OSP'):
                role_id = 5
            elif line.startswith('TSP'):
                role_id = 6
            process_name = line.split(';')[0]
            is_important = line.split(';')[1].lower()
            sql = u"INSERT INTO processes(id, name, is_important, role_id) VALUES(DEFAULT, '%s', %s, %d) RETURNING id;" \
                  % (process_name.decode('utf-8'), is_important.decode('utf-8'), role_id)
            out_file.write(sql.encode('utf-8') + '\n')
    out_file.close()

