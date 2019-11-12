#! /bin/sh

# Wait for mysql

echo "Waiting for mysql server"

while ! mysqladmin ping -h${MYSQL_INIT_HOST} --silent; do
    sleep 1
done

echo "Found mysql server"

# If needed, init mysql db

TABLE="core_datastore"

echo "Checking if table <$TABLE> exists ..."

mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h ${MYSQL_INIT_HOST} -e "desc $TABLE" ${MYSQL_DATABASE} > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Database already initialized"
else
    echo "Initializing database..."
    unzip /lutece.war -d lutece
    cd /lutece/WEB-INF/sql && ant
fi
