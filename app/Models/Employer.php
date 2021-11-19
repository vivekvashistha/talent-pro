<?php

namespace App\Models;

class Employer extends BaseModel
{
    
    protected $table = 'employers';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id', 'logo', 'company','domains_summary','description','status'];
}
