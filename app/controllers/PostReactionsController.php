<?php

class PostReactionsController  extends ApplicationController 
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['id_post', 'id_reaction', 'id_user']);
        $this->beforeAction();
    }


    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->request_params['id_post'], $this->request_params['id_reaction'])) {
                try {
                    PostReaction::create($this->connection, ['id_post', 'id_reaction', 'id_user'], [$this->request_params['id_post'], $this->request_params['id_reaction'], $this->current_user['id']]);
                    Post::update($this->connection, ['updated_at'], [strftime('%F %H:%M:%S', time())], 'id', $this->request_params['id_post']);
                    echo json_encode(PostReaction::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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
        if (isset($this->reaction)) {
            try {
                PostReaction::delete($this->connection, [], 'id', $this->reaction['id']);
                Post::update($this->connection, ['updated_at'], [strftime('%F %H:%M:%S', time())], 'id', $this->reaction['id_post']);
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
                if ($this->params[':post_reaction_id']) {
                    $reaction = PostReaction::find($this->connection, $this->params[':post_reaction_id'])->fetchAll(PDO::FETCH_ASSOC);
                    empty($reaction) && die(http_response_code(404));
                    if ($this->isCurrentUserAuthor($reaction[0])) {
                        $this->reaction = $reaction[0];
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


    private function isCurrentUserAuthor(array $reaction)
    {
        if ($reaction['id_user'] === $this->current_user['id']) {
            return true;
        } else {
            return false;
        }
    }
}
