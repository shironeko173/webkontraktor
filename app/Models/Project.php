<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Project extends Model
{
    use HasFactory;
    protected $table = 'project';

    protected $guarded = ['id_project'];
 
    protected $hidden = [];

    public function detail(){
        return $this->hasOne(DB::table('detail_project'));
    }
}
