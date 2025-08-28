<?php

namespace App\Http\Controllers\ProjectManager;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class LaporanAkhirProjectManagerController extends Controller
{
    public function laporanAkhir($idproject){
        // $project = DB::table('project')
        // ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        // ->select('project.*', 'detail_project.nama_project')
        // ->where('project.id_project', $idproject)->first();
             $projects = DB::select("CALL pm_la_project (?)", array($idproject));
             $project = $projects[0];

             $laporan = DB::select("CALL pm_la_laporan (?)", array($idproject));
  
         return view('backend.projectmanager.laporan.laporan_akhir.index', compact('project','laporan', 'idproject'));
     }

     public function upload(Request $request, $idproject){
        // dd($request);
        // $this->validate($request, [
        //     'filelaporan' => 'mimes:doc, docx, pdf, xlx, xlsx, pdf'
        // ]);

        $totallaporan = DB::table('laporan_project')->where('id_project', $idproject)->count('id_project')+1;
        $idlaporan = $idproject.'-'.$totallaporan;

        $file = $request->file('filelaporan');
        $filename = $idlaporan.'-'.$file->getClientOriginalName();
        $file->move('Upload/laporanAkhir/', $filename);
        
        // DB::table('laporan_project')->insert([
        //     'id_laporan' => $idlaporan,
        //     'id_project' => $idproject,
        //     'id_user' => Auth::user()->id,
        //     'id_type' => 'LA',
        //     'status' => 'Accept',    
        // ]);
    
        // DB::table('laporan_akhir')->insert([
        //     'id_laporan' => $idlaporan,
        //     'dokumen' => $filename,
        //  ]);

         DB::select("CALL store_laporan_akhir (?, ?, ?, ?, ?)", array($idlaporan, $idproject, Auth::user()->id, 'LA', $filename));

         Alert::success('Success', 'Laporan Berhasil Diupload');
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
