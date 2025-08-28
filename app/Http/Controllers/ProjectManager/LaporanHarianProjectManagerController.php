<?php

namespace App\Http\Controllers\ProjectManager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use RealRashid\SweetAlert\Facades\Alert;

class LaporanHarianProjectManagerController extends Controller
{
     // laman awal laporan harian
     public function laporanHarian($idproject){

     //    $project = DB::table('project')
     //         ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
     //         ->select('project.*', 'detail_project.nama_project')
     //         ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL pm_lh_project (?)", array($idproject));
        $project = $projects[0];
 
         return view('backend.projectmanager.laporan.laporan_harian.index', compact('project'));
     }
     
    //  untuk view laporan harian
     public function laporanHarian_view($idlaporan){
 
     //    $identify = DB::table('laporan_project')
     //    ->join('detail_project', 'laporan_project.id_project', '=', 'detail_project.id_project')
     //    ->join('users', 'laporan_project.id_user', '=', 'users.id')
     //    ->where('laporan_project.id_laporan', $idlaporan)
     //    ->select('laporan_project.*','detail_project.nama_project', 'users.name')->first();

          $identifys = DB::select("CALL pm_lhv_identify (?)", array($idlaporan));
          $identify = $identifys[0];
          // dd($identify);
        $i = 1;
        $kode_pkr = $idlaporan.'-PKR';
        $data_pkr = DB::table('laporan_harian_pkr')->where('kode_laporan_harian', $kode_pkr)->get();

        $kode_cba = $idlaporan.'-CBA';
        $data_cba = DB::table('laporan_harian_cba')->where('kode_laporan_harian', $kode_cba)->get();

        $kode_kjpp = $idlaporan.'-KJPP';
        $data_kjpp = DB::table('laporan_harian_kjpp')->where('kode_laporan_harian', $kode_kjpp)->get();

        $kode_pk = $idlaporan.'-PK';
        $data_pk = DB::table('laporan_harian_pk')->where('kode_laporan_harian', $kode_pk)->get();

        $kode_pr = $idlaporan.'-PR';
        $data_pr = DB::table('laporan_harian_pr')->where('kode_laporan_harian', $kode_pr)->get();

        $kode_tmpb = $idlaporan.'-TMPB';
        $data_tmpb = DB::table('laporan_harian_tmpb')->where('kode_laporan_harian', $kode_tmpb)->get();

        return view('backend.projectmanager.laporan.laporan_harian.view', compact('i','identify','data_pkr','data_cba','data_kjpp','data_pk','data_pk','data_pr','data_tmpb'));
     }

    //  untuk memverifikasi laporan harian
     public function laporanHarian_pending($idproject){
        $i = 1;
     //    $laporan = DB::table('laporan_project')
     //         ->join('users', 'laporan_project.id_user', '=', 'users.id')
     //         ->select('laporan_project.*', 'users.name')
     //         ->where('laporan_project.id_project', $idproject)
     //         ->where('laporan_project.id_type', 'LH')
     //         ->where('laporan_project.status', 'Pending')
     //         ->get();
     
          $laporan = DB::select("CALL pm_lhp_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();
         return view('backend.projectmanager.laporan.laporan_harian.pending', compact('i','detail_project', 'laporan'));
     }

     //  untuk menampilkan laporan harian yang sudah diverif
     public function laporanHarian_accept($idproject){
 
        $i = 1;
      //   $laporan = DB::table('laporan_project')
      //        ->join('users', 'laporan_project.id_user', '=', 'users.id')
      //        ->select('laporan_project.*', 'users.name')
      //        ->where('laporan_project.id_project', $idproject)
      //        ->where('laporan_project.id_type', 'LH')
      //        ->where('laporan_project.status', 'Accept')
      //        ->get();
          $laporan = DB::select("CALL pm_lha_laporan (?)", array($idproject));
         //  dd($laporan);
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.projectmanager.laporan.laporan_harian.accept', compact('i','laporan','detail_project'));
     }
}
