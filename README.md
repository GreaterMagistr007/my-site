<h2>Структура:</h2>

**Управляющий сервер**
Расположен на зарубежном хостинге.
1. Взаимодействие с нейросетями
2. Панель управления за всеми сайтами
3. Просмотр посещений за периоды за каждый сайт
4. Проверка доступности сайтов
5. Работа с телеграм-ботом или приложением. Нужно где-то общаться с сервером, чтобы на том или ином ресурсе согласовать публикацию статьи или комментария (комментарии пока под вопросом)
6. трансляция ошибок в приложение или телеграм на случай сбоев
7. Парсинг нужных ресурсов для каждого сайта

**Сайт**
Расположен в самом дешевом и доступном месте
1. Отправка запросов к управляющему серверу
2. Изменение контента / заголовка / картинки в статье посредством API.
3. Кэширование статей - для уменьшения нагрузки на сервер и ускорения работы сайта
4. Перегенерация RSS или что там еще может быть - для нагона трафика пользователей

Нераспределенный функционал:
Фиксация фактических посещений (тут пока не понятно, где лучше сделать: на управляющем сервере или на сайте. Если на сайте, то придется делать API, чтоб сервер мог у него спросить. А если на сервере, то в каждом сайте нужен js-код для инкриментации счетчика для своего сайта. Самое простое - на управляющем сервере)


<h2>Инструкция</h2>
0. Выполнить <b>git clone https://github.com/GreaterMagistr007/my-site/ --recursive</b> в нужной директории. В ней создастся папка "my-site"<br>
1. скопировать содержимое /etc/hosts в конец своего hosts<br>
    * Windows: C:\Windows\System32\drivers\etc файл hosts<br>
    * Lixnu: /etc/hosts<br>
2. Выполнить команду docker-compose up и смотреть на магию<br>
3. при первом запуске настроить backend: ./bin/install-apache.sh<br>
   Команда может просить иногда вводить в некоторые данные (временная зона, например)<br>
4. по адресу http://phpmyadmin.loc:8080/ резко стал доступен phpmyadmin<br>
5. по адресу http://server.loc/ резко стал доступен управляющий ресурс<br>