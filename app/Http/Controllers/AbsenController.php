<?php

namespace App\Http\Controllers;

use App\Models\Absen;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class AbsenController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function timeZone($location){
        return date_default_timezone_set($location);
    }

    public function index()
    {

        $this->timeZone('Asia/Jakarta');
        $id_user = Auth::user()->id;
        $date = date("Y-m-d");
        $cek_absen = Absen::where(['id_user' => $id_user, 'date' => $date])->first();

        if (is_null($cek_absen)) {
            $info = array(
                "status" => "Anda belum mengisi absensi!",
                "btnIn" => "",
                "btnOut" => "disabled"
            );
        } elseif ($cek_absen->time_out == NULL) {
            $info = array(
                "status" => "Jangan lupa absen keluar",
                "btnIn" => "disabled",
                "btnOut" => ""
            );
        } else {
            $info = array(
                "status" => "Absensi hari ini telah selesai!",
                "btnIn" => "disabled",
                "btnOut" => "disabled"
            );
            }
        $data_absen = Absen::where('id_user', $id_user)
                    ->orderBy('date', 'desc')
                    ->paginate(1);
        
        $id_user = Auth()->user()->id;
        return view('backend.staff.absen', compact('data_absen', 'cek_absen', 'info','id_user'));
    }

    public function absen(Request $request){
        $this->timeZone('Asia/Jakarta');
        $id_user = Auth::user()->id;
        $date = date("Y-m-d");//2022-11-19
        $time = date("H:i:s");// 12:31:20
        $note = $request->note;

        $absen = new Absen;
                   
        //absen masuk
        if ($request->btnIn) {
            //check double data
            $cek_double = $absen->where(['date' => $date, 'id_user' => $id_user])
                                ->count();
            if ($cek_double > 0 ) {
                Alert::error('Oopss!!', 'Absen hari ini sudah ada');
                return redirect()->back();
             } 
            $absen->create([
               'id_user' => $id_user,
               'date' => $date,
               'time_in' => $time,
               'note' => $note]);
               Alert::success('Success', 'Absen Masuk berhasil');
               return redirect()->back();

            return "absen masuk";
        }
        //absen keluar
        elseif ($request->btnOut) {
            $absen->where(['date' => $date, 'id_user' => $id_user])
                 ->update([
                     'time_out' => $time,
                     'note' => $note]);
            Alert::success('Success', 'Absen Keluar berhasil');
            return redirect()->back();
        }
        return $request->all();
    }
    
//for AdminWeb
    public function tampilAbsen(){
        $data_akun = User::where('jabatan','Staff')->get();
        return view('backend.adminweb.laporanAll', compact('data_akun'));
    }

    public function filterAbsen(Request $request, $iduser){
        $date = date("Y-m-d");
        $tgl_mulai =$request->tgl_mulai;
        $tgl_selesai =$request->tgl_selesai;
        
        $id_user = $iduser;
 
        if($tgl_mulai AND $tgl_selesai){
           
            $data_absen = DB::select("CALL filter_absen (?, ?, ?)", array($tgl_mulai,$tgl_selesai,$id_user));
            

        }else{
            $data_absen = Absen::where('id_user', $id_user)
                    ->orderBy('date', 'desc')
                    ->get();
        }

        $cek_absen = Absen::where(['id_user' => $id_user, 'date' => $date])
        ->first();
            if (is_null($cek_absen)) {
            $info = array(
            "status" => "Anda belum mengisi absensi!",
            "btnIn" => "",
            "btnOut" => "disabled"
            );
            } elseif ($cek_absen->time_out == NULL) {
            $info = array(
            "status" => "Jangan lupa absen keluar",
            "btnIn" => "disabled",
            "btnOut" => ""
            );
            } else {
            $info = array(
            "status" => "Absensi hari ini telah selesai!",
            "btnIn" => "disabled",
            "btnOut" => "disabled"
            );
            }
        
        $get_user = User::where('id' , $iduser)->get();
        // $nama_user = $get_user->name;

        return view('backend.adminweb.laporan', compact('data_absen', 'cek_absen', 'info', 'id_user', 'get_user'));
    }

    public function myAbsen(Request $request){
        $date = date("Y-m-d");
        $tgl_mulai =$request->tgl_mulai;
        $tgl_selesai =$request->tgl_selesai;
        
        $id_user = Auth::user()->id;

        if($tgl_mulai AND $tgl_selesai){
           
            $data_absen = DB::select("CALL filter_absen (?, ?, ?)", array($tgl_mulai,$tgl_selesai,$id_user));
            

        }else{
            $data_absen = Absen::where('id_user', $id_user)
                    ->orderBy('date', 'desc')
                    ->get();
        }

        $cek_absen = Absen::where(['id_user' => $id_user, 'date' => $date])
        ->first();
            if (is_null($cek_absen)) {
            $info = array(
            "status" => "Anda belum mengisi absensi!",
            "btnIn" => "",
            "btnOut" => "disabled"
            );
            } elseif ($cek_absen->time_out == NULL) {
            $info = array(
            "status" => "Jangan lupa absen keluar",
            "btnIn" => "disabled",
            "btnOut" => ""
            );
            } else {
            $info = array(
            "status" => "Absensi hari ini telah selesai!",
            "btnIn" => "disabled",
            "btnOut" => "disabled"
            );
            }
        
        $get_user = User::where('id' , $id_user)->get();
        // $nama_user = $get_user->name;

        return view('backend.adminweb.laporan', compact('data_absen', 'cek_absen', 'info', 'id_user', 'get_user'));
    }
}
