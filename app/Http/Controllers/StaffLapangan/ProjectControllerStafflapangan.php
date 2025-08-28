<?php

namespace App\Http\Controllers\StaffLapangan;
 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProjectControllerStafflapangan extends Controller
{
    public function tampil_semua_project(){
        $project = DB::select("CALL stafflapangan_project_tsp (?)", array(auth()->user()->id));
      return view('backend.stafflapangan.project.sedangberjalan', compact('project'));
    }   

    public function selesai(){
        $project = DB::select("CALL stafflapangan_project_selpro (?)", array(auth()->user()->id));

        $selesai = DB::select("CALL stafflapangan_project_selselesai (?)", array(auth()->user()->id));
        $selesai = collect($selesai);
        
        $total = $selesai->count();


        $id_project = DB::table('project')->select('id_project')->get();
        $detail_project = DB::table('detail_project')->get();

        return view('backend.stafflapangan.project.selesai', compact('project','selesai', 'total', 'detail_project'));
    }
    
    public function laporan($idproject){

        $projects = DB::select("CALL stafflapangan_project_lapproject (?)", array($idproject));
        $project = $projects[0];

        return view('backend.stafflapangan.laporan.allLaporan', compact('project'));
    }
    public function laporanHarian($idproject){
        $laporan = DB::table('laporan_project')
            ->where('id_project', $idproject)
            ->where('id_type', '=', 'LH')
            ->where('id_user', '=', auth()->user()->id) 
            ->get();
        
        $projects = DB::select("CALL stafflapangan_project_lapproject (?)", array($idproject));
        $project = $projects[0];

        return view('backend.stafflapangan.laporan.laporanharian', compact('laporan', 'idproject', 'project'));
    }
    public function laporanProgress($idproject){

        $laporan = DB::select("CALL stafflapangan_project_lapprogress (?, ?)", array($idproject,auth()->user()->id));
        $projects = DB::select("CALL stafflapangan_project_lapproject (?)", array($idproject));
        $project = $projects[0];
        
        return view('backend.stafflapangan.laporan.laporanprogress', compact('laporan', 'idproject', 'project'));
    }
    public function laporanRAB($idproject){
        $laporan = DB::select("CALL stafflapangan_project_laprab (?, ?)", array($idproject,auth()->user()->id));
        $projects = DB::select("CALL stafflapangan_project_lapproject (?)", array($idproject));
        $project = $projects[0];

        return view('backend.stafflapangan.laporan.laporanrab', compact('laporan', 'idproject', 'project'));
    }
    public function dokumenTambahan($idproject){
        $laporan = DB::select("CALL stafflapangan_project_doktambahan (?, ?)", array($idproject,auth()->user()->id));
        $projects = DB::select("CALL stafflapangan_project_lapproject (?)", array($idproject));
        $project = $projects[0];

        return view('backend.stafflapangan.laporan.dokumen', compact('laporan', 'idproject', 'project'));
    }
}

