<?php

class HobbiesController extends ApplicationController 
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
            echo json_encode(Hobby::all($this->connection, "/hobbies", $this->start, $this->limit));
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->hobby)) {

            echo json_encode($this->hobby);
        } else {
            http_response_code(422);
        }
    }

    public function update()
    {
        if (isset($this->hobby, $this->request_params['name'])) {
            try {
                echo json_encode(Hobby::update($this->connection, ['name'], [$this->request_params['name']], 'id', $this->hobby['id']));
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
                        Hobby::create($this->connection, ['name'], [$this->request_params['name']]);
                        echo json_encode(Hobby::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC));
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
        if (isset($this->hobby)) {
            try {
                Hobby::delete($this->connection, [], 'id', $this->hobby['id']);
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
                if (isset($this->params[':hobby_id'])) {
                    $hobby = Hobby::find($this->connection, $this->params[':hobby_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($hobby) && die(http_response_code(404));
                    if ($this->asked_method === "show") {
                        $this->hobby = $hobby[0];
                    } else {
                        if ($this->isCurrentUserAdmin()) {
                            $this->hobby = $hobby[0];
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
