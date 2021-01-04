<?php

class Post extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function getPosts(PDO $connection, array $parameters, int $limit = 10, int $offset = 0, $most_liked_parameter = null, $tag_parameter = null)
    {
        if ($most_liked_parameter) {
            $posts = Post::getMostLiked($connection, "/posts", $limit, $offset);
        } else {
            if ($tag_parameter) {
                $posts = Post::search($connection, $parameters, $tag_parameter, "/posts", $offset, $limit);
            } else {
                if (!empty($parameters)) {
                    $posts = Post::searchByString($connection, $parameters, "/posts", $offset, $limit);
                } else {
                    $posts = Post::all($connection, "/posts", $offset, $limit);
                }
            }
        }
        return $posts;
    }

    public static function getMostLiked(PDO $connection, string $endpoint_path, int $limit = 10, int $offset = 0)
    {
        $request_body = "SELECT *, COUNT(likes.id) as like_count FROM posts 
        JOIN likes ON posts.id = likes.id_post GROUP BY posts.id ORDER by like_count DESC LIMIT $limit OFFSET $offset";
        $results = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $offset += 10;
        $previous_start = $offset - 10 >= 0 ? $offset - 10 : 0;
        return array(
            "data" => $results,
            "next" => $endpoint_path . "?most_liked=true&start=$next_start&limit=$limit",
            "previous" => $endpoint_path . "?most_liked=true&start=$previous_start&limit=$limit"
        );
    }

    public function getComments(PDO $connection)
    {
        $request_body = "SELECT * FROM comments WHERE id_post=? ORDER BY comments.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getLikes(PDO $connection)
    {
        $request_body = "SELECT likes.* FROM likes WHERE id_post=? ORDER BY likes.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getReactions(PDO $connection)
    {
        $request_body = "SELECT 
        post_reactions.*
        FROM posts
        INNER JOIN post_reactions ON posts.id = post_reactions.id_post
        WHERE posts.id=?
        ORDER BY post_reactions.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getTags(PDO $connection)
    {
        $request_body = "SELECT 
        tags.*
        FROM posts
        INNER JOIN post_tags ON post_tags.id_post = posts.id
        INNER JOIN tags ON tags.id = post_tags.id_tag
        WHERE posts.id=?
        ORDER BY post_tags.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }



    public function getDatas(PDO $connection)
    {
        $comments = $this->getComments($connection);
        $likes = $this->getLikes($connection);
        $reactions = $this->getReactions($connection);
        $tags = $this->getTags($connection);

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
        posts.updated_at as post_updated_at
        FROM posts
        INNER JOIN users 
        ON posts.id_user = users.id
        WHERE posts.id=?
        ORDER BY posts.created_at DESC";

        $request = Request::send($connection, $request_body, [$this->id]);

        $results = [];

        while ($row = $request->fetch()) {
            $results["user"] = array(
                'id' => $row["user_id"],
                'firstname' => $row["user_firstname"],
                'lastname' => $row["user_lastname"],
                'email' => $row["user_email"],
                'avatar' => $row["user_avatar"],
                'created_at' => $row["user_created_at"],
                'updated_at' => $row["user_updated_at"],
            );
            $results["post"] = array(
                'id' => $row["post_id"],
                'image_path' => $row["post_image_path"],
                'content' => $row["post_content"],
                'id_userr' => $row["post_id_user"],
                'created_at' => $row["post_created_at"],
                'updated_at' => $row["post_updated_at"],
            );
        }

        $results["comments"] = $comments;
        $results["likes"] = $likes;
        $results["reactions"] = $reactions;
        $results["tags"] = $tags;

        return $results;
    }

    public static function search(PDO $connection, array $query_params, string $tags, string $endpoint_path, int $start = 0, int $limit = 10)
    {

        $parameters = self::prepareQueryParams($query_params);
        $keys = $parameters['keys'];
        $values = $parameters['values'];
        $table_name = self::getTableName(get_called_class());
        $request_body = "SELECT * FROM $table_name 
        JOIN post_tags ON posts.id = post_tags.id_post 
        WHERE post_tags.id_tag IN ($tags) AND $keys 
        ORDER BY posts.created_at DESC LIMIT $limit OFFSET $start";
        $results = Request::send($connection, $request_body, $values)->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $endpoint_path . "?start=$next_start&limit=$limit",
            "previous" => $endpoint_path . "?start=$previous_start&limit=$limit"
        );
    }
}
