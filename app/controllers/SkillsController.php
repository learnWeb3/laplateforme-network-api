<?php

class SkillsController extends ApplicationController 
{
    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['name', 'id_user']);
        $this->beforeAction();
    }


    public function index()
    {
        if (isset($this->current_user)) {
            echo json_encode(Skill::all($this->connection, "/skills",  $this->start, $this->limit));
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->skill)) {

            echo json_encode($this->skill);
        } else {
            http_response_code(422);
        }
    }

    public function update()
    {
        if (isset($this->skill, $this->request_params['name'])) {
            try {
                echo json_encode(Skill::update($this->connection, ['name'], [$this->request_params['name']], 'id', $this->skill['id']));
            } catch (Exception $error) {
                http_response_code(500);
            }
        } else {
            http_response_code(422);
        }
    }


    public function create()
    {
        if (isset($this->current_user)) {
            if ($this->isCurrentUserAdmin()) {
                if (isset($this->request_params['name'])) {
                    try {
                        Skill::create($this->connection, ['name'], [$this->request_params['name']]);
                        echo json_encode(Skill::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
                    } catch (Exception $error) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(422));
                }
            } else {
                die(http_response_code(403));
            }
        } else {
            die(http_response_code(403));
        }
    }


    public function delete()
    {
        if (isset($this->skill)) {
            try {
                Skill::delete($this->connection, [], 'id', $this->skill['id']);
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
        if (in_array($this->asked_method, ["delete", "update", "show"])) {
            if (isset($this->current_user)) {
                if (isset($this->params[':skill_id'])) {
                    $skill = Skill::find($this->connection, $this->params[':skill_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($skill) && die(http_response_code(404));
                    if ($this->asked_method === "show") {
                        $this->skill = $skill[0];
                    } else {
                        if ($this->isCurrentUserAdmin()) {
                            $this->skill = $skill[0];
                        } else {
                            die(http_response_code(403));
                        }
                    }
                } else {
                    die(http_response_code(422));
                }
            } else {
                die(http_response_code(403));
            }
        }
    }


    private function isCurrentUserAdmin()
    {
        if ($this->current_user['admin']) {
            return true;
        } else {
            return false;
        }
    }
}
