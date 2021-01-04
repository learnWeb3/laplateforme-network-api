<?php


define(
    "HELPERS_CLASSES",
    [
        "Autoloader",
        "Router",
        "Db",
        "ControllerInterface",
        "Request",
        "AuthenticatedRequest",
        "Image"
    ]
);


define(
    "SERVICES_CLASSES",
    []
);


define(
    "CONTROLLERS_CLASSES",
    [
        "ApplicationController",
        "ErrorsController",
        // USER 
        "UsersController",
        // USER ACTIVITY RELATED DATAS 
        "ExperiencesController",
        "TrainingsController",
        "PostReactionsController",
        "PostTagsController",
        "UserHobbiesController",
        "UserSkillsController",
        "LikesController",
        "FollowsController",
        "PostsController",
        "CommentsController",
        // ADMIN RESTRICTED CONTROLLER FOR UPDATE DELETE CREATE OPERATIONS
        "ReactionsController",
        "TagsController",
        "PromosController",
        "SkillsController",
        "HobbiesController",
        "TrainingsController",
        // UPLOADS
        "ImagesController",
        // CHATS
        "ChatsController"
    ]
);

define(
    "MODELS_CLASSES",
    [
        "Application",
        // USER RELATED MODELS//
        // USER 
        "User",
        // SKILL
        "Skill",
        "UserSkill",
        // HOBBY
        "Hobby",
        "UserHobby",
        // EXPERIENCE
        "Experience",
        // TRAINING
        "Training",
        // PROMO
        "Promo",
        // POSTS RELATED MODELS //
        // POST
        "Post",
        // COMMENT
        "Comment",
        // LIKE
        "Like",
        // FOLLOW
        "Follow",
        // TAG
        "Tag",
        "PostTag",
        //REACTION,
        "Reaction",
        "PostReaction",
        // CHATS
        "Chat",
        "ChatUser",
        "Message"
    ]
);
