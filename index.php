<?php
require_once "./app/config/db_credentials.php";

require_once "./app/config/jwt_secret.php";

require_once "./app/config/paths.php";

require_once "./app/config/routes.php";

require_once "./app/config/autoloader.php";

require_once "./app/config/google_config.php";

require_once "./app/helpers/Autoloader.php";


require __DIR__ . '/vendor/autoload.php';

header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS');

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: *');
    die(http_response_code(200));
} else {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: *');
    Autoloader::register();
    $router = new Router();
    $router->route();
}
