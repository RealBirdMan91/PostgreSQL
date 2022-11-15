--INSERT INTO sales (
--    customer_name,
--    customer_email,
--    product_name,
--    price,
--    is_canceled
--)
--VALUES (
--    'Julian Vogel',
--    'julian@web.de',
--    'Javascript Book',
--    45.99,
--    TRUE
--);

INSERT INTO sales (
    date_fulfilled,
    customer_name,
    customer_email,
    product_name,
    price,
    is_recurring,
    is_canceled
)
VALUES (
    NULL,
    'Mike Mikelson',
    'mike@web.de',
    'SQL Book',
    25.99,
    FALSE,
    FALSE
),
(
    '2022-04-10',
    'Jeff Jefferson',
    'jeff@web.de',
    'PostgreSQL Book',
    35.99,
    FALSE,
    TRUE
),
(
    '2022-05-11',
    'Stan Stanson',
    'stan@web.de',
    'Typescript Book',
    55.99,
    TRUE,
    FALSE
),
(
    '2022-01-19',
    'Bernd Bernatson',
    'bernd@web.de',
    'Typescript Advanced Book',
    99.99,
    FALSE,
    FALSE
),
(
    '2022-01-19',
    'Jenny Jennistar',
    'jenny@web.de',
    'WebSockets Book',
    33.99,
    FALSE,
    FALSE
),
(
    '2022-04-10',
    'Angela Angestar',
    'angela@web.de',
    'GraphQL Book',
    75.99,
    FALSE,
    TRUE
),
(
    '2022-01-19',
    'Winora Windstar',
    'winora@web.de',
    'NodeJS Book',
    77.99,
    TRUE,
    FALSE
),
(
    '2022-01-19',
    'Mandy Manson',
    'mandy@web.de',
    'ExpressJS Book',
    65.99,
    FALSE,
    FALSE
),
(
    '2022-6-25',
    'Greg Gregerson',
    'gregy@web.de',
    'React Book',
    109.99,
    FALSE,
    FALSE
),
(
    '2022-09-07',
    'Lucki Luckster',
    'lucki@web.de',
    'Angular Book',
    109.99,
    FALSE,
    FALSE
),
(
    '2022-11-11',
    'Bernd Bärensohn',
    'berni@web.de',
    'Vue Book',
    109.99,
    FALSE,
    TRUE
),
(
    '2022-11-11',
    'Bob Baumeister',
    'bob@web.de',
    'Svelte Book',
    65.99,
    TRUE,
    FALSE
)