<?php

class UserHobbiesController extends ApplicationController 
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['id_hobby', 'id_user']);
        $this->beforeAction();
    }

    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->request_params['id_hobby'])) {
                try {
                    echo json_encode(UserHobby::createNewUserHobby($this->connection, ['id_hobby', 'id_user'], [$this->request_params['id_hobby'], $this->current_user['id']]));
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
        if (isset($this->hobby)) {
            try {
                UserHobby::delete($this->connection, [], 'id', $this->hobby['id']);
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
                if ($this->params[':user_hobby_id']) {
                    $hobby = UserHobby::find($this->connection, $this->params[':user_hobby_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($hobby) && die(http_response_code(404));
                    if ($this->isCurrentUserAuthor($hobby[0])) {
                        $this->hobby = $hobby[0];
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


    private function isCurrentUserAuthor(array $hobby)
    {
        if ($hobby['id_user'] === $this->current_user['id']) {
            return true;
        } else {
            return false;
        }
    }
}
