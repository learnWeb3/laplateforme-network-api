<?php

class ChatsController extends ApplicationController
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['content', "subscribers"]);
        $this->beforeAction();
    }


    public function index()
    {
        if (isset($this->current_user)) {
            try {
                $user = new User($this->current_user['id']);
                echo json_encode($user->getChats($this->connection));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            http_response_code(403);
        }
    }

    public function show()
    {
        if (isset($this->chat)) {
            try {
                $chat = new Chat($this->chat['id']);
                echo json_encode($chat->getMessages($this->connection));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }


    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->request_params['subscribers'],  $this->request_params['content'])) {
                try {
                    echo json_encode(Chat::sendMessage($this->connection, $this->request_params['content'], $this->request_params['subscribers'], $this->current_user['id']));
                } catch (Exception $error) {
                    die(http_response_code(500));
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
        if (isset($this->chat)) {
            try {
                Chat::delete($this->connection, [], 'id', $this->chat['id']);
                die(http_response_code(204));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function beforeAction()
    {
        if (in_array($this->asked_method, ["show", "delete"]))
        {
            $chat = Chat::find($this->connection, $this->params[':chat_id'])->fetchAll(PDO::FETCH_ASSOC);
            if (empty($chat))
            {
                die(http_response_code(404));
            }else{
               $this->chat = $chat[0];
            }
        }
    }

}
