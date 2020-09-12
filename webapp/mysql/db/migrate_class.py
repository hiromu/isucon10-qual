import json
import MySQLdb
import sys

'''
alter table estate add rent_class tinyint after rent;
alter table estate add door_height_class tinyint after door_height;
alter table estate add door_width_class tinyint after door_width;
alter table chair add price_class tinyint after price;
alter table chair add height_class tinyint after height;
alter table chair add width_class tinyint after width;
alter table chair add depth_class tinyint after depth;
'''


if len(sys.argv) != 1:
    print(f'{sys.argv[0]} chair_condition.json estate_condition.json')
    sys.exit()

cc_list = json.load(open(sys.argv[2]))
ec_list = json.load(open(sys.argv[1]))

conn = MySQLdb.connect(host='localhost', user='root')
cur = conn.cursor()

cur.execute('SELECT id, rent, door_height, door_width FROM isuumo.estate')
for id_, rent, door_height, door_width in cur.fetchall():
    for r in ec_list['rent']['ranges']:
        if (r['min'] == -1 or r['min'] >= rent) and (r['max'] == -1 or r['max'] < rent):
            rent_class = r['id']
    for r in ec_list['doorHeight']['ranges']:
        if (r['min'] == -1 or r['min'] >= door_height) and (r['max'] == -1 or r['max'] < door_height):
            door_height_class = r['id']
    for r in ec_list['doorWidth']['ranges']:
        if (r['min'] == -1 or r['min'] >= door_width) and (r['max'] == -1 or r['max'] < door_width):
            door_width_class = r['id']

    cur.execute('UPDATE isuumo.estate SET rent_class = %s, door_height_class = %s, door_width_class = %s WHERE id = %s', (rent_class, door_height_class, door_width_class, id_))

cur.execute('SELECT id, price, height, width, depth FROM isuumo.chair')
for id_, price, height, width, depth in cur.fetchall():
    for r in cc_list['price']['ranges']:
        if (r['min'] == -1 or r['min'] >= price) and (r['max'] == -1 or r['max'] < price):
            price_class = r['id']
    for r in cc_list['height']['ranges']:
        if (r['min'] == -1 or r['min'] >= height) and (r['max'] == -1 or r['max'] < height):
            height_class = r['id']
    for r in cc_list['width']['ranges']:
        if (r['min'] == -1 or r['min'] >= width) and (r['max'] == -1 or r['max'] < width):
            width_class = r['id']
    for r in cc_list['depth']['ranges']:
        if (r['min'] == -1 or r['min'] >= depth) and (r['max'] == -1 or r['max'] < depth):
            depth_class = r['id']

    cur.execute('UPDATE isuumo.estate SET price_class = %s, height_class = %s, width_class = %s, depth_class = %s WHERE id = %s', (price_class, height_class, width_class, depth_class, id_))

conn.commit()
