<?php

namespace App\Http\Controllers\StaffLapangan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class SubmitLaporanController extends Controller
{
    public function timeZone($location){
        return date_default_timezone_set($location);
    }

    public function cba(Request $request){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required',
            'jenis' => 'max:500',
            'rentang_waktu' => 'max:500',
            'ket' => 'max:500',
        ]);
        DB::table('laporan_harian_cba')->insert($validatedData);
        return Redirect::back();
    }
    public function kjpp(Request $request){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required|exists:laporan_harian,kode_laporan_harian',
            'jenis' => 'max:500',
            'rentang_jam' => 'max:500',
            'ket' => 'max:500',
        ]);
        DB::table('laporan_harian_kjpp')->insert($validatedData);
        return Redirect::back();
    }
    public function pk(Request $request){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required|exists:laporan_harian,kode_laporan_harian',
            'tugas_jabatan' => 'max:500',
            'jumlah' => 'max:500',
            'lokasi' => 'max:500',
        ]);
        DB::table('laporan_harian_pk')->insert($validatedData);
        return Redirect::back();
    }
    public function pkr(Request $request){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required|exists:laporan_harian,kode_laporan_harian',
            'jenis_pekerjaan' => 'max:500',
            'volume' => 'max:500',
            'lokasi' => 'max:500',
        ]);
        DB::table('laporan_harian_pkr')->insert($validatedData);
        return Redirect::back();
    }
    public function pr(Request $request){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required|exists:laporan_harian,kode_laporan_harian',
            'jenis' => 'max:500',
            'volume' => 'max:500',
            'lokasi' => 'max:500',
        ]);
        DB::table('laporan_harian_pr')->insert($validatedData);
        return Redirect::back();
    }
    public function tmpb(Request $request, ){
        $validatedData = $request->validate([
            'kode_laporan_harian' => 'required|exists:laporan_harian,kode_laporan_harian',
            'jenis' => 'max:500',
            'volume' => 'max:500',
            'lokasi' => 'max:500',
        ]);
        DB::table('laporan_harian_tmpb')->insert($validatedData);
        return Redirect::back();
    }
    public function kirim($idlaporan){
        $this->timeZone('Asia/Jakarta');
        
        DB::table('laporan_project')
        ->where('id_laporan', $idlaporan)
        ->update([
            'status' => 'pending',
            'waktu_dikirim' => now()
        ]);
        Alert::success('Success', 'Laporan Berhasil Dikirim');
        return Redirect::back();
    }
    public function hapus($idlaporan){
        DB::table('laporan_project')
        ->where('id_laporan', $idlaporan)
        ->delete();
        Alert::success('Success', 'Laporan Berhasil Dihapus');
        return Redirect::back();
    }

}
