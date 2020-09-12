ALTER TABLE estate ADD coordinate POINT AFTER longitude;
UPDATE isuumo.estate SET coordinate = Point(latitude, longitude);
