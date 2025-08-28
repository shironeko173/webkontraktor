<?php

namespace App\Http\Controllers\StaffLapangan;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class LaporanRABStaffLapanganController extends Controller
{
    public function index($idproject){
         
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
    $file->move('Upload/laporanRAB/', $filename);
    
    // DB::table('laporan_project')->insert([
    //     'id_laporan' => $idlaporan,
    //     'id_project' => $idproject,
    //     'id_user' => Auth::user()->id,
    //     'id_type' => 'LR',
    //     'status' => 'Belum Dikirim',    
    // ]);

    // DB::table('laporan_rab')->insert([
    //     'id_laporan' => $idlaporan,
    //     'dokumen' => $filename,
    //  ]);

     DB::select("CALL 	store_laporan_rab (?, ?, ?, ?, ?)", array($idlaporan, $idproject, Auth::user()->id, 'LR', $filename));

     Alert::success('Success', 'Dokumen Berhasil Diupload');
     return Redirect::back();
    }
}
