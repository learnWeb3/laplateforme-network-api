<?php

use Firebase\JWT\JWT;

class GoogleController extends ApplicationController
{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);
    }

    public function consent()
    {
        $Guser = new Google_Client();
        $Guser->setAuthConfig(GOOGLE_CONFIG);
        $Guser->setAccessType('online');
        $Guser->setIncludeGrantedScopes(true);
        $Guser->setScopes('email');
        $authUrl = $Guser->createAuthUrl();
        $url = ['url' => $authUrl];
        echo json_encode($url);
    }

    public function authorize()
    {
        $Guser = new Google_Client();
        $Guser->setAuthConfig(GOOGLE_CONFIG);
        $Guser->setAccessType('online');
        $Guser->setIncludeGrantedScopes(true);
        $Guser->setScopes('email');

        if (isset($this->request_params['code'])) {
            $code = $this->request_params['code'];
            $token = $Guser->fetchAccessTokenWithAuthCode($code);
            if ($Guser->getAccessToken()) {
                $data = $Guser->verifyIdToken();
                $user = User::checkUser($this->connection, $data);
                $payload = [
                    'JWT' =>
                    [
                        "id" => $user['id'],
                        "firstname" => $user['firstname'],
                        'lastname' => $user['lastname'],
                        "email" => $user['email']
                    ]
                ];
                $jwt = JWT::encode($payload, JWT_SECRET_KEY);
                echo json_encode(['jwt_token' => $jwt]);
            } else {
                http_response_code('400');
            }
        } else {
            http_response_code('422');
        }
    }
}
