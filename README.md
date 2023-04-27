<h2>Структура:</h2>

**Управляющий сервер**
Расположен на зарубежном хостинге.
1. Взаимодействие с нейросетями
2. Панель управления за всеми сайтами
   - Просмотр посещений за периоды за каждый сайт отдельно или по группам
   - Набор базовых функций по изменению контента на каждом из сайтов
3. Проверка доступности сайтов (ping по cron`у раз в указанное время)
3. Работа с телеграм-ботом или приложением. Доступ к основным функциям управления ресурсами через бота.
4. трансляция ошибок в приложение или телеграм на случай сбоев 
5. Парсинг нужных ресурсов для каждого сайта. (CRON)

**Сайт**
Расположен в самом дешевом и доступном месте.
Имеет минимальный размер и максимальную скорость отдачи контента.
1) CRUD по сущности "Статья"
   - CACHE - возможность сохранять в кэш, читать из кэша, перезаписывать для конкретной статьи, перегенерировать для всех статей
   - Добавление (Заголовок, контент, ?картинки?, seo-meta данные, etc...  Статус is_published - по умолчанию)
   - Редактирование (все вышеперечисленное отдельными необязательными полями)
   - При изменении статуса is_published или при редактировании - перегенерировать кэш или удалять его.
   - READ HTML - получить статью в виде полного HTML кода страницы. При отсутствии кэша - перегенерировать его.
   - READ "формат" - Получить статью в нужном формате, например, XML или RSS с соблюдением всех норм и правил. Если есть нужный кэш - из кэша. Если нет - перегенерировать кэш и забрать оттуда.
   - Удаление - удалить статью отосюду, включая кэш.
2) Иметь так называемую "Тему" - набор стилей с разметкой, в которые в заранее заданные места будут выводиться переменные с возможностью изменения Темы.
3) ? Валидатор тем (проверить наличие необходимых блоков для вывода в нужных местах)
4) Иметь определенное количество рекламных блоков, отображаемых в нужных местах в Теме. Эти блоки можно редактировать через API
5) Должен иметь скрипт развертывания (установки в директорию на сервере, проверку существования таблиц БД, если требуется и их обновления/добавления), автоматически обновляться
6) Должен автоматически добавлять в Тему скрипт фиксации посещений - js-код, который уведомляет Сервер об очередном посетителе для сбора своих метрик.
7) Должна быть возможность в режиме фрейма открывать массив указанных URL для нагона трафика на них
8) По API можно менять ключевые слова, набор рекламных блоков, вплоть до блокировки/удаления сайта.
9) Синхронизировать набор статей с Сервером
10) Синхронизация логов с Сервером



<h2>Инструкция</h2>
0. Выполнить <b>git clone https://github.com/GreaterMagistr007/my-site/ --recursive</b> в нужной директории. В ней создастся папка "my-site"<br>
1. скопировать содержимое <b>/etc/hosts </b> в конец своего hosts<br>
    * Windows: C:\Windows\System32\drivers\etc файл hosts<br>
    * Lixnu: /etc/hosts<br>
2. Выполнить команду <b>docker-compose up </b> и смотреть на магию<br>
3. при первом запуске настроить backend: <b>./bin/install-apache.sh </b><br>
   Команда может просить иногда вводить в некоторые данные (временная зона, например)<br>
4. по адресу <b>http://phpmyadmin.loc:8080/ </b> резко стал доступен phpmyadmin<br>
5. по адресу <b>http://server.loc/ </b> резко стал доступен управляющий ресурс<br>
6. Когда консоль отработает, нужно проверить, доступны ли основные ресурсы: <b>http://server.loc </b> и <b>http://site.loc </b>