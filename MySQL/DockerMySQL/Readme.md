Для того чтобы работать с контейнером установите docker. <br/>

Зайтите в папку с Dockerfile и пропишите
```bash
sudo docker build -t mysql_bd .
```
Вы собрали образ. Теперь создайте и запустите  контейнер. <br/>
```bash
sudo docker run -d   -p 3306:3306 --name smysql  mysql_bd
```
smysql - имя контенейра.<br/>
Ваша Бд запушена на порту 3306.<br/>

