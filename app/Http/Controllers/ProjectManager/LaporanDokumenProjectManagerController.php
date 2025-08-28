<?php

namespace App\Http\Controllers\ProjectManager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class LaporanDokumenProjectManagerController extends Controller
{
    public function laporanDokumen($idproject){

        $projects = DB::select("CALL pm_ld_project (?)", array($idproject));
        $project = $projects[0];
 
         return view('backend.projectmanager.laporan.laporan_dokumen.index', compact('project'));
     }
     public function laporanDokumen_pending($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('dokumen_tambahan', 'laporan_project.id_laporan', '=', 'dokumen_tambahan.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'dokumen_tambahan.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'DT')
        //      ->where('laporan_project.status', 'Pending')
        //      ->get();
             $laporan = DB::select("CALL pm_ldp_laporan (?)", array($idproject));
 
             $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();
             return view('backend.projectmanager.laporan.laporan_dokumen.pending', compact('i','detail_project', 'laporan'));
     }
     public function laporanDokumen_accept($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('dokumen_tambahan', 'laporan_project.id_laporan', '=', 'dokumen_tambahan.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'dokumen_tambahan.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'DT')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();
        $laporan = DB::select("CALL pm_lda_laporan (?)", array($idproject));
        // dd($laporan);
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.projectmanager.laporan.laporan_dokumen.accept', compact('i','laporan','detail_project'));
     }

     
}
