<?php

use \Firebase\JWT\JWT;

class ApplicationController
{
    protected $connection;
    protected $params;
    protected $query_string;
    protected $requested_params;
    protected $headers;
    protected $authorization_header;
    protected $token;
    protected $http_method;
    protected $asked_method;
    protected $current_user;
    protected $start;
    protected $limit;

    public  function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        $this->connection = Db::connect();
        $this->params = $params;
        $this->query_string = $query_string;
        $this->limit = isset($_GET['limit']) ? intval($_GET['limit']) : 10;
        $this->start = isset($_GET['start']) ? intval($_GET['start']) : 0;
        $this->filterQueryParams();
        $this->request_params = json_decode(file_get_contents("php://input"), true);
        $this->headers = getallheaders();
        $this->authorization_header = isset($this->headers["Authorization"]) ? $this->headers["Authorization"] : "";
        $this->token = $this->extractAuthorizationToken();
        $this->http_method = $http_method;
        $this->asked_method = $asked_method;
        $this->beforeAll();
    }

    private function extractAuthorizationToken()
    {
        return !empty($this->authorization_header) ? trim(explode(" ", $this->authorization_header)[1]) : "";
    }

    protected function areRequestedParamsPresent(array $requested_params)
    {
        return array_values($this->request_params) == $requested_params;
    }

    protected function beforeAll()
    {
        try {
            $token = empty($this->token) ?   $_COOKIE['jwt_token'] : $this->token;
            $decoded = JWT::decode($token, JWT_SECRET_KEY, array('HS256'));
            $this->current_user = json_decode($decoded->sub, true);
        } catch (Exception $error) {
        }
    }

    protected function filterQueryParams()
    {
        if (!empty($_GET)) {
            $filtered_out_params = ['request_uri', 'query_string', 'start', 'limit', 'tags', 'most_liked'];
            $this->query_string = array_filter($_GET, function ($value, $key) use ($filtered_out_params) {
                return !in_array($key, $filtered_out_params);
            }, ARRAY_FILTER_USE_BOTH);
        };
    }

    protected function permit(array $authorized_parameters = null)
    {
        if ($authorized_parameters && $this->request_params) {
            array_map(function ($el) use ($authorized_parameters) {
                if (!in_array($el, $authorized_parameters)) {
                    die(http_response_code(401));
                }
            }, array_keys($this->request_params));
        }
    }

    protected function permitQueryParams(array $authorized_parameters, array $query_params)
    {
        array_map(function ($el) use ($authorized_parameters) {
            if (!in_array($el, $authorized_parameters)) {
                die(http_response_code(401));
            }
        }, array_keys($query_params));
    }
}
