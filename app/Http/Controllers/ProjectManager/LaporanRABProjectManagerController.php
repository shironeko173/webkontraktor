<?php

namespace App\Http\Controllers\ProjectManager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class LaporanRABProjectManagerController extends Controller
{
    public function laporanRab($idproject){

        // $project = DB::table('project')
        //      ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //      ->select('project.*', 'detail_project.nama_project')
        //      ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL pm_lr_project (?)", array($idproject));
        $project = $projects[0];
 
         return view('backend.projectmanager.laporan.laporan_rab.index', compact('project'));
     }
     public function laporanRab_pending($idproject){
 
        $i = 1; 
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_rab', 'laporan_project.id_laporan', '=', 'laporan_rab.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_rab.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LR')
        //      ->where('laporan_project.status', 'Pending')
        //      ->get();
        $laporan = DB::select("CALL pm_lrp_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();
         return view('backend.projectmanager.laporan.laporan_rab.pending', compact('i','detail_project', 'laporan'));
     }
     public function laporanRab_accept($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_rab', 'laporan_project.id_laporan', '=', 'laporan_rab.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_rab.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LR')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();
        $laporan = DB::select("CALL pm_lra_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.projectmanager.laporan.laporan_rab.accept', compact('i','laporan','detail_project'));
     }
}
