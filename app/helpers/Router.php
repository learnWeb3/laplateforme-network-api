<?php

// ROUTER
class Router
{

    private $params;
    private $root_path;
    private $request_uri;
    private $query_string;
    private $route;

    public function __construct()
    {

        $this->root_path = "/social-network";
        $this->routes  = ROUTES;
        $this->http_method = $_SERVER["REQUEST_METHOD"];
        $this->request_uri = $_GET["request_uri"];
        $this->query_string = $_GET["query_string"];
        $this->params = [];

        $this->setRouteAndParams();
    }

    private function setRouteAndParams()
    {

        foreach ($this->routes as $index => $route) {


            if ($this->checkRoutes($this->root_path . $route["path"], $this->request_uri) && $route["method"] === $this->http_method) {
                $this->route = $route;
            }
        }

        !(isset($this->route)) && die(http_response_code(404));
    }

    private function checkRoutes(string $route_path, string $request_uri)
    {

        $arr_route_path = explode("/", $route_path);
        $arr_request_uri = explode("/", $request_uri);


        $params = [];

        if (count($arr_route_path) === count($arr_request_uri)) {
            $test_route = "";
            for ($i = 0; $i < count($arr_route_path); $i++) {

                if (isParam($arr_route_path[$i])) {
                    $test_route .= $arr_route_path[$i];
                    $params[$arr_route_path[$i]] = $arr_request_uri[$i];
                } else {
                    $test_route .= $arr_request_uri[$i];
                }

                $i < count($arr_route_path) - 1 && $test_route .= "/";
            }

            if ($test_route === $route_path) {
                $this->params = $params;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }


    public function route()
    {
        $var = explode("#", $this->route["route"]);
        $controller = ucfirst($var[0]) . "Controller";
        $method = $var[1];
        $controller =  new $controller($this->params, $this->query_string, $this->http_method, $method);
        $controller->$method();
    }
}



function isParam(string $str)
{
    preg_match("/(:.+)/", $str, $results);
    return count($results) > 0;
}
