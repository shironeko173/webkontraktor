<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Absen extends Model
{
    use HasFactory;

    protected $table = 'absen';

    protected $guarded = ['id_absen'];

    protected $fillable = [
        'id_user',
        'date',
        'time_in',
        'time_out',
        'note',
    ];
 
    protected $hidden = [];

    public function user()
    {
        return $this->hasMany(User::class);
    }
}
 