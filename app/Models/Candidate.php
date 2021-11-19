<?php

namespace App\Models;

class Candidate extends BaseModel
{
    
    protected $table = 'candidates';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id', 'resume', 'resume_headline','profile_summary','address','current_location','prefered_location','status'];
}
