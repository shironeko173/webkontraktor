<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Negosiasi extends Model
{
    use HasFactory;
    protected $table = 'negosiasi';

    protected $guarded = ['id_negosiasi'];
 
    protected $hidden = [];
}
