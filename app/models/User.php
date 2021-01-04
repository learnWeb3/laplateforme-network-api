<?php

use \Firebase\JWT\JWT;

class User extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function getUsers(PDO $connection, array $parameters, int $limit, int $offset)
    {
        if (!empty($parameters)) {
            $users = User::searchByString($connection, $parameters, "/users", $offset, $limit);
        } else {
            $users = User::all($connection, "/users", $offset, $limit);
        }
        return $users;
    }


    public function getChats(PDO $connection)
    {
        $request_body = "SELECT 
        chats.id,
        chats.created_at,
        (SELECT COUNT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_count,
        (SELECT GROUP_CONCAT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_ids,
        (SELECT COUNT(messages.id) as message_count FROM messages WHERE messages.id_chat = chats.id) as message_count
        FROM chats 
        JOIN chat_users ON chats.id=chat_users.id_chat
        WHERE chat_users.id_user = ?";

        $request = Request::send($connection, $request_body, [$this->id]);
        $results = [];
        while ($row = $request->fetch()) {
            $results[] = array(
                "id" => $row["id"],
                "created_at" => $row["created_at"],
                "subscriber_count" => $row["subscriber_count"],
                "message_count" => $row["message_count"],
                "subscriber_ids" => !empty($row["subscriber_ids"]) ? array_map(function ($el) {
                    return intval($el);
                },  explode(',', $row["subscriber_ids"])) : [],
                "subscribers" => Chat::getSubscriberData($connection, $row["subscriber_ids"])
            );
        }
        return $results;
    }

    // CAN BE REPLACED BY WHERE 
    public function getComments(PDO $connection)
    {
        $request_body = "SELECT * FROM comments WHERE id_user=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSkills(PDO $connection)
    {

        $request_body = "SELECT skills.*, user_skills.id as user_skill_id FROM skills 
        INNER JOIN user_skills ON user_skills.id_skill = skills.id 
        INNER JOIN users ON user_skills.id_user = users.id
        WHERE users.id=?";

        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getReactions(PDO $connection)
    {

        $request_body = "SELECT reactions.*, post_reactions.id FROM users
        INNER JOIN post_reactions ON users.id = post_reactions.id_user
        INNER JOIN reactions ON post_reactions.id_reaction = reactions.id
        WHERE users.id=?";

        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getHobbies(PDO $connection)
    {
        $request_body = "SELECT hobbies.*, user_hobbies.id as user_hobby_id FROM users
        INNER JOIN user_hobbies ON users.id=user_hobbies.id_user
        INNER JOIN hobbies ON hobbies.id=user_hobbies.id_hobby
        WHERE users.id=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getExperiences(PDO $connection)
    {
        $request_body = "SELECT * FROM experiences WHERE id_user=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPromos(PDO $connection)
    {
        $request_body = "SELECT promos.* FROM users
        INNER JOIN promos ON users.id_promo = promos.id
        WHERE users.id=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getTraining(PDO $connection)
    {
        $request_body = "SELECT training.* FROM users
        INNER JOIN trainings ON users.id_training = trainings.id
        WHERE users.id=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getLikes(PDO $connection)
    {
        $request_body = "SELECT likes.* FROM likes WHERE id_user=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFollows(PDO $connection)
    {
        $request_body = "SELECT follows.* FROM follows WHERE id_follower=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFollowers(PDO $connection)
    {
        $request_body = "SELECT follows.* FROM follows WHERE id_followed=?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getFeedContent(PDO $connection, $endpoint_path, $offset, $limit)
    {
        $request_body = "SELECT * 
        FROM posts WHERE
        id_user 
        IN (SELECT 
        GROUP_CONCAT(follows.id_followed) 
        FROM follows WHERE follows.id_follower=?)
        OR id_user=?
        ORDER BY posts.created_at DESC LIMIT $limit OFFSET $offset";
        $results = Request::send($connection, $request_body, [$this->id, $this->id])->fetchAll(PDO::FETCH_ASSOC);
        if (empty($results) && $offset = 0) {
            $results = Post::all($connection, $endpoint_path, $offset, $limit);
        } else {
            $next_start = $offset += 10;
            $previous_start = $offset - 10 >= 0 ? $offset - 10 : 0;
            return  array(
                "data" => $results,
                "next" => $endpoint_path . "?start=$next_start&limit=$limit",
                "previous" => $endpoint_path . "?start=$previous_start&limit=$limit"
            );
        }
    }


    public function getProfile(PDO $connection, $endpoint_path, $offset, $limit)
    {
        $posts = Post::where($connection, "id_user", $this->id)->fetchAll(PDO::FETCH_ASSOC);
        $comments = $this->getComments($connection);
        $likes = $this->getLikes($connection);
        $experiences = $this->getExperiences($connection);
        $skills = $this->getSkills($connection);
        $follows = $this->getFollows($connection);
        $hobbies = $this->getHobbies($connection);
        $reactions = $this->getReactions($connection);
        $feed_content = $this->getFeedContent($connection, $endpoint_path, $offset, $limit);
        $followers = $this->getFollowers($connection);
        $follows = $this->getFollows($connection);

        $request_body = "SELECT 

        -- USERS
        users.id as user_id ,
        users.firstname as user_firstname,
        users.lastname as user_lastname,
        users.email as user_email,
        users.birthdate as user_birthdate,
        users.avatar as user_avatar,
        users.cover as user_cover,
        users.linkedin as user_linkedin,
        users.github as user_github,
        users.website as user_website,
        users.description as user_description,
        users.id_promo as user_id_promo,
        users.id_training as user_id_training,
        users.created_at as user_created_at,
        users.updated_at as user_updated_at,
        -- TRAINING
        trainings.id as training_id,
        trainings.name as training_name,
        trainings.created_at as training_created_at,
        trainings.updated_at as training_updated_at,
        -- PROMOS
        promos.id as promo_id,
        promos.name as promo_name,
        promos.created_at as promo_created_at,
        promos.updated_at as promo_updated_at

        FROM users
        LEFT JOIN trainings ON trainings.id = users.id_training
        LEFT JOIN promos ON promos.id = users.id_promo
        WHERE users.id=?";

        $request = Request::send($connection, $request_body, [$this->id]);

        $results = [];

        while ($row = $request->fetch()) {
            $results["user"] =  array(
                'id' => $row["user_id"],
                'firstname' => $row["user_firstname"],
                'lastname' => $row["user_lastname"],
                'email' => $row["user_email"],
                'birthdate' => $row["user_birthdate"],
                'avatar' => $row["user_avatar"],
                'cover' => $row["user_cover"],
                'linkedin' => $row["user_linkedin"],
                'github' => $row["user_github"],
                'website' => $row["user_website"],
                'description' => $row["user_description"],
                'id_promo' => $row["user_id_promo"],
                'created_at' => $row["user_created_at"],
                'updated_at' => $row["user_updated_at"],
            );
            $results["training"] = array(
                'id' => $row["training_id"],
                'name' => $row["training_name"],
                'created_at' => $row["training_created_at"],
                'updated_at' => $row["training_updated_at"],
            );

            $results["promos"] = array(
                'id' => $row["promo_id"],
                'name' => $row["promo_name"],
                'created_at' => $row["promo_created_at"],
                'updated_at' => $row["promo_updated_at"],
            );
        }

        $results["skills"] = $skills;
        $results["experiences"] = $experiences;
        $results["posts"] = $posts;
        $results["comments"] = $comments;
        $results["likes"] = $likes;
        $results["follows"] = $follows;
        $results["hobbies"] = $hobbies;
        $results["reactions"] = $reactions;
        $results["feed_content"] = $feed_content;
        $results["followers"] = $followers;
        $results["follows"] = $follows;

        return $results;
    }


    public static function signIn(PDO $connection, string $email, string $password)
    {
        $request_body = 'SELECT * from users where email=?';
        $potential_user = Request::send($connection, $request_body, [$email])->fetchAll(PDO::FETCH_ASSOC);
        if (empty($potential_user)) {
            throw new Exception("invalid informations");
        } else {
            if (password_verify($password, $potential_user[0]['password'])) {
                $date = new DateTime();
                $payload = array(
                    "sub" => json_encode($potential_user[0]),
                    "iat" => $date->getTimestamp(),
                );
                return array(
                    'user' => $potential_user[0],
                    'jwt_token' => JWT::encode($payload, JWT_SECRET_KEY)
                );
            } else {
                throw new Exception("invalid informations");
            }
        }
    }

    public static function signUp(PDO $connection, string $email, string $password, string $password_confirmation)
    {

        if ($password === $password_confirmation) {
            User::create($connection, ['email', 'password'], [$email, password_hash($password, PASSWORD_BCRYPT)]);
            return User::lastCreatedRow($connection)->fetchAll(PDO::FETCH_ASSOC)[0];
        } else {
            return array('message' => 'passwords does not match');
        }
    }
}
