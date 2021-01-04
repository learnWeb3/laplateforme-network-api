<?php

class PromosController  extends ApplicationController 
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
            echo json_encode(Promo::all($this->connection, "/promos", $this->start, $this->limit));
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->promo)) {

            echo json_encode($this->promo);
        } else {
            http_response_code(422);
        }
    }

    public function update()
    {
        if (isset($this->promo, $this->request_params['name'])) {
            try {
                echo json_encode(Promo::update($this->connection, ['name'], [$this->request_params['name']], 'id', $this->promo['id']));
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
                        Promo::create($this->connection, ['name'], [$this->request_params['name']]);
                        echo json_encode(Promo::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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
        if (isset($this->promo)) {
            try {
                Promo::delete($this->connection, [], 'id', $this->promo['id']);
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
                if (isset($this->params[':promo_id'])) {
                    $promo = Promo::find($this->connection, $this->params[':promo_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($promo) && die(http_response_code(404));
                    if ($this->asked_method === "show") {
                        $this->promo = $promo[0];
                    } else {
                        if ($this->isCurrentUserAdmin()) {
                            $this->promo = $promo[0];
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
