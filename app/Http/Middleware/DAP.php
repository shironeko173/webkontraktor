<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DAP
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) // This isnt necessary, it should be part of your 'auth' middleware
        return redirect('/home');
  
      $user = Auth::user();
      if($user->jabatan == 'Direktur' || $user->jabatan == 'AdminWeb' || $user->jabatan == 'Project_Manager' ){

        return $next($request);
      } else {
        abort(403, 'Unauthorized action.');
      }
  
      return redirect('/home');
    }
}
