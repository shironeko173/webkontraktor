<?php

namespace App\Http\Controllers\Repository;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\DB;

class LaporanDokumenController extends Controller
{
    public function laporanDokumen($idproject){
 
        $i = 1;
        // $laporan = DB::table('laporan_project')
        //      ->join('users', 'laporan_project.id_user', '=', 'users.id')
        //      ->join('dokumen_tambahan', 'laporan_project.id_laporan', '=', 'dokumen_tambahan.id_laporan')
        //      ->select('laporan_project.*', 'users.name', 'dokumen_tambahan.dokumen')
        //      ->where('laporan_project.id_project', $idproject)
        //      ->where('laporan_project.id_type', 'DT')
        //      ->where('laporan_project.status', 'Accept')
        //      ->get();
        $laporan = DB::select("CALL repository_laporandokumen_laporan (?)", array($idproject));
 
        $detail_project = DB::table('detail_project')->where('id_project', $idproject)->first();

         return view('backend.repository-project.laporan.laporan_dokumen.index', compact('i','laporan','detail_project'));
     }
}
