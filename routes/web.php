<?php

$router->get('/', function () use ($router) {
    return "Hello Lumen Test, and test pipeline CI/CD";
});

$router->get('version', function () use ($router) {
    return $router->app->version();
});
