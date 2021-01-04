<?php

use Firebase\JWT\JWT;

class GoogleController extends ApplicationController{

    public function __construct(array $params, string $query_string, string $http_method, string $asked_method)
    {
        parent::__construct($params, $query_string, $http_method, $asked_method);

    }

    public function connectUser()
    {

        $Guser = new Google_Client();

        $Guser->setAuthConfig(GOOGLE_CONFIG);
        $Guser->setAccessType('online');
        // Using "consent" ensures that your application always receives a refresh token.
        // If you are not using offline access, you can omit this.
        //$Guser->setApprovalPrompt("consent");
        $Guser->setIncludeGrantedScopes(true);
        $Guser->setScopes('email');

        if (isset($_GET['code'])) {

            $token = $Guser->fetchAccessTokenWithAuthCode($_GET['code']);
            session_start();
            $_SESSION['id_token_token'] = $token;

        }

        if (
            !empty($_SESSION['id_token_token'])
            && isset($_SESSION['id_token_token']['id_token'])
        ) {

            $Guser->setAccessToken($_SESSION['id_token_token']);

        } else {

            $authUrl = $Guser->createAuthUrl();

            $url = ['url' => $authUrl];

            echo json_encode($url);

        }
        if ($Guser->getAccessToken()) {

            $token = $Guser->getAccessToken();
            $data = $Guser->verifyIdToken();

            $user = User::checkUser($this->connection, $data);

            $payload = ['JWT' => ["id" => $user['id'],
                "firstname" => $user['firstname'],
                'lastname' => $user['lastname'],
                "email" => $user['email']]
            ];

            $jwt = JWT::encode($payload, JWT_SECRET_KEY);


            echo json_encode(['JWT' => $jwt]);
        }
    }
}