<?php

namespace App\Http\Controllers\ProjectManager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class LaporanProgressProjectManagerController extends Controller
{
    public function laporanProgress($idproject){

        // $project = DB::table('project')
        //      ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //      ->select('project.*', 'detail_project.nama_project')
        //      ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL pm_lp_project (?)", array($idproject));
        $project = $projects[0];
 
         return view('backend.projectmanager.laporan.laporan_progress.index', compact('project'));
     }
     public function laporanProgress_pending($idproject){
 
        $i = 1; 
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_progress', 'laporan_project.id_laporan', '=', 'laporan_progress.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_progress.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LP')
        //      ->where('laporan_project.status', 'Pending')
        //      ->get();
 
        $laporan = DB::select("CALL pm_lpp_laporan (?)", array($idproject));
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();
         return view('backend.projectmanager.laporan.laporan_progress.pending', compact('i','detail_project', 'laporan'));
     }
     public function laporanProgress_accept($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_progress', 'laporan_project.id_laporan', '=', 'laporan_progress.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_progress.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LP')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();

        $laporan = DB::select("CALL pm_lpa_laporan (?)", array($idproject));
        // dd($laporan);
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.projectmanager.laporan.laporan_progress.accept', compact('i','laporan','detail_project'));
     }
}
