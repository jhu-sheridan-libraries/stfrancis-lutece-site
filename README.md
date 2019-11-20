# Build

First install a dependency. In src/plugins/plugin-enroll, run `mvn install`. Then build the site. In lutece-site run `mvn lutece:site-assembly`. A war will be built in target/.

# Configuration

Variables to configure MySQL docker container.
See [https://github.com/docker-library/docs/tree/master/mysql] for more info.

  - `MYSQL_DATABASE` (Datebase used. Created by MySQL container.)
  - `MYSQL_USER`     (MySQL user for database.)
  - `MYSQL_PASSWORD` (Passwords for MySQL user)
  - `MYSQL_ROOT_PASSWORD` (Password for MySQL root user.)

Each one of these variables can have a _FILE appended. In that case, the variable value
is read from that file. (The _FILE variables point to ./secrets which is made available to containers
as /run/secrets.) Both values should not be set, but they must be for the moment
because the MySQL container does not appear to interpret them as documented.

Variables to configure lutece-init container.
  - `DB_HOST` (MySQL host accessible to container.)

The `.env` file provides default values.

A complicating factor is that lutece can only be configured by modifying an internal db.properties file.

# Run 

Build the war and copy it to `lutece.war` in the main directory.
Then run `docker-compose up -d`. MySQL, tomcat, and lutece-init containers will start.
The MySQL container will be configured according the the values set in the .env and 
keeps its database in a volume.

The lutece-init container will configure lutece.war by producing a modified version of
the war in the .webapps directory. The modified war is only updated if the lutece.war
is newer. Then the lutece-init container will initialize the database if needed and exit. 
If the database needs to be initialized, you can optionally provide a `lutece.sql` database dump file
in the same directory as the `docker-compose.yml` file to populate the database tables created during this initialization.

The tomcat container will deploy everything in the .webapps directory. 

# Use site

Login as administrator: http://localhost:8080/lutece/jsp/admin/AdminLogin.jsp
Username: admin
Password: adminadmin


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

#Initial User Management Findings
- In the signing page there are links to recover your password and access code but no ability to create a new 
  from the login page
    - Should create consistency within the site, "login" and "access code" are used interchangeably and we should
      only use one to reduce confusion
    - Links will either ask for your access code or email depending on what you are trying to recover
- I created a First Test user whose access code and password are "testfirst"
    - When I try to log in for the first time after creating the user I am prompted to reset the password 
        - This BUG should be resolved 
    - If the user has no rights, then when they log in the website is completely blank and they cannot do anything
        - Even if you set the user's rights when you create it, you must also manually select each of the individual
          rights 
            - This BUG should also be fixed as well
- When I was logged in as both First Test and admin, the admin was unable to change the user's rights
    - This is a very good feature!
    - When the user decided to log out and the admin tries to change the user's rights the admin must relog back in 
      before any changes can be made
        - This may be a BUG we should think about changed in the future
- QUESTIONS: 
    - Are all the users on this site only for administrative purposes?
        - This seems to be the case upon initial glance but something ot ponder in the future 
