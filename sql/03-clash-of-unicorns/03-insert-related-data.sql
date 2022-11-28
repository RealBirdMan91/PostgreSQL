INSERT INTO cities (city_name, population)
VALUES ('Main Mushroom Castle', 9000),
    ('Rainbow Tree', 5000),
    ('Cupcake Swamp', 7000);

INSERT INTO locations (area_name, lat, lng, area_type, city_id)
VALUES (
        'Candy Cave',
        563.85,
        905.77,
        'sugar mountains',
        1
    ),
    (
        'Sugar swamp',
        567.99,
        306.77,
        'cotton candy clouds',
        2
    ),
    (
        'Pink cotton candy fort',
        577.99,
        336.77,
        'cotton candy clouds',
        1
    ),
    (
        'rough cave camp',
        573.99,
        866.47,
        'gummy worms caves',
        3
    ),
    (
        'Mushroom Castel',
        233.55,
        55.77,
        'Mushroom forest',
        3
    );
    
INSERT INTO unicorns (
        unicorn_name,
        unicorn_status,
        unicorn_personality,
        location_id
    )
VALUES ('Pummelcorn', 'magical_one', 'cuddly', 4),
    ('Angrycorn', 'warrior', 'grumpy', 5),
    ('Strangecorn', 'magical_one', 'hyperactive', 4),
    ('Lazycorn', 'worker', 'lazy', 1),
    ('Cookiecorn', 'worker', 'greedy', 1),
    ('Sleepycorn', 'worker', 'funny', 3);