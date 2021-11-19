<?php

namespace App\Models;

class Jobpost extends BaseModel
{
    
    protected $table = 'jobposts';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id', 'code', 'last_date','description','designation','package','job_location','status'];
}
