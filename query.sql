--
-- PostgreSQL 10.4
--

CREATE TABLE proc (
    id serial NOT NULL,
    name varchar NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO proc (name) VALUES ('Procedure 1'), ('Procedure 2'), ('Procedure 3'), ('Procedure 2');

CREATE TABLE lots (
    id serial NOT NULL,
    proc_id int NOT NULL REFERENCES proc(id) ON UPDATE CASCADE ON DELETE CASCADE,
    nds real NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO lots (proc_id, nds) VALUES (1, 100), (1, 200), (2, 300), (2, 300);

CREATE TABLE clients (
    id serial NOT NULL,
    lot_id int NOT NULL REFERENCES lots(id) ON UPDATE CASCADE ON DELETE CASCADE,
    nds real NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO clients (lot_id, nds) VALUES (1, 124.5), (1, 333.44), (1, 43.04), (2, 0), (2, 1);


WITH c AS (
    SELECT l.proc_id, l.id, SUM(c.nds) as client_nds
        FROM lots l LEFT JOIN clients c ON c.lot_id = l.id
    GROUP BY l.proc_id, l.id
) 
SELECT p.name, SUM(l.nds) as nds, SUM(c.client_nds) as client_nds
    FROM c JOIN lots l USING(id, proc_id)
        RIGHT JOIN proc p ON l.proc_id = p.id
GROUP BY p.id, p.name
ORDER BY p.id;
