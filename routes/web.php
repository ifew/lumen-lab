<?php

$router->get('/', function () use ($router) {
    return "Hello Open Source Technology Co., Ltd.";
});

$router->get('version', function () use ($router) {
    return $router->app->version();
});
