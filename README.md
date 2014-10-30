CS673
=====

CS673 - Software Engineering Course Project

Overview
====
Here is an overview of the code structure within this project.

/docs         - tracks all our documentation, UML and Object designs
/musicservice - contains all the Java backend service code. (REST and Database functionality)
/ui           - contains all the GUI code for the frontend.


musicservice
====
/src/main/java/musicservice        - Base for the Java code
/src/main/java/musicservice/common - Base for common functionality that can use used throughout the project.
/src/main/java/musicservice/rest   - contains a file per REST resource
/src/main/java/musicservice/dao    - data access objects used to interact with the database via hibernate.
/src/main/java/musicservice/model  - contains all the data model ob jects for the backend.


ui
====
