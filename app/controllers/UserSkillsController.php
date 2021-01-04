<?php

class UserSkillsController  extends ApplicationController 
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['id_skill', 'id_user']);
        $this->beforeAction();
    }


    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->request_params['id_skill'])) {
                try {
                    echo json_encode(UserSkill::createNewUserSkill($this->connection, ['id_skill', 'id_user'], [$this->request_params['id_skill'], $this->current_user['id']]));
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
        if (isset($this->skill)) {
            try {
                UserSkill::delete($this->connection, [], 'id', $this->skill['id']);
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
                if ($this->params[':user_skill_id']) {
                    $skill = UserSkill::find($this->connection, $this->params[':user_skill_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($skill) && die(http_response_code(404));
                    if ($this->isCurrentUserAuthor($skill[0])) {
                        $this->skill = $skill[0];
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


    private function isCurrentUserAuthor(array $skill)
    {
        if ($skill['id_user'] === $this->current_user['id']) {
            return true;
        } else {
            return false;
        }
    }
}
