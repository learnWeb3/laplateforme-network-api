<?php

class ChatUser extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

}