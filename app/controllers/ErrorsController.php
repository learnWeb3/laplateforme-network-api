<?php

class ErrorsController extends ApplicationController
{

    public function __construct(array $params, string $query_string, string $http_method)
    {
        parent::__construct($params, $query_string, $http_method);
    }
    public function show($message)
    {
        var_dump($message);
    }
}