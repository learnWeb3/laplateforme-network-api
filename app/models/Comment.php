<?php


class Comment extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function getDatas(PDO $connection)
    {
        $request_body = "SELECT 
        -- USERS
       users.id as user_id,
       users.firstname as user_firstname,
       users.lastname as user_lastname,
       users.email as user_email,
       users.avatar as user_avatar,
       users.created_at as user_created_at,
       users.updated_at as user_updated_at,
       -- POSTS
       posts.id as post_id,
       posts.id_user as post_id_user,
       posts.content as post_content,
       posts.image_path as post_image_path,
       posts.created_at as post_created_at,
       posts.updated_at as post_updated_at,
       -- COMMENTS
       comments.id as comment_id,
       comments.id_user as comment_id_user,
       comments.content as comment_content,
       comments.created_at as comment_created_at,
       comments.updated_at as comment_updated_at
       FROM comments
       INNER JOIN users 
       ON comments.id_user = users.id
       INNER JOIN posts
       ON comments.id_post = posts.id
       WHERE comments.id=?";

        $request =  Request::send($connection, $request_body, [$this->id]);
        $results = [];
        while ($row = $request->fetch()) {
            $results[] = array(
                "user" => array(
                    'id' => $row["user_id"],
                    'firstname' => $row["user_firstname"],
                    'lastname' => $row["user_lastname"],
                    'email' => $row["user_email"],
                    'avatar' => $row["user_avatar"],
                    'created_at' => $row["user_created_at"],
                    'updated_at' => $row["user_updated_at"],
                ),
                "comment" => array(
                    'id' => $row["comment_id"],
                    'content' => $row["comment_content"],
                    'id_user' => $row["comment_id_user"],
                    'created_at' => $row["comment_created_at"],
                    'updated_at' => $row["comment_updated_at"],
                ),
                "post" => array(
                    'id' => $row["post_id"],
                    'image_path' => $row["post_image_path"],
                    'content' => $row["post_content"],
                    'id_userr' => $row["post_id_user"],
                    'created_at' => $row["post_created_at"],
                    'updated_at' => $row["post_updated_at"],
                ),

            );
        }

        return $results[0];
    }
}
