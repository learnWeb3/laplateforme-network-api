<?php

class LikesController  extends ApplicationController 
{
  public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
  {
    parent::__construct($params, $query_string, $http_method, $asked_method);
    $this->permit(['id_post', 'id_user']);
    $this->beforeAction();
  }

  public function create()
  {
    if (isset($this->current_user)) {

      if (isset($this->request_params['id_post'])) {
        try {
          Like::create($this->connection, ['id_post', 'id_user'], [$this->request_params['id_post'], $this->current_user['id']]);
          echo json_encode(Like::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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
    if (isset($this->Like)) {
      try {
        Like::delete($this->connection, [], 'id', $this->Like['id']);
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
        if ($this->params[':like_id']) {
          $like = Like::find($this->connection, $this->params[':like_id'])->fetchAll(PDO::FETCH_ASSOC);
          empty($like) && die(http_response_code(404));
          if ($this->isCurrentUserAuthor($like[0])) {
            $this->Like = $like[0];
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


  private function isCurrentUserAuthor(array $like)
  {
    if ($like['id_user'] === $this->current_user['id']) {
      return true;
    } else {
      return false;
    }
  }
}
