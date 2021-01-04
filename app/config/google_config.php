<?php
define("GOOGLE_CONFIG", [
    "client_id"=> "938162247353-7efdko8nh9i2ejckfq6p07r6to2ctvse.apps.googleusercontent.com",
    "project_id" => "social-network-296009",
    "auth_uri" => "https://accounts.google.com/o/oauth2/auth",
    "token_uri" => "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url" => "https://www.googleapis.com/oauth2/v1/certs",
    "client_secret" => "eE2yZgnWq8Q1PsafMmwD6mKM",
    "redirect_uris" => [
        "http://localhost/social-network/users/connect",
        "http://localhost/social-network/authorize",
        "http://localhost:3000/social-network/authorize"]
]);