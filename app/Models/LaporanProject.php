<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanProject extends Model
{
    use HasFactory;
    protected $table = 'laporan_project';

    protected $guarded = ['id_project'];
 
    protected $hidden = [];
}
