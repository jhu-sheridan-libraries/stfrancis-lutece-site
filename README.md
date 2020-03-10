# Build

The build system is based on Maven.

Until the lutece-enroll-plugin depdency is placed in a standard globally accessible location, you will
need to build and install it locally. Instructions for doing so are at the [enroll plugin project site.](https://github.com/jhu-sheridan-libraries/lutece-enroll-plugin)

Run `mvn lutece:site-assembly` to build a war in `target/`. The war can be run in a Java application container, but needs a SQL database setup in a certain way. To ease deployment and testing, a docker environment is provided which does this automatically.

# Docker

The site can be run using docker. See the documentation on lutece-init, https://github.com/jhu-sheridan-libraries/lutece-init, for various variables which can be set in the `.env' file. The default values are fine for development work.

Build the war and copy it to `data/lutece.war` in the main directory.
Then run `docker-compose up -d`. MySQL, tomcat, and lutece-init containers will start.
The MySQL container will be configured according the the values set in the .env and 
keeps its database in a volume. The lutece-init container will do some configuration if needed and deploy a modified `lutece.war` to the `.webapps` directory. (See the [lutece-init project site](https://github.com/jhu-sheridan-libraries/lutece-init) for information on how initialization happens.) The tomcat container will deploy everything in the `.webapps` directory.

For producation deployment, there is a separate `docker-compose.prod.yml` which additionally defines a reverse proxy.
To use it do `docker-compose -f docker-compose.yml -f docker-compose.prod.yml up`, but you will need the right certs.

# Use site

Login as administrator: http://localhost:8080/jsp/admin/AdminLogin.jsp

```
Username: admin
Password: adminadmin
```

You will be required to reset the admin password.
