
DROP TABLE building;
DROP TABLE city;
DROP TABLE building_type;
DROP TABLE seq;


CREATE TABLE seq(
    seq_name TEXT NOT NULL,
    seq_next_id INT NOT NULL
);
INSERT INTO seq VALUES('city',1000000),
                      ('building_type',1000),
                      ('building',1000000000);

CREATE TABLE city(
    city_pk_id INT NOT NULL,
    city_name TEXT NOT NULL,
    city_owner TEXT NULL,
    building_order_json TEXT NOT NULL,
    CONSTRAINT pk_city_pk_id PRIMARY KEY (city_pk_id)
);

CREATE TABLE building_type(
    building_type_pk_id INT NOT NULL,
    building_type_name TEXT NOT NULL,
    CONSTRAINT pk_building_type_pk_id PRIMARY KEY (building_type_pk_id)
);

CREATE TABLE building(
    building_pk_id INT NOT NULL,
    building_name TEXT NOT NULL,
    building_type_fk_id INT NOT NULL,
    city_fk_id INT NOT NULL,
    CONSTRAINT pk_building_pk_id PRIMARY KEY (building_pk_id),
    CONSTRAINT fk_city_fk_id FOREIGN KEY (city_fk_id) REFERENCES city(city_pk_id),
    CONSTRAINT fk_building_type_fk_id FOREIGN KEY (building_type_fk_id) REFERENCES building_type(building_type_pk_id)
);

