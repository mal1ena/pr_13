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

