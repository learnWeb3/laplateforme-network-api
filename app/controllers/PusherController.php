<?php


class PusherController  extends ApplicationController
{
    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->beforeAction();
    }


    public function index()
    {
        $this->current_user->streamFeedUpdates($this->connection);
    }

    private function beforeAction()
    {
        try {
            $this->current_user = new User($this->current_user['id']);
        } catch (Exception $e) {
            die(http_response_code(403));
        }
    }
}
