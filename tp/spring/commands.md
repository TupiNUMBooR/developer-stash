### Проверить доступ в AD группу

```sh
whoami /groups
```

### Обновить четотам на компе после переезда чтобы доступы были

```sh
gpupdate /force /boot
```

### Размер таблиц

#### postgres

```postgresql
SELECT table_name,
       pg_size_pretty(pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')) AS size
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

#### mysql

```mysql
SELECT
    table_name AS `Table`,
    ROUND((data_length + index_length) / 1024 / 1024, 2) AS `Size (MB)`
FROM
    information_schema.TABLES
WHERE
    table_schema = 'your_database_name'  -- Укажите имя базы данных
ORDER BY
    (data_length + index_length) DESC;
```

### pgstat

```postgresql
SELECT profile.get_report('local', tstzrange('2023-08-29 00:01:00+03','2023-08-30 00:29:00+03'));
```

### Spring - Минимальный тест

```java
@ActiveProfiles({"test"})
@ExtendWith({SpringExtension.class})
@ContextConfiguration(initializers = {
        ConfigDataApplicationContextInitializer.class,
})
```
