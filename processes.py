#!/usr/bin/python
__author__ = 'dimv36'
from sys import argv

if __name__ == '__main__':
    if len(argv) != 2:
        print('Too few arguments for script')
        exit(1)
    out_file = open(argv[1] + '.sql', 'w')
    with open(argv[1]) as process_file:
        process_id = 1
        sql = str()
        for process in process_file.readlines():
            process = process.rstrip('\n')
            print(process)
            if process.startswith('SSP'):
                sql = u"INSERT INTO processes VALUES(%d, '%s', 3);" % (process_id, process.decode('utf-8'))
            if process.startswith('GP'):
                sql = u"INSERT INTO processes VALUES(%d, '%s', 4);" % (process_id, process.decode('utf-8'))
            if process.startswith('OSP'):
                sql = u"INSERT INTO processes VALUES(%d, '%s', 5);" % (process_id, process.decode('utf-8'))
            if process.startswith('TSP'):
                sql = u"INSERT INTO processes VALUES(%d, '%s', 6);" % (process_id, process.decode('utf-8'))
            process_id += 1
            out_file.write(sql.encode('utf-8') + '\n')
        out_file.close()

