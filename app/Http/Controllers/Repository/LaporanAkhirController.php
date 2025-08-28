<?php

namespace App\Http\Controllers\Repository;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanAkhirController extends Controller
{
    public function laporanAkhir($idproject){
        // $project = DB::table('project')
        //      ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //      ->select('project.*', 'detail_project.nama_project')
        //      ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL repository_laporanakhir_project (?)", array($idproject));
        $project = $projects[0];
            //  $laporan = DB::table('laporan_project')
            //  ->join('laporan_akhir', 'laporan_project.id_laporan', '=', 'laporan_akhir.id_laporan')
            //  ->where('laporan_project.id_project', $idproject)
            //  ->where('laporan_project.id_type', '=', 'LA')
            //  ->get();
        $laporan = DB::select("CALL repository_laporanakhir_laporan (?)", array($idproject));
  
         return view('backend.repository-project.laporan.laporan_akhir.index', compact('project','laporan', 'idproject'));
     }
 
}

