INSERT INTO guests
(first_name, last_name, phone_number, customer_date, last_stay)
VALUES
('Sara', 'Smith', 3205558899, "2020-04-10", "2021-04-10"),
('Tom', 'Holland', 5553192, "2010-05-12", "2021-05-12")
;


INSERT INTO rooms
(available, floor_number, room_number, capacity)
VALUES
(TRUE, 1, 1, 4),
(TRUE, 1, 2, 4),
(TRUE, 1, 3, 4),
(TRUE, 1, 4, 4),
(TRUE, 1, 5, 4),
(TRUE, 2, 1, 4),
(TRUE, 2, 2, 4),
(TRUE, 2, 3, 4),
(TRUE, 2, 4, 4),
(TRUE, 2, 5, 4);

INSERT INTO packages
(package_name, package_cost)
VALUES
("spa_treatment", 100),
("exercise_access", 10),
("pool_access", 5),
("valet_parking", 15)
;

# insert many to many table
INSERT INTO guest_to_package
(gid, pid)
VALUES
(1, 1),
(1, 2)
;

INSERT INTO check_in_out
(rid, check_in_date, check_out_date)
VALUES
(1, "2021-11-10", "2021-11-15")
