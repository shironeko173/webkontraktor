<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function indexes()
    {
        $role = Auth::user()->jabatan; 
        switch ($role) {
          case 'Direktur':
            return '/direktur_dashboard';
            break;
          case 'AdminWeb':
            return '/adminweb_dashboard';
            break; 
          case 'Project_Manager':
            return '/projectmanager_dashboard';
            break; 
          case 'Admin' :
            return '/admin_dashboard';
            break; 
          case 'Drafter':
            return '/drafter_dashboard';
            break; 
          case 'Pengawas_Lapangan':
            return '/pengawaslapangan_dashboard';
            break; 
          case 'Staff': 
            return '/staff_dashboard';
            break; 
      
          default:
            return '/home'; 
          break;
        }
    }
}
