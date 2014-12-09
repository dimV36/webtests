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
        for process in process_file.readlines():
            process = process.rstrip('\n')
            role_id = int()
            if process.startswith('SSP'):
                role_id = 3
            elif process.startswith('GP'):
                role_id = 4
            elif process.startswith('OSP'):
                role_id = 5
            elif process.startswith('TSP'):
                role_id = 6
            sql = u"INSERT INTO processes(id, name, role_id) VALUES(DEFAULT, '%s', %d) RETURNING id;" \
                  % (process.decode('utf-8'), role_id)
            out_file.write(sql.encode('utf-8') + '\n')
        out_file.close()

