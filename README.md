# Build

The build system is based on Maven.

Until the lutece-enroll-plugin depdency is placed in a standard globally accessible location, you will
need to build and install it locally. Instructions for doing so are at the [enroll plugin project site.](https://github.com/jhu-sheridan-libraries/lutece-enroll-plugin)

Run `mvn lutece:site-assembly` to build a war in `target/`. The war can be run in a Java application container, but needs a SQL database setup in a certain way. To ease deployment and testing, a docker environment is provided which does this automatically.

# Docker

The site can be run using docker. See the documentation on lutece-init, https://github.com/jhu-sheridan-libraries/lutece-init, for various variables which can be set in the `.env' file. The default values are fine for development work.

Build the war and copy it to `data/lutece.war` in the main directory.
Then run `docker-compose up -d`. MySQL and lutece containers will start.
The MySQL container will be configured according the the values set in the .env and 
keeps its database in a volume. The lutece ontainer will do some configuration if needed and deploy a modified `lutece.war`.
(See the [lutece-init project site](https://github.com/jhu-sheridan-libraries/lutece-init) for information on how initialization happens.)

# Development hints

For efficient development you want to be able to edit templates on the live site. You can do this by mounting the exploded webapp in the lutece container locally.

In your docker-compose.yml volumumes section add:
```
    - ./webapps/:/usr/local/tomcat/webapps/

```

Then you will be able to access the lutece application as webapps/ROOT. Not that you may need root access to do so. Sometimes templates will be cached and changes will not be reflected by the live site. To force a site reload touch WEB-INF/web.xml.

# Setup first time

Login as administrator: http://localhost:8080/jsp/admin/AdminLogin.jsp

```
Username: admin
Password: adminadmin
```

You will be required to reset the admin password.

Other configuration steps:
* In Site/Site Properties change language to en
* In Systems/Plugin management enable all plugins
* In Admin profile menu set language to English
* In User manager, set admin language to English
* Click on gear icon on top right/Features management/Dispatch features into groups
* One at a time move no group entries to applications
* In Managers/Manage roles create appointment role with all appointment and appointment create rights
* In User Manager, select admin user and add appointment role
* In User Manager, make sure admin user has all rights listed
* In order for rights to update, may have to logout and login

