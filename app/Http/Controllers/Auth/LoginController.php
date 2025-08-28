<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string 
     */
    public function redirectTo() {
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
            return '/stafflapangan_dashboard';
            break; 
          case 'Drafter':
            return '/stafflapangan_dashboard';
            break; 
          case 'Pengawas_Lapangan':
            return '/stafflapangan_dashboard';
            break; 
          case 'Staff': 
            return '/staff_dashboard';
            break; 
      
          default:
            return '/'; 
          break;
        }
      }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
