<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DirekturController extends Controller
{
    public function index()
    {
        return view('backend.direktur.dashboard');
    }

    public function monitoring()
    {
        
        return view('backend.direktur.monitoring');
    }

    public function show()
    {
        $data = DB::table('monitoring_log_activity')->orderBy('date_time', 'desc')->paginate(10);
        return view('backend.direktur.show')->with([
            'data' => $data,
        ]);
        // return response()->json([
        //     'data' => $data,
        // ]);
    }
}
