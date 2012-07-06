# Maven Template with Hibernate for Tomcat on CloudBees.
## To build and deploy this on CloudBees, follow those steps:

Create application:
    bees app:create MYAPP_ID

Create database:
    bees db:create -u DB_USER -p DB_PASSWORD DBNAME

Bind database as datasource:
    bees app:bind -db DBNAME -a MYAPP_ID -as ExampleDS

Create a new Maven project in Jenkins, changing the following:

	- Add this git repository (or yours with this code) on Jenkins

	- Also check "Deploy to CloudBees" with those parameters:
    Applications: First Match
    Application Id: MYAPP_ID
    Filename Pattern: target/*.war

## To build this locally:

In the maven_template directory, open a command line, and invoke maven by typing "mvn package" to build the war file, then deploy it on cloudbees typing:
    bees app:deploy -t jboss -a MYAPP_ID target/*.war

## To deploy this on JBoss:

In the configuration tab of your application on cloudbees.com, choose Java EE 6 as your application container.

There are configuration changes to do in the following files, comments will indicate which lines to change and how.
    src/main/resources/hibernate.cfg.xml
    src/main/webapp/WEB-INF/web.xml
