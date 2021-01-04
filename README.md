# social-network La Plateforme_

## A SOCIAL NETWORK API IN PHP USING HOMEMADE MVC ARCHITECTURE

## FRONTEND 

The frontend part of the application has been developped using React libraries and is available at <https://github.com/antoine-leguillou/laplateforme-network-front-end>

### DESCRIPTION

This project is a social network platform for the Laplateforme_ school students.

This repository refers to the social network api which manages CRUD operations for various collections.

The POSTMAN API documentation is available at <https://documenter.getpostman.com/view/13953520/TVsvfRZR>

### DEPENDENCIES

firebase/php-jwt <https://github.com/firebase/php-jwt> JWT TOKEN Authentication
fzaninotto/faker <https://github.com/fzaninotto/Faker> FAKE DATA SEED 


### NOTICES

#### To allow routing you need to be sure to have these configuration set for Apache server

mod_rewrite configuration

1- Access httpd.conf
2- uncomment LoadModule rewrite_module modules/mod_rewrite.so to load appropirate apache module 
3- allowOveride all instead of allowOveride none
4- Add .htaccess with url rewriting configuration

##### In order to enable upload you need to give rights to the upload directory and subdirectories

##### All internal config such as ENVIRONEMENT VARIABLES allowing loading of scripts and assets are available under /app/config


### COLABORATORS 

Coralie Fortunato <https://github.com/coralie-fortunato>
