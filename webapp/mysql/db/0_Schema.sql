DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL UNIQUE,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    rent_class  TINYINT             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_height_class TINYINT       NOT NULL,
    door_width  INTEGER             NOT NULL,
    door_width_class TINYINT        NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    features_bit BIGINT NOT NULL,
    popularity  INTEGER             NOT NULL,
    PRIMARY KEY (rent, id),
    INDEX idx_01 (latitude, longitude)
);



CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL UNIQUE,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    price_class TINYINT         NOT NULL,
    height      INTEGER         NOT NULL,
    height_class TINYINT        NOT NULL,
    width       INTEGER         NOT NULL,
    width_class TINYINT         NOT NULL,
    depth       INTEGER         NOT NULL,
    depth_class TINYINT         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    features_bit BIGINT NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    PRIMARY KEY (price, id)
);
