<?php

class UsersController extends ApplicationController
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['email', 'password', 'password_confirmation', 'birthdate', 'id_promo', 'id_training', 'firstname', 'lastname', 'avatar', 'cover', 'linkedin', 'github', 'website', 'description']);
        $this->beforeAction();
    }

    public function index()
    {
        $this->permitQueryParams(['firstname', 'lastname', 'email'], $this->query_string);
        if (isset($this->current_user)) {
            try {
                $users = User::getUsers($this->connection, $this->query_string, $this->limit, $this->start);
                echo json_encode($users);
            } catch (Exception $error) {
                http_response_code(500);
            }
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->current_user, $this->params[':user_id'])) {
            $this->user = new User(intval($this->params[':user_id']));
            echo json_encode($this->user->getProfile($this->connection, "/users" . "/" . $this->params[':user_id'], $this->start, $this->limit));
        } else {
            http_response_code(403);
        }
    }

    public function create()
    {
        if (isset($this->request_params['email'], $this->request_params['password'], $this->request_params['password_confirmation'])) {
            try {

                echo json_encode(User::signUp($this->connection, $this->request_params['email'], $this->request_params['password'], $this->request_params['password_confirmation']));
            } catch (Exception $eror) {
                http_response_code(500);
            }
        } else {
            http_response_code(422);
        }
    }

    public function update()
    {
        if (isset($this->user)) {
            if (isset($this->request_params['id_promo'])) {
                $this->request_params['id_promo'] = intval($this->request_params['id_promo']);
            }
            if (isset($this->request_params['id_training'])) {
                $this->request_params['id_training'] = intval($this->request_params['id_training']);
            }
            if (isset($this->request_params['password'])) {
                $this->request_params['password'] = password_hash($this->request_params['id_training'], PASSWORD_BCRYPT);
            }

            try {
                echo json_encode(User::update($this->connection, array_keys($this->request_params), array_values($this->request_params), 'id', $this->current_user['id']));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(403));
        }
    }

    public function delete()
    {
        if (isset($this->user)) {
            User::delete($this->connection, [], 'id', $this->user['id']);
            http_response_code(204);
        } else {
            die(http_response_code(403));
        }
    }

    public function signin()
    {
        if (isset($this->request_params['email'], $this->request_params['password'])) {
            try {
                echo json_encode(User::signIn($this->connection, $this->request_params['email'], $this->request_params['password']));
            } catch (Exception $error) {
                $message = $error->getMessage();
                switch ($message) {
                    case "invalid informations":
                        http_response_code(401);
                        break;
                    default:
                        http_response_code(500);
                        break;
                }
            }
        } else if (isset($this->current_user)) {
            try {
                $user = User::find($this->connection, $this->current_user['id'])->fetchAll(PDO::FETCH_ASSOC);
                if (empty($user)) {
                    die(http_response_code(404));
                } else {
                    echo json_encode($user[0]);
                }
            } catch (Exception $error) {
                http_response_code(500);
            }
        } else {
            http_response_code(422);
        }
    }

    private function beforeAction()
    {

        if (in_array($this->asked_method, ['update', "delete"])) {

            if (isset($this->current_user)) {
                if (isset($this->params[':user_id'])) {

                    if ($this->current_user['id'] === $this->params[':user_id']) {
                        $this->user = $this->current_user;
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
}
