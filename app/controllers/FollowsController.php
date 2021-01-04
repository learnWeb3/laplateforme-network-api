<?php

class FollowsController  extends ApplicationController 
{
    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['id_follower', 'id_followed']);
        $this->beforeAction();
    }


    public function index()
    {
    }

    public function show()
    {
    }

    public function update()
    {
    }


    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->request_params['id_followed'])) {
                try {
                    Follow::create($this->connection, ['id_followed','id_follower'], [$this->request_params['id_followed'], $this->current_user['id']]);
                    echo json_encode(Follow::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC));
                } catch (Exception $error) {
                    die(http_response_code(500));
                }
            } else {
                die(http_response_code(422));
            }
        } else {
            die(http_response_code(403));
        }
    }


    public function delete()
    {
        if (isset($this->follow)) {
            try {
                Follow::delete($this->connection, [], 'id', $this->follow['id']);
                die(http_response_code(204));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    private function beforeAction()
    {
        if (in_array($this->asked_method, ["delete"])) {
            if (isset($this->current_user)) {
                if ($this->params[':follow_id']) {
                    $follow = Follow::find($this->connection, $this->params[':follow_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($follow) && die(http_response_code(404));
                    if ($this->isCurrentUserAuthor($follow[0])) {
                        $this->follow = $follow[0];
                    } else {
                        die(http_response_code(403));
                    }
                } else {
                    die(http_response_code(422));
                }
            } else {
                die(http_response_code(403));
            }
        }
    }


    private function isCurrentUserAuthor(array $follow)
    {
        if ($follow['id_follower'] === $this->current_user['id']) {
            return true;
        } else {
            return false;
        }
    }
}
