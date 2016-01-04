# The Quill Distilled

The Quill Distilled is a single-page web application for discovering and sharing quotations.  It runs on a Java backend deployed on Tomcat and utilizes Spring, REST, JPA, and a Derby Database.  Frontend technologies used in the project include JavaScript, jQuery, Ajax, and jQuery UI.  

A working version of the project can be accessed at http://quilldistilled.com.

The Quill Distilled is still very much in progress.  Any feature requests or bug reports are welcome.

If you are interested in running a local version of the application you will need to create a database (the sql script for creating a Derby database is "DB/derbyDBCreationScript.sql" and toy data is contained in "DB/data.sql") and configure the network connection driver and settings in "/src/META-INF/persistence.xml".  Once the database is running, "Quotes.war" can be deployed to a Tomcat Server. 



