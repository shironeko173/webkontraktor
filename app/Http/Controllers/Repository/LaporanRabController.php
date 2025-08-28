<?php

namespace App\Http\Controllers\Repository;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanRabController extends Controller
{
    public function laporanRab($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('laporan_rab', 'laporan_project.id_laporan', '=', 'laporan_rab.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'laporan_rab.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'LR')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();
        $laporan = DB::select("CALL repository_laporanrab_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.repository-project.laporan.laporan_rab.index', compact('i','laporan','detail_project'));
     }
}
