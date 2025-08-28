<?php

namespace App\Http\Controllers\StaffLapangan;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class StaffLapanganController extends Controller
{
    public function index()
    {
        return view('backend.stafflapangan.dashboard');
    }

   
}
