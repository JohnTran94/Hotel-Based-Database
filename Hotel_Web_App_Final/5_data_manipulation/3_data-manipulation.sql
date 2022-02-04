select 'Display guests and rooms' AS '';
SELECT * FROM guests;  # query guests
SELECT * FROM rooms;  # query rooms

select 'Assign rid=1 to gid=1' AS '';
UPDATE guests SET rid=1 WHERE gid=1;  # assign room to guest
UPDATE rooms SET available=False WHERE rid=1;  # update room to be not available

select 'verify room is assigned to customer' AS '';
SELECT guests.gid, guests.first_name, guests.last_name, rooms.rid, rooms.floor_number, rooms.room_number
FROM guests
INNER JOIN rooms
ON guests.rid = rooms.rid;

select 'Unassign rid=1 from gid=1' AS '';
UPDATE guests SET rid=null WHERE gid=1;  # remove guest from room
UPDATE rooms SET available=True WHERE rid=1;  # update room to be available

select 'verify room is unassigned to customer' AS '';
SELECT guests.gid, guests.first_name, guests.last_name, rooms.rid, rooms.floor_number, rooms.room_number
FROM guests
INNER JOIN rooms
ON guests.rid = rooms.rid;

-- Check packages

select 'check packages' AS '';
SELECT * FROM packages;
SELECT * FROM guest_to_package;

-- Update guest to package

select 'update a package assigned to a guest' AS '';
UPDATE guest_to_package SET pid=3 WHERE pid=2;  # change gid package from 2 to 3
SELECT * FROM guest_to_package;

-- delete guest
DELETE FROM guests WHERE gid = guests.gid;

-- delete rooms
DELETE from rooms WHERE rid = rooms.rid;

-- delete a package
DELETE FROM packages WHERE package_name = packages.package_name AND package_cost = packages.package_cost;

-- delete a guest_to_package
DELETE FROM guest_to_package WHERE gid = 1 AND pid = 1;
DELETE FROM guest_to_package WHERE gid = 2 AND pid = 1;

-- delete check_in_out date
DELETE FROM check_in_out WHERE rid = 2 AND check_in_date = "2021-11-12" AND check_out_date = "2020-11-15";
DELETE FROM check_in_out WHERE rid = 3 AND check_in_date = "2021-11-19" AND check_out_date = "2020-11-21";
