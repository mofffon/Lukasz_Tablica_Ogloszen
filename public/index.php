<?php

require __DIR__ . '/../vendor/autoload.php';

use Services\Router;
use Services\Session;

Session::start();

require '../helpers.php';

$dbConfig = require basePath('config/db.php');
$router = new Router($dbConfig);

require basePath('routes.php');

// Get current URI and HTTP method
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

// Route the request
$router->route($uri);
