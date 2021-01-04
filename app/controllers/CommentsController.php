<?php

class CommentsController extends ApplicationController
{

  public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
  {
    parent::__construct($params, $query_string, $http_method, $asked_method);
    $this->permit(['id_post', 'id_user', 'content']);
    $this->beforeAction();
  }


  public function index()
  {
    $this->permitQueryParams(['content'], $this->query_string);
    try {
      if (!empty($this->query_string)) {
        $comments = Comment::searchByString($this->connection, $this->query_string, "/comments", $this->start, $this->limit);
      } else {
        $comments = Comment::all($this->connection, "/comments", $this->start, $this->limit);
      }
      echo json_encode($comments);
    } catch (Exception $error) {
      die(http_response_code(500));
    }
  }

  public function show()
  {
    if (isset($this->comment)) {
      try {
        $comment = new Comment($this->comment['id']);
        echo json_encode($comment->getDatas($this->connection));
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

      if (isset($this->request_params['id_post'], $this->request_params['content'])) {
        try {
          Comment::create($this->connection, ['id_post', 'id_user', 'content'], [$this->request_params['id_post'], $this->current_user['id'], $this->request_params['content']]);
          echo json_encode(Comment::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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

  public function update()
  {
    if (isset($this->comment)) {
      try {
        echo json_encode(Comment::update($this->connection, array_keys($this->request_params), array_values($this->request_params), 'id', $this->comment['id']));
      } catch (Exception $error) {
        die(http_response_code(500));
      }
    } else {
      die(http_response_code(422));
    }
  }

  public function delete()
  {
    if (isset($this->comment)) {
      try {
        Comment::delete($this->connection, [], 'id', $this->comment['id']);
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
    if (in_array($this->asked_method, ["show", "update", "delete"])) {
      if (isset($this->current_user)) {
        if ($this->params[':comment_id']) {
          $comment = Comment::find($this->connection, $this->params[':comment_id'])->fetchAll(PDO::FETCH_ASSOC);
          empty($comment) && die(http_response_code(404));
          if ($this->asked_method === "show") {
            $this->comment = $comment[0];
          } else {
            if ($this->isCurrentUserAuthor($comment[0])) {
              $this->comment = $comment[0];
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


  private function isCurrentUserAuthor(array $comment)
  {
    if ($comment['id_user'] === $this->current_user['id']) {
      return true;
    } else {
      return false;
    }
  }
}
