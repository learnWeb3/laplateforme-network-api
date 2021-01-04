<?php

class ReactionsController  extends ApplicationController 
{
    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['type', 'id_user']);
        $this->beforeAction();
    }


    public function index()
    {
        if (isset($this->current_user)) {
            echo json_encode(Reaction::all($this->connection, "/reactions", $this->start, $this->limit));
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->reaction)) {

            echo json_encode($this->reaction);
        } else {
            http_response_code(422);
        }
    }

    public function update()
    {
        if (isset($this->reaction, $this->request_params['type'])) {
            try {
                echo json_encode(Reaction::update($this->connection, ['type'], [$this->request_params['type']], 'id', $this->reaction['id']));
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
                if (isset($this->request_params['type'])) {
                    try {
                        Reaction::create($this->connection, ['type'], [$this->request_params['type']]);
                        echo json_encode(Reaction::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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
        if (isset($this->reaction)) {
            try {
                Reaction::delete($this->connection, [], 'id', $this->reaction['id']);
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
                if (isset($this->params[':reaction_id'])) {
                    $reaction = Reaction::find($this->connection, $this->params[':reaction_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($reaction) && die(http_response_code(404));
                    if ($this->asked_method === "show") {
                        $this->reaction = $reaction[0];
                    } else {
                        if ($this->isCurrentUserAdmin()) {
                            $this->reaction = $reaction[0];
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
