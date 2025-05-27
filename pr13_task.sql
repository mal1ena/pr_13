--1
CREATE TABLE table1 (
    id1 int,
    id2 int,
    gen1 text,
    gen2 text,
    PRIMARY KEY (id1, id2, gen1)
);

--2
CREATE TABLE table2 (LIKE table1);

--3
SELECT COUNT(*) 
FROM pg_catalog.pg_foreign_table;

--4
insert into table1 select gen,gen, gen::text || 'text1', gen::text || 'text2' from generate_series(1,20000) gen;
insert into table2 select gen,gen, gen::text || 'text1', gen::text || 'text2' from generate_series(1,40000) gen;

--5
EXPLAIN select * from table1
inner join table2 on table1.id1 = table2.id1

--7
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON) 
select * from table1
inner join table2 on table1.gen1 = table2.gen1

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON) 
SELECT gen1, COUNT(*) AS record_count
FROM table1
GROUP BY gen1
ORDER BY record_count DESC;

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
SELECT t2.*
FROM table2 t2
WHERE (t2.id1, t2.id2) IN (SELECT id1, id2 FROM table1);

--8
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select * from table1
inner join table2 on table1.id1 = table2.id1

select * from table1 limit 20

select * from table2 limit 20