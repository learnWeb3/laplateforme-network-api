<?php
class ImagesController extends ApplicationController
{
    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
        $this->permit(['image_file',]);
    }


    public function show()
    {
        if (isset($this->params[':file'])) {
            header("Content-type: image/jpeg");
            readfile(UPLOAD_PATH . '/' . $this->params[':file']);
        } else {
            http_response_code(422);
        }
    }

    public function upload()
    {
        try {
            echo json_encode(array("image_url" => Image::uploadFile('image_file')));
        } catch (Exception $error) {
            $error_message = $error->getMessage();
            if ($error_message === "file size exceeds authorized limit" || $error_message === "file type is incorrect") {
                http_response_code(403);
                echo json_encode(array("error" => $error_message));
            } else {
                http_response_code(500);
                echo json_encode(array("error" => $error_message));
            }
        }
    }
}
