<?php

class PostTagsController  extends ApplicationController 
{
  public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
  {
    parent::__construct($params, $query_string, $http_method, $asked_method);
    $this->permit(['id_post', 'id_tag']);
    $this->beforeAction();
  }

  public function create()
  {
    if (isset($this->current_user)) {
      if (isset($this->request_params['id_post'], $this->request_params['id_tag'])) {
        $post = Post::find($this->connection, $this->request_params['id_post'])->fetchAll(PDO::FETCH_ASSOC);
        if (!empty($post)) {
          if ($this->isCurrentUserAuthor($post[0])) {
            try {
              PostTag::create($this->connection, ['id_post', 'id_tag'], [$this->request_params['id_post'], $this->request_params['id_tag']]);
              echo json_encode(PostTag::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
            } catch (Exception $error) {
              die(http_response_code(500));
            }
          } else {
            die(http_response_code(403));
          }
        } else {
          die(http_response_code(422));
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
    if (isset($this->post_tag)) {
      try {
        PostTag::delete($this->connection, [], 'id', $this->post_tag['id']);
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
        if ($this->params[':post_tag_id']) {
          $post_tag = PostTag::find($this->connection, $this->params[':post_tag_id'])->fetchAll(PDO::FETCH_ASSOC);
          empty($post_tag) && die(http_response_code(404));
          $post = Post::find($this->connection, $post_tag[0]['id_post'])->fetchAll(PDO::FETCH_ASSOC);
          if ($this->isCurrentUserAuthor($post[0])) {
            $this->post_tag = $post_tag[0];
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


  private function isCurrentUserAuthor(array $post)
  {
    if ($post['id_user'] === $this->current_user['id']) {
      return true;
    } else {
      return false;
    }
  }
}
