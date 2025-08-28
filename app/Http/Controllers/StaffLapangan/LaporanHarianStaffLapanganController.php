<?php

namespace App\Http\Controllers\StaffLapangan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class LaporanHarianStaffLapanganController extends Controller
{
    public function index($idproject){
        try{
            DB::select('CALL store_laporan_harian(?,?)',[$idproject,auth()->user()->id]);
            Alert::success('Success', 'Laporan Harian Berhasil Dibuat');
            return Redirect::back();
        }catch(QueryException $e){
            Alert::error('Ooopss!!', 'Maaf Laporan Harian Hari ini Sudah Ada');
            return Redirect::back();
        }


    }
    public function show($idlaporan){
        $status = DB::table('laporan_project')
            ->where('id_laporan', $idlaporan)->select('status')->get();
            // dd($status);
        $cba = $idlaporan . "-CBA";
        $kjpp = $idlaporan . "-KJPP";
        $PK = $idlaporan . "-PK";
        $PKR = $idlaporan . "-PKR";
        $PR = $idlaporan . "-PR";
        $TMPB = $idlaporan . "-TMPB";
        $datacba = DB::table('laporan_harian_cba')
        ->where('kode_laporan_harian', '=', $cba)->get();
        $datakjpp = DB::table('laporan_harian_kjpp')
        ->where('kode_laporan_harian', '=', $kjpp)->get();
        $datapk = DB::table('laporan_harian_pk')
        ->where('kode_laporan_harian', '=', $PK)->get();
        $datapkr = DB::table('laporan_harian_pkr')
        ->where('kode_laporan_harian', '=', $PKR)->get();
        $datapr = DB::table('laporan_harian_pr')
        ->where('kode_laporan_harian', '=', $PR)->get();
        $datatmpb = DB::table('laporan_harian_tmpb')
        ->where('kode_laporan_harian', '=', $TMPB)->get();
  
        return view('backend.stafflapangan.project.formharian', compact('datacba', 'datakjpp', 'datapk', 'datapkr', 'datapr', 'datatmpb', 'status','cba', 'kjpp',
         'PK', 'PKR', 'PR', 'TMPB')) ;
    }
    public function hapuscba(Request $request){
        $data = DB::table('laporan_harian_cba')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('jenis', '=', $request->jenis)->delete();
        return Redirect::back();
    }
    public function hapuspk(Request $request){
        $data = DB::table('laporan_harian_pk')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('tugas_jabatan', '=', $request->tugas_jabatan)->delete();
        return Redirect::back();
    }
    public function hapuspkr(Request $request){
        $data = DB::table('laporan_harian_pkr')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('jenis_pekerjaan', '=', $request->jenis_pekerjaan)->delete();
        return Redirect::back();
    }
    public function hapuspr(Request $request){
        $data = DB::table('laporan_harian_pr')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('jenis', '=', $request->jenis)->delete();
        return Redirect::back();
    }
    public function hapuskjpp(Request $request){
        $data = DB::table('laporan_harian_kjpp')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('jenis', '=', $request->jenis)->delete();
        return Redirect::back();
    }
    public function hapustmpb(Request $request){
        $data = DB::table('laporan_harian_tmpb')
        ->where('kode_laporan_harian', '=', $request->kode_laporan_harian)
        ->where('jenis', '=', $request->jenis)->delete();
        return Redirect::back();
    }
}
