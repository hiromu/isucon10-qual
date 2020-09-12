ALTER TABLE isuumo.estate ADD COLUMN door_min INTEGER NOT NULL AFTER door_width;
ALTER TABLE isuumo.estate ADD COLUMN door_max INTEGER NOT NULL AFTER door_min;
UPDATE isuumo.estate SET door_min = LEAST(door_width, door_height);
UPDATE isuumo.estate SET door_max = GREATEST(door_width, door_height);
