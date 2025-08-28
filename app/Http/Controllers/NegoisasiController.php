<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\EmailController;

class NegoisasiController extends Controller
{
    public function index(){
        return view('formclient');
    }
        public function negoisasi(Request $request){
            $count =1 + DB::table('client')->max('id_client');
            DB::table('client')->insert([
                'id_client' => $count,
                'name' => $request->name,
                'nohp' => $request->nohp,
                'email' => $request->email,
                'created_at' => now()
              
            ]);
            DB::table('negosiasi')->insert([
                'id_client' => $count,
                'alamat' => $request->alamat,
                'desc' => $request->desc,
                'type' => $request->type,
              
            ]);
            $data = [
             'email'    =>$request->email,
             'name'     =>$request->name,
             'nohp'     =>$request->nohp,
             'desc'     =>$request->desc,
             'type'     =>$request->type,
             'alamat'   =>$request->alamat,
            ];
            new EmailController(
             $data
                
            );
            
            if($count + 1){
                return redirect('/form')->with('status','Project Berhasil Diajukan!');
            } else {
                return redirect('/form')->with('status','Project Gagal Diajukan!');
            }
      
        }
}
