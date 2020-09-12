import json
import MySQLdb
import sys

'''
alter table estate add features_bit bigint after features;
alter table chair add features_bit bigint after features;
'''


if len(sys.argv) != 3:
    print(f'{sys.argv[0]} estate_condition.json chair_condition.json')
    sys.exit()

ef_list = json.load(open(sys.argv[1]))['feature']['list']
cf_list = json.load(open(sys.argv[2]))['feature']['list']

conn = MySQLdb.connect(host='localhost', user='root')
cur = conn.cursor()

cur.execute('SELECT id, features FROM isuumo.estate')
for id_, features in cur.fetchall():
    features = features.split(',')

    feature_num = 0
    for feature in features:
        if feature:
            feature_num += (1 << ef_list.index(feature))

    cur.execute('UPDATE isuumo.estate SET features_bit = %s WHERE id = %s', (feature_num, id_))

cur.execute('SELECT id, features FROM isuumo.chair')
for id_, features in cur.fetchall():
    features = features.split(',')

    feature_num = 0
    for feature in features:
        if feature:
            feature_num += (1 << cf_list.index(feature))

    cur.execute('UPDATE isuumo.chair SET features_bit = %s WHERE id = %s', (feature_num, id_))

conn.commit()
