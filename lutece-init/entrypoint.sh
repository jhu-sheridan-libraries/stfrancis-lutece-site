#! /bin/sh

# Wait for mysql

echo "Waiting for mysql server"

while ! mysqladmin ping -hmysql --silent; do
    sleep 2
done

echo "Found mysql server"

# If needed, init mysql db

TABLE="core_datastore"
SQL_EXISTS="desc $TABLE"
USERNAME=lutece
PASSWORD=lutece
DATABASE=lutece

echo "Checking if table <$TABLE> exists ..."

mysql -u $USERNAME -p$PASSWORD -h mysql -e "$SQL_EXISTS" $DATABASE > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Database already initialized"
else
    echo "Initializing database..."
    unzip /lutece.war -d lutece
    cd /lutece/WEB-INF/sql && ant
fi
