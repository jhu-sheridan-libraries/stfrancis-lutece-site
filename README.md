# Build

In lutece-site run `mvn lutece:site-assembly`. A war will be built in target/.

# Configuration

Variables to configure MySQL docker container.
See [https://github.com/docker-library/docs/tree/master/mysql] for more info.

  - `MYSQL_DATABASE` (Datebase used. Created by MySQL container.)
  - `MYSQL_USER`     (MySQL user for database.)
  - `MYSQL_PASSWORD` (Passwords for MySQL user)
  - `MYSQL_ROOT_PASSWORD` (Password for MySQL root user.)

Variables to configure lutece-init container.
  - `MYSQL_INIT_HOST` (MySQL host accessible to container.)

The `.env` file provides default values.

In order to configure the db used by the lutece war, you must edit lutece-site/webapp/WEB-INF/conf/db.properties.
That will set the default values. Or you can unpack the war and configure the file and then repack it.

# Run 

Build the war and copy it to `lutece.war` in the main directory.
Then run `docker-compose up`. Mysql, tomcat, and lutece-init containers will start.
The mysql container keeps its db in a volume. The tomcat container will
deploy `lutece.war` and redeploy any updates. The lutece-init container will initialize the db
if needed and then exit.

# Use site

Login as administrator: http://localhost:8080/lutece/jsp/admin/AdminLogin.jsp
Username: admin
Password: adminadmin1


# Application Functionality Summary
Administrative access to the application enables the ability to design the structure of the site
(page tree) and to modify the format and content of each of the pages. 

From the Site dropdown menu,
Site Administration allows the admin to make any edits to the public site while Management of the
properties of the site allows the admin to edit the default properties. Not exactly sure what Role 
Management Lutece is used for. 

From the managers dropdown menu, User Management provides a list of 
users of the application, their first and last name, access code, email, and status. The stock icons
to the right of each of the users direct the admin to each of the given properties of a user (user
identity/attributes, password, rights, roles, and workgroups). Through these fields (when clicked upon
and navigated) allow the admin to change the attributes of each of the users. By selecting advanced 
settings in the User Management home page, the admin has the ability to change the default values when
creating a user, modify the model of the email, change security and notification settings, set which
fields need to be made anonymous, and manage attributes. In the main page of User Management, also have
the ability to import and export the users and add a new user. 

The rest of the options for the managers drop down menu are as follows: 
    Role management lists all potential roles
        - An example of a role manager is a super_admin.
    Workgroups is a list of groups
        - Not entirely sure what this section is for.
    Mailing lists
        - No description as for it's purpose, but my speculation would this is used to save all of the users
            that signed up to recieve a new letter/update. 
    Management of the levels of law lists the levels of rights
        - An example is Level 0 represents the rights of a tech administrator
    Rights management provides a list of the different rights
    
The options for the charter drop down menu are as follows:
    Model Management lists the different modes
        - An example is login = 0, Wording = Normal, XSL path = normal/
    Managing Page Templates provides a lit of different templates each page may implement
    Managing XSL style sheets provides a list of different XSL style sheets 
    Style Management provides a list of styles
        - An example would be login = 8, Last name = Admin Site Map, component type = Admin Site Map
    
The options for the System drop down menu are as follows:
    Cache Management which lists the caches
        - Each service listed also displays the number of cached objects and the memory size. 
        - Admin also has the ability to activate/deactivate the caches, visualize the keys and reloads 
         the properties of the caches. 
    Content Indexing provides a list of indexing services, their version, and a description
        - Admin has the ability to start indexing and start incremental indexing.
    Search Configuration provides a list of settings
    Log visualization provides a list of the different categories the logs may fall under
    Plugin Management provides a list of plugins and the core plug in
        - Each of the plugins listed will display the version, the name, the author, and the URL 
        of the author. 
        - Admin has the ability to activate and deactivate plugins. 
    Back Office menu layout has two subcategories: feature assignment and group management
        - Feature Assignment lists the features not assigned, content, site, applications, 
        users, managers, charter, and system information.
        - Group Management lists the different groups within the application and relevant information. 
    Daemons management provides a list of daemons
    Arrangement of technical dashboards allows the admin to reorder dashboards, the columns they are 
        located in, and what order they appear in
    Arrangement of functional dashboards allows the admin to zone the users and the order in which they appear
    General Administrations splits into two different sections: back office and front office
        - The admin has the ability to set the text editor for each of the offices. 
    Management of export XSL sheets lists the transformation sheets
        - Admin has the ability to add a transformation sheet.
    External Features Management allows the admin to manage external features
