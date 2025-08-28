<?php

namespace App\Http\Controllers\Repository;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanProgressController extends Controller 
{
    public function laporanProgress($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_progress', 'laporan_project.id_laporan', '=', 'laporan_progress.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_progress.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LP')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();
        $laporan = DB::select("CALL repository_laporanprogress_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.repository-project.laporan.laporan_progress.index', compact('i','laporan','detail_project'));
     }
}
