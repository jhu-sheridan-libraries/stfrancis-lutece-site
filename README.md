# Build

In lutece-site run `mvn lutece:site-assembly`. A war will be built in target/.

# Configuration

Document environment variables.

# Run 

Build the war and copy it to `lutece.war` in the main directory.
Then run `docker-compose up`. Mysql, tomcat, and lutece-init containers will start.
The mysql container keeps its db in a volume. The tomcat container will
deploy 'lutece.war' and redeploy any updates. The lutece-init container will initialize the db
if needed and then exit.

# Use site

Login as administrator: http://localhost:8080/francis/jsp/admin/AdminLogin.jsp
Username: admin
Password: adminadmin
