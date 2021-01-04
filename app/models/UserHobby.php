<?php

class UserHobby extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function createNewUserHobby(PDO $connection, array $column_names, array $request_parameters)
    {
        UserHobby::create($connection, $column_names, $request_parameters);
        $new_user_hobby = UserHobby::lastCreatedRow($connection)->fetchAll(PDO::FETCH_ASSOC)[0];
        $hobby = Hobby::find($connection, $new_user_hobby["id_hobby"])->fetchAll(PDO::FETCH_ASSOC)[0];
        $new_user_hobby['user_hobby_id'] = $new_user_hobby['id'];
        $new_user_hobby["name"] = $hobby["name"];
        return $new_user_hobby;
    }
}
