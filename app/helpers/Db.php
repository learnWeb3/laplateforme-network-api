<?php

class Db
{
    public static function connect()
    {
        $dsn = "mysql:dbname=" . DB_NAME . ";host=" . DB_HOST . ";charset=" . DB_CHARSET;

        try {
            return new PDO($dsn, DB_USERNAME, DB_PASSWORD);
        } catch (Exception $e) {
            die($e);
        }
    }
}
