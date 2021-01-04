<?php

require_once "./vendor/autoload.php";
require_once "./app/config/db_credentials.php";
require_once "./app/config/jwt_secret.php";
require_once "./app/config/paths.php";
require_once "./app/helpers/Request.php";
require_once "./app/helpers/Db.php";
require_once './app/models/Application.php';
require_once './app/models/Comment.php';
require_once './app/models/Experience.php';
require_once './app/models/Follow.php';
require_once './app/models/Hobby.php';
require_once './app/models/Like.php';
require_once './app/models/Message.php';
require_once './app/models/Post.php';
require_once './app/models/PostReaction.php';
require_once './app/models/Promo.php';
require_once './app/models/Reaction.php';
require_once './app/models/Skill.php';
require_once './app/models/Tag.php';
require_once './app/models/PostTag.php';
require_once './app/models/Training.php';
require_once './app/models/User.php';
require_once './app/models/UserHobby.php';
require_once './app/models/UserSkill.php';

$connection = Db::connect();
$faker = Faker\Factory::create();


// destroy all tables entries 
$models = ["User", "Post", "Comment", "Experience", "Hobby", "Skill", "Reaction", "Training", "UserHobby", "UserSkill", "Tag", "Promo", "PostReaction", "Message", "Like", "Follow", "PostTag"];
foreach ($models as $index => $model_name) {
    $model_name::destroyAll($connection);
}

// seed reactions
$emojis = [
    "😂",
    "😃",
    "😅",
    "😟"
];
for ($i = 0; $i < count($emojis); $i++) {
    Reaction::create($connection, ['type'], [$emojis[$i]]);
    echo "$i reaction(s) created \n";
}

// seed skills
$skills = ['php', 'mysql', 'javascript', 'python', 'ruby', 'team work', 'figma', 'design'];
for ($i = 0; $i < count($skills); $i++) {
    Skill::create($connection, ['name'], [$skills[$i]]);
    echo "$i skill(s) created \n";
}

// seed hobbies
$hobbies = ['sport', 'cinema', 'lecture', 'danse', 'musique', 'jeux videos'];
for ($i = 0; $i < count($hobbies); $i++) {
    Hobby::create($connection, ['name'], [$hobbies[$i]]);
    echo "$i hoob(y)(ies) created \n";
}

// seed tags
$tags = ['actualité', 'important', 'urgent', 'bonne affaire'];
for ($i = 0; $i < count($tags); $i++) {
    Tag::create($connection, ['name'], [$tags[$i]]);
    echo "$i tag(s) created \n";
}

// seed trainings
$trainings = ['secu-web', 'ai-school', 'coding-school'];
for ($i = 0; $i < count($trainings); $i++) {
    Training::create($connection, ['name'], [$trainings[$i]]);
    echo "$i training(s) created \n";
}

// seed promos
$promos = ['coding-school 2020-1', 'coding-school 2020-2', 'coding-school 2021-1', 'coding-school 2021-2', 'secu-web 2020-1', 'secu-web 2020-2', 'secu-web 2021-1', 'secu-web 2021-2', 'ai-school 2020-1', 'ai-school 2020-2', 'ai-school 2021-1', 'ai-school 2021-2'];
for ($i = 0; $i < count($promos); $i++) {
    Promo::create($connection, ['name'], [$promos[$i]]);
    echo "$i promo(s) created \n";
}

// seed users
for ($i = 0; $i < 50; $i++) {
    User::signUp($connection, $faker->email, 'foobar', 'foobar');
    echo "$i user(s) created \n";
}

// seed posts
$users = User::all($connection, '/users', 0, 100)['data'];
for ($i = 0; $i < 100; $i++) {
    $random_user_index = array_rand($users);
    Post::create($connection, ['id_user', 'content', 'image_path'], [$users[$random_user_index]['id'], $faker->text($maxNbChars = 200), "1609014573-cover.jpg"]);
    echo "$i post(s) created \n";
}

//seed comments 
$posts = Post::all($connection,  "/posts", 0, 100)['data'];
for ($i = 0; $i < 100; $i++) {
    $random_post_index = array_rand($posts);
    Comment::create($connection, ['id_user', 'id_post', 'content'], [$users[$random_user_index]['id'], $posts[$random_post_index]['id'], $faker->text($maxNbChars = 200)]);
    echo "$i comment(s) created \n";
}

// seed posts reactions
$reactions = Reaction::all($connection, "/reactions")["data"];

for ($i = 0; $i < 100; $i++) {
    $random_reaction_index = array_rand($reactions);
    PostReaction::create($connection, ['id_user', 'id_post', 'id_reaction'], [$users[$random_user_index]['id'], $posts[$random_post_index]['id'], $reactions[$random_reaction_index]['id']]);
    echo "$i post_reaction(s) created \n";
}

// seed user skills
$skills = Skill::all($connection, "/skills", 0, 100)['data'];
for ($i = 0; $i < 100; $i++) {
    $random_skill_index = array_rand($skills);
    UserSkill::create($connection, ['id_user', 'id_skill'], [$users[$random_user_index]['id'], $skills[$random_skill_index]['id']]);
    echo "$i user_skill(s) created \n";
}

// seed user hobbies

$hobbies = Hobby::all($connection, "/hobbies", 0, 100)['data'];
for ($i = 0; $i < 100; $i++) {
    $random_hobby_index = array_rand($hobbies);
    UserHobby::create($connection, ['id_user', 'id_hobby'], [$users[$random_user_index]['id'], $hobbies[$random_hobby_index]['id']]);
    echo "$i hobb(y)(ies) created \n";
}

// seed likes
for ($i = 0; $i < 100; $i++) {
    $random_user_index = array_rand($users);
    $random_post_index = array_rand($posts);
    Like::create($connection, ['id_user', 'id_post'], [$users[$random_user_index]['id'], $posts[$random_post_index]['id']]);
    echo "$i like(s) created \n";
}

// seed follows

for ($i = 0; $i < 100; $i++) {
    $random_follower_index = array_rand($users);
    $random_followed_index = array_rand($posts);
    Follow::create($connection, ['id_follower', 'id_followed'], [$users[$random_follower_index]['id'], $posts[$random_followed_index]['id']]);
    echo "$i follow(s) created \n";
}

// seed experiences

for ($i = 0; $i < 100; $i++) {
    $random_follower_index = array_rand($users);
    $random_followed_index = array_rand($posts);
    $current_time_start = strftime("%Y-%m-%d %T", time() + rand(0, 250000));
    $current_time_end = strftime("%Y-%m-%d %T", time() + rand(0, 250000));
    Experience::create(
        $connection,
        ['id_user', 'start_date', 'end_date', 'job_name', 'company', 'city', 'country'],
        [$users[$random_follower_index]['id'], $current_time_start, $current_time_end, $faker->jobTitle, $faker->company, $faker->city, $faker->country]
    );
    echo "$i experience(s) created \n";
}

// seed post tags
$tags = Tag::all($connection, "/tags", 0, 100)["data"];


for ($i = 0; $i < 100; $i++) {
    $random_post_index = array_rand($posts);
    $random_tag_index = array_rand($tags);
    PostTag::create($connection, ['id_post', 'id_tag'], [$posts[$random_post_index]['id'], $tags[$random_tag_index]['id']]);
    echo "$i tag(s) created \n";
}
