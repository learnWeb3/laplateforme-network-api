<?php

class PostsController extends ApplicationController 
{
  public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
  {
    parent::__construct($params, $query_string, $http_method, $asked_method);
    $this->permit(['content', 'image_path', 'id_user']);
    $this->beforeAction();
  }

  public function index()
  {
    $this->permitQueryParams(['content', 'tags', 'most_liked'], $this->query_string);
    if (isset($this->current_user)) {
      try {
        $tag_parameter = isset($_GET['tags']) ? $_GET['tags'] : null;
        $most_liked_parameter = isset($_GET['most_liked']) ? $_GET['most_liked'] : null;
        $posts = Post::getPosts($this->connection, $this->query_string, $this->limit, $this->start, $most_liked_parameter, $tag_parameter);
        echo json_encode($posts);
      } catch (Exception $error) {
        die(http_response_code(500));
      }
    } else {
      http_response_code(403);
    }
  }

  public function show()
  {

    if (isset($this->post)) {
      try {
        $post = new Post($this->post['id']);
        echo json_encode($post->getDatas($this->connection));
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

      if (isset($this->request_params['content'])) {
        try {
          $image_path = isset($this->request_params['image_path']) ? $this->request_params['image_path'] : null;
          Post::create($this->connection, ['content', 'image_path', 'id_user'], [$this->request_params['content'], $image_path, $this->current_user['id']]);
          echo json_encode(Post::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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

  public function update()
  {
    if (isset($this->post)) {
      try {
        echo json_encode(Post::update($this->connection, array_keys($this->request_params), array_values($this->request_params), 'id', $this->post['id']));
      } catch (Exception $error) {
        die(http_response_code(500));
      }
    } else {
      die(http_response_code(422));
    }
  }

  public function delete()
  {
    if (isset($this->post)) {
      try {
        Post::delete($this->connection, [], 'id', $this->post['id']);
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
        if ($this->params[':post_id']) {
          $post = Post::find($this->connection, $this->params[':post_id'])->fetchAll(PDO::FETCH_ASSOC);
          empty($post) && die(http_response_code(404));
          if ($this->asked_method === "show") {
            $this->post = $post[0];
          } else {
            if ($this->isCurrentUserAuthor($post[0])) {
              $this->post = $post[0];
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

  private function isCurrentUserAuthor($post)
  {
    if ($post['id_user'] === $this->current_user['id']) {
      return true;
    } else {
      return false;
    }
  }
}
