
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

/*
rule:
    every building create trafic between itself and other type of building, 
    the amount is relative to thier type
    every building generate pollution, variable by type
    every building have level of crime
    
    some building have special effect
    hospital reduce impact of pollution
    police reduce impact of crime rate
    tramway reduce impact of trafic
    
    train station enable market with other city and boost factory
    teletype will give knownledge about neighbor and boost market
    
    residential make other building work
    factory give ability to build and make money if train station
    market make money by amount of citizen
    farm help population grow and make money by amount of surplus if train station
*/