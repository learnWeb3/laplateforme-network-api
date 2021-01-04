<?php

define(

    "ROUTES",
    array(
        // /
        array("method" => "GET", "path" => '/', "route" => "users#index"),
        // /users
        array("method" => "GET", "path" => '/' . 'users', "route" => "users#index"),
        array("method" => "POST", "path" => '/' . 'users', "route" => "users#create"),
        array("method" => "POST", "path" => '/' . 'signin', "route" => "users#signin"),
        array("method" => "GET", "path" => '/' . 'signin', "route" => "users#signin"),
        array("method" => "GET", "path" => '/' . 'users' . '/:user_id', "route" => "users#show"),
        array("method" => "PUT", "path" => '/' . 'users' . '/:user_id', "route" => "users#update"),
        array("method" => "DELETE", "path" => '/' . 'users' . '/:user_id', "route" => "users#delete"),
        // GOOGLE AUTH
        array("method" => "GET", "path" => '/' .'connect', "route" =>"google#connectUser"),
        // /posts
        array("method" => "GET", "path" => '/' . 'posts', "route" => "posts#index"),
        array("method" => "GET", "path" => '/' . 'posts' .  '/:post_id', "route" => "posts#show"),
        array("method" => "DELETE", "path" => '/' . 'posts' .  '/:post_id', "route" => "posts#delete"),
        array("method" => "PUT", "path" => '/' . 'posts' .  '/:post_id', "route" => "posts#update"),
        array("method" => "POST", "path" => '/' . 'posts', "route" => "posts#create"),
        // /comments
        array("method" => "GET", "path" => '/' . 'comments', "route" => "comments#index"),
        array("method" => "GET", "path" => '/' . 'comments' .  '/:comment_id', "route" => "comments#show"),
        array("method" => "DELETE", "path" => '/' . 'comments' .  '/:comment_id', "route" => "comments#delete"),
        array("method" => "PUT", "path" => '/' . 'comments' .  '/:comment_id', "route" => "comments#update"),
        array("method" => "POST", "path" => '/' . 'comments', "route" => "comments#create"),
        // /likes
        array("method" => "POST", "path" => '/' . 'likes', "route" => "likes#create"),
        array("method" => "DELETE", "path" => '/' . 'likes' .  '/:like_id', "route" => "likes#delete"),
        // /follows
        array("method" => "POST", "path" => '/' . 'follows', "route" => "follows#create"),
        array("method" => "DELETE", "path" => '/' . 'follows' .  '/:follow_id', "route" => "follows#delete"),
        // /post_reactions
        array("method" => "POST", "path" => '/' . 'post_reactions', "route" => "postReactions#create"),
        array("method" => "DELETE", "path" => '/' . 'post_reactions' .  '/:post_reaction_id', "route" => "postReactions#delete"),
        // /post_tags
        array("method" => "POST", "path" => '/' . 'post_tags', "route" => "postTags#create"),
        array("method" => "DELETE", "path" => '/' . 'post_tags' .  '/:post_tag_id', "route" => "postTags#delete"),
        // /user_hobbies
        array("method" => "POST", "path" => '/' . 'user_hobbies', "route" => "userHobbies#create"),
        array("method" => "DELETE", "path" => '/' . 'user_hobbies' .  '/:user_hobby_id', "route" => "userHobbies#delete"),
        // /user_skills
        array("method" => "POST", "path" => '/' . 'user_skills', "route" => "userSkills#create"),
        array("method" => "DELETE", "path" => '/' . 'user_skills' .  '/:user_skill_id', "route" => "userSkills#delete"),
        // /experiences
        array("method" => "POST", "path" => '/' . 'experiences', "route" => "experiences#create"),
        array("method" => "DELETE", "path" => '/' . 'experiences' .  '/:experience_id', "route" => "experiences#delete"),
        array("method" => "PUT", "path" => '/' . 'experiences' .  '/:experience_id', "route" => "experiences#update"),
        // ADMIN RESTRICTED CONTROLLER FOR UPDATE CREATE AND DELETION OPERATIONS
        // /skills
        array("method" => "GET", "path" => '/' . 'skills', "route" => "skills#index"),
        array("method" => "POST", "path" => '/' . 'skills', "route" => "skills#create"),
        array("method" => "GET", "path" => '/' . 'skills' .  '/:skill_id', "route" => "skills#show"),
        array("method" => "PUT", "path" => '/' . 'skills' .  '/:skill_id', "route" => "skills#update"),
        array("method" => "DELETE", "path" => '/' . 'skills' .  '/:skill_id', "route" => "skills#delete"),
        // /hobbies
        array("method" => "GET", "path" => '/' . 'hobbies', "route" => "hobbies#index"),
        array("method" => "POST", "path" => '/' . 'hobbies', "route" => "hobbies#create"),
        array("method" => "DELETE", "path" => '/' . 'hobbies' .  '/:hobby_id', "route" => "hobbies#delete"),
        array("method" => "GET", "path" => '/' . 'hobbies' .  '/:hobby_id', "route" => "hobbies#show"),
        array("method" => "PUT", "path" => '/' . 'hobbies' .  '/:hobby_id', "route" => "hobbies#update"),
        // /reactions
        array("method" => "GET", "path" => '/' . 'reactions', "route" => "reactions#index"),
        array("method" => "POST", "path" => '/' . 'reactions', "route" => "reactions#create"),
        array("method" => "DELETE", "path" => '/' . 'reactions' .  '/:reaction_id', "route" => "reactions#delete"),
        array("method" => "GET", "path" => '/' . 'reactions' .  '/:reaction_id', "route" => "reactions#show"),
        array("method" => "PUT", "path" => '/' . 'reactions' .  '/:reaction_id', "route" => "reactions#update"),
        // /tags
        array("method" => "GET", "path" => '/' . 'tags', "route" => "tags#index"),
        array("method" => "POST", "path" => '/' . 'tags', "route" => "tags#create"),
        array("method" => "DELETE", "path" => '/' . 'tags' .  '/:tag_id', "route" => "tags#delete"),
        array("method" => "GET", "path" => '/' . 'tags' .  '/:tag_id', "route" => "tags#show"),
        array("method" => "PUT", "path" => '/' . 'tags' .  '/:tag_id', "route" => "tags#update"),
        // /promos
        array("method" => "GET", "path" => '/' . 'promos', "route" => "promos#index"),
        array("method" => "POST", "path" => '/' . 'promos', "route" => "promos#create"),
        array("method" => "DELETE", "path" => '/' . 'promos' .  '/:promo_id', "route" => "promos#delete"),
        array("method" => "GET", "path" => '/' . 'promos' .  '/:promo_id', "route" => "promos#show"),
        array("method" => "PUT", "path" => '/' . 'promos' .  '/:promo_id', "route" => "promos#update"),
        // /trainings
        array("method" => "GET", "path" => '/' . 'trainings', "route" => "trainings#index"),
        array("method" => "POST", "path" => '/' . 'trainings', "route" => "trainings#create"),
        array("method" => "DELETE", "path" => '/' . 'trainings' .  '/:training_id', "route" => "trainings#delete"),
        array("method" => "GET", "path" => '/' . 'trainings' .  '/:training_id', "route" => "trainings#show"),
        array("method" => "PUT", "path" => '/' . 'trainings' .  '/:training_id', "route" => "trainings#update"),
        // /images
        array("method" => "POST", "path" => '/' . 'images', "route" => "images#upload"),
        array("method" => "GET", "path" => '/' . 'images' . "/:file", "route" => "images#show"),
        // /chats
        array("method" => "GET", "path" => '/' . 'chats', "route" => "chats#index"),
        array("method" => "GET", "path" => '/' . 'chats' .  '/:chat_id', "route" => "chats#show"),
        array("method" => "POST", "path" => '/' . 'chats', "route" => "chats#create"),
        array("method" => "DELETE", "path" => '/' . 'chats' .  '/:chat_id', "route" => "chats#delete"),
    )

);
