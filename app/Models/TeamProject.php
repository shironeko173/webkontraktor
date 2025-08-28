<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeamProject extends Model
{
    use HasFactory;
    protected $table = 'detail_project';

    protected $guarded = ['id_project', 'id_user'];
 
    protected $hidden = [];
}
