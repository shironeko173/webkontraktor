<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

class AkunController extends Controller
{
    public function editakun()
    {
        $user = User::where('id', Auth::user()->id)->first();
        return view('backend.akunsetting.edituser', compact('user'));
    } 
 
    public function updateakun(Request $request)
    {
        // dd($request);
        $user = User::where('id', Auth::user()->id)->first();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();

        if($user->save()){
            Alert::success('Success', 'User Berhasil Diupdate');
            return back();
        } else {
            Alert::error('Oopss!!', 'Update Akun Gagal!');
            return back();
        }
    }

    public function editpassword(){
        
        $user = User::where('id', Auth::user()->id)->first();
        return view('backend.akunsetting.editpass', compact('user'));
    } 

    public function updatepassword(Request $request){
        $request->validate([
            'pass_lama' => ['required'],
            'pass_baru' => ['required', 'min:8']
        ]);

        if(Hash::check($request->pass_lama, Auth::user()->password)){
            Auth::user()->update(['password' => Hash::make($request->pass_baru)]);
            Alert::success('Success', 'Password Berhasil Diubah');
            return back();
        } else {
            Alert::error('Oopss!!', 'Maaf, Password lama anda salah');
            return back();
        }
            
    }


}
