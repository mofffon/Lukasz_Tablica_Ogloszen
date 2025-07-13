<?php

require __DIR__ . '/../vendor/autoload.php';

use Services\Router;
use Services\Session;

Session::start();

require '../helpers.php';

$router = new Router();

basePath('/../routes.php');

inspect($_SESSION);
