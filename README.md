# social-network La Plateforme\_

## A SOCIAL NETWORK API IN PHP USING HOMEMADE MVC ARCHITECTURE

The frontend part of the application has been developped using React libraries and is available at :
[FONTEND APP](https://github.com/antoine-tech/laplateforme-network-frontend)

### DESCRIPTION

This project is a social network platform for the Laplateforme\_ school students.

This repository refers to the social network api which manages CRUD operations for various collections.

The POSTMAN API documentation is available at :
[API DOC](https://documenter.getpostman.com/view/13953520/TVsvfRZR)

### DEPENDENCIES

```bash
#install dependencies using composer package manager
php composer.phar install
```

[google/apiclient](https://github.com/googleapis/google-api-php-client) Google APIs Wrapper for PHP
[firebase/php-jwt](https://github.com/firebase/php-jwt) JWT TOKEN authentication
[fzaninotto/faker](https://github.com/fzaninotto/Faker) Fake data generator

### NOTICES

#### To allow routing you need to be sure to have these configuration set for Apache server

mod_rewrite configuration

1- Access httpd.conf
2- uncomment LoadModule rewrite_module modules/mod_rewrite.so to load appropirate apache module
3- allowOveride all instead of allowOveride none
4- Add .htaccess with url rewriting configuration

##### In order to enable upload you need to give rights to the upload directory and subdirectories

### All internal config such as ENVIRONEMENT VARIABLES allowing loading of scripts and assets are available under /app/config

### COLABORATORS

[Coralie Fortunato](https://github.com/coralie-fortunato)
[ANTOINE LE GUILLOU](https://github.com/learnWeb3)
