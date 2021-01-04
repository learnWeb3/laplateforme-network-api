<?php

class ExperiencesController extends ApplicationController
{
  public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
  {
    parent::__construct($params, $query_string, $http_method, $asked_method);
    $this->permit(['start_date', 'end_date', 'job_name', 'company', 'city', 'country', 'id_user']);
    $this->beforeAction();
  }


  public function update()
  {
    if (isset($this->experience, $this->request_params['start_date'], $this->request_params['end_date'], $this->request_params['job_name'], $this->request_params['company'], $this->request_params['city'], $this->request_params['country'])) {
      try {
        Experience::update($this->connection, ['start_date', 'end_date', 'job_name', 'company', 'city', 'country', 'id_user'], [$this->request_params['start_date'], $this->request_params['end_date'], $this->request_params['job_name'], $this->request_params['company'], $this->request_params['city'], $this->request_params['country'], $this->current_user['id']], 'id', $this->experience['id']);
        echo json_encode(Experience::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC));
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
      if (isset($this->request_params['start_date'], $this->request_params['end_date'], $this->request_params['job_name'], $this->request_params['company'], $this->request_params['city'], $this->request_params['country'])) {
        try {
          Experience::create($this->connection, ['start_date', 'end_date', 'job_name', 'company', 'city', 'country', 'id_user'], [$this->request_params['start_date'], $this->request_params['end_date'], $this->request_params['job_name'], $this->request_params['company'], $this->request_params['city'], $this->request_params['country'], $this->current_user['id']]);
          echo json_encode(Experience::lastCreatedRow($this->connection)->fetchAll(PDO::FETCH_ASSOC)[0]);
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
    if (isset($this->experience)) {
      try {
        Experience::delete($this->connection, [], 'id', $this->experience['id']);
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
    if (in_array($this->asked_method, ["delete", "update"])) {
      if (isset($this->current_user)) {
        if ($this->params[':experience_id']) {
          $experience = Experience::find($this->connection, $this->params[':experience_id'])->fetchAll(PDO::FETCH_ASSOC);
          empty($experience) && die(http_response_code(404));
          if ($this->isCurrentUserAuthor($experience[0])) {
            $this->experience = $experience[0];
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


  private function isCurrentUserAuthor(array $experience)
  {
    if ($experience['id_user'] === $this->current_user['id']) {
      return true;
    } else {
      return false;
    }
  }
}
