<?php

namespace App\Models;

class Advertisement extends BaseModel
{
    
    protected $table = 'advertisements';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id', 'title' , 'image', 'description','status'];
}
