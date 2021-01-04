<?php

class UserSkill extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function createNewUserSkill(PDO $connection, array $column_names, array $request_parameters)
    {
        UserSkill::create($connection, $column_names, $request_parameters);
        $new_user_skill = UserSkill::lastCreatedRow($connection)->fetchAll(PDO::FETCH_ASSOC)[0];
        $skill = Skill::find($connection, $new_user_skill["id_skill"])->fetchAll(PDO::FETCH_ASSOC)[0];
        $new_user_skill['user_skill_id'] = $new_user_skill['id'];
        $new_user_skill["name"] = $skill["name"];
        return $new_user_skill;
    }
}
