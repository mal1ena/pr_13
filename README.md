# pr_13
### 1.  Создайте таблицу tablel co следующими параметрами: • Поля: idl int, id2 int, geni text, gen2 text. • Первичным ключом сделайте поля id1, id2, gen1.
```
CREATE TABLE table1 (
    id1 int,
    id2 int,
    gen1 text,
    gen2 text,
    PRIMARY KEY (id1, id2, gen1)
);
```
![image](https://github.com/user-attachments/assets/e9d113f4-32e1-4d6b-91e5-cb158e037d29)

### 2. Создайте таблицу table? со следующими параметрами: Возьмите набор полей table1 с помощью директивы LIKE.
```
CREATE TABLE table2 (LIKE table1);
```
![image](https://github.com/user-attachments/assets/020bddc6-a3f8-47d2-b77f-d07fa88ad831)

### 3. Проверить, какое количество внешних таблиц присутствует в бд
```
SELECT COUNT(*) 
FROM pg_catalog.pg_foreign_table;
```
![image](https://github.com/user-attachments/assets/28aff904-d1cb-4f5f-8da4-fd0ee98e34b6)

### 4 Сгенерируйте данные и вставьте их в обе таблицы(200 тысяч и 400 тысяч значений соответственно)
```
insert into table1 select gen,gen, gen::text || 'text1', gen::text || 'text2' from generate_series(1,20000) gen;
```
![image](https://github.com/user-attachments/assets/9aca1ab7-1db8-4b09-b263-a7c22dedfdca)

```
insert into table2 select gen,gen, gen::text || 'text1', gen::text || 'text2' from generate_series(1,40000) gen;
```
![image](https://github.com/user-attachments/assets/0a3ea7a4-98df-4513-bd2e-e4d1b8dc471a)

### 5 С помощью директивы EXPLAIN просмотрите план соединения таблиц tablel и table2 по ключу id1.
```
EXPLAIN select * from table1
inner join table2 on table1.id1 = table2.id1
```
![image](https://github.com/user-attachments/assets/683500e6-a686-4db1-b2cf-d31222facb04)

### 6 Используя таблицы tablel и table2 реализовать план запроса: План запроса встроенного инструмента dbeaver. С помощью директивы EXPLAIN.
![image](https://github.com/user-attachments/assets/58e0f064-1cd0-46db-9718-d51d876abedd)

![image](https://github.com/user-attachments/assets/f7229ccf-aba5-4f3e-af85-6db0a87551ce)

###7 Реализовать запросы с использованием Joins, Group by, вложенного подзапроса. Экспортировать план в файл, используя psql -qAt -f explain.sql > analyze.json
Для достижения наилучших результатов используйте EXPLAIN



