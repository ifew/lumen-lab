<?php

$router->get('/', function () use ($router) {
    return "Hello Lumen Test";
});

$router->get('version', function () use ($router) {
    return $router->app->version();
});
