<?php
 
namespace App\Http\Controllers\ProjectManager;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use RealRashid\SweetAlert\Facades\Alert;

class ProjectManagerController extends Controller
{
    public function index()
    {
        return view('backend.projectmanager.dashboard');
    }
 
    public function buatproject()
    {
        return view('backend.projectmanager.project.buatproject');
    }

    public function insertproject(Request $request)
    {
        
        $id_project = DB::table('project')->max('id_project') + 1;

        // DB::table('project')->insert([
        //     'id_project' => $id_project,
        //     'status' => 'sedang_berjalan',
        //     'created_at' => now()
        //  ]);
        
        // DB::table('detail_project')->insert([
        //     'id_project' => $id_project,
        //     'nama_project' => $request->nama,
        //     'lokasi' => $request->lokasi,
        //     'estimasi' => $request->estimasi,
        //     'cost' => $request->cost,
        //     'deskripsi' => $request->deskripsi
        // ]);

        DB::select("CALL new_project (?, ?, ?, ?, ?, ?)", array($id_project, $request->nama, $request->lokasi, $request->estimasi, $request->cost, $request->deskripsi));

        // buat tim
        $project_name = $request->nama;
    
        $users = User::where(function($q) {
            $q->where('jabatan', 'Drafter')
              ->orWhere('jabatan', 'Admin')
              ->orWhere('jabatan', 'Pengawas_Lapangan');
            })
              ->get();
        return view('backend.projectmanager.project.buatteam', compact('project_name', 'users', 'id_project'));
    }

    public function insertteam(Request $request)
    {
        // dd($request->all());
        $id_user = $request->input_team;
        $id_project = $request->id_project;
        for ($i=0; $i < count($id_user); $i++){
            $datasave = [
                'id_project' => $id_project[$i],
                'id_user' => $id_user[$i]
            ];
            DB::table('team_project')->insert($datasave);
        }
        Alert::success('Success', 'Project Baru berhasil ditambahkan');
        return redirect('/projectmanager/sedang-berjalan');
    }

    public function projectberjalan(){
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*','detail_project.nama_project')
        //     ->where('status', 'sedang_berjalan')->get();
        $project = DB::select("CALL pm_pb_project ()");
        
        $project_berjalan = DB::table('project')
            ->where('status', 'sedang_berjalan')->get();
        $total = $project_berjalan->count();

        $id_project = DB::table('project')->select('id_project')->get();
        $detail_project = DB::table('detail_project')->get();

        return view('backend.projectmanager.project.sedangberjalan', compact('project','project_berjalan', 'total', 'detail_project'));
    }

    public function project_berjalan($idproject){
        
        // $project = DB::table('project') 
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*', 'detail_project.nama_project')
        //     ->where('project.id_project', $idproject)->first();

        $projects = DB::select("CALL pm_pb2_project (?)", array($idproject));
        $project = $projects[0];

        return view('backend.projectmanager.project.laman-project', compact('project'));
    }

    public function detail($idproject){
        
        $projects = DB::select("CALL pm_detail_project (?)", array($idproject));
        $project = $projects[0];

        return view('backend.projectmanager.project.detail', compact('project'));
    }
    public function editdetail($idproject){
        
        $projects = DB::select("CALL pm_detail_project (?)", array($idproject));
        $project = $projects[0];
        $project_detail = DB::table('detail_project')->where('id_project', $idproject)->first();

        return view('backend.projectmanager.project.editdetail', compact('project','project_detail'));
    }
    public function updatedetail(Request $request, $idproject){
        DB::table('detail_project')->where('id_project', $idproject)->update([
                'nama_project' => $request->nama,
                'lokasi' => $request->lokasi,
                'estimasi' => $request->estimasi,
                'cost' => $request->cost,
                'deskripsi' => $request->deskripsi
            ]);

        Alert::success('Sukses!!', 'Detail Project berhasil diupdate');
        return back();
    }

    public function team($idproject){
         
        // $team_project = DB::table('team_project')
        //     ->join('users', 'team_project.id_user', '=', 'users.id')
        //     ->select('team_project.id_user', 'users.name', 'users.email', 'users.jabatan')
        //     ->where('team_project.id_project', $idproject)->get();
        $team_project = DB::select("CALL pm_team_tp (?)", array($idproject));
        
        $project = DB::table('project')
            ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            ->select('project.*', 'detail_project.nama_project', 'detail_project.lokasi', 'detail_project.estimasi', 'detail_project.cost', 'detail_project.deskripsi')
            ->where('project.id_project', $idproject)->first();

        return view('backend.projectmanager.project.team', compact('team_project', 'project'));
    }
    public function editteam($idproject){
         
        $team_project = DB::select("CALL repository_team_teamproject (?)", array($idproject));
        
        $project = DB::table('project')
            ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            ->select('project.*', 'detail_project.nama_project', 'detail_project.lokasi', 'detail_project.estimasi', 'detail_project.cost', 'detail_project.deskripsi')
            ->where('project.id_project', $idproject)->first();
        $users = User::where(function($q) {
            $q->where('jabatan', 'Drafter')
                ->orWhere('jabatan', 'Admin')
                ->orWhere('jabatan', 'Pengawas_Lapangan');
            })
                ->get();
        return view('backend.projectmanager.project.editteam', compact('idproject','team_project', 'project', 'users'));
    }
    public function updateteam(Request $request, $idproject){
        
        $oldteam = DB::table('team_project')->where('id_project', $idproject)->delete();

        $id_user = $request->input_team;
        $id_project = $request->id_project;
        for ($i=0; $i < count($id_user); $i++){
            $datasave = [
                'id_project' => $id_project[$i],
                'id_user' => $id_user[$i]
            ];
            DB::table('team_project')->insert($datasave);
        }
        Alert::success('Sukses!!', 'Team Project berhasil diupdate');
        return back();
    }

    public function laporan($idproject){
        $project = DB::table('project')
            ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            ->select('project.*', 'detail_project.nama_project')
            ->where('project.id_project', $idproject)->first();

        return view('backend.projectmanager.laporan.all-laporan', compact('project'));
    }

    public function finish($idproject){
        DB::table('project')
        ->where('id_project', $idproject)
        ->update([
            'status' => 'selesai',
            'updated_at' => now()
        ]);
        Alert::success('Success', 'Good Job! Project Telah Selesai');
        return Redirect::back();
    }

    public function selesai(){
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*','detail_project.nama_project')
        //     ->where('status', 'selesai')->get();
        $project = DB::select("CALL pm_selesai_project ()");
        
        $selesai = DB::table('project') 
            ->where('status', 'selesai')->get();
        $total = $selesai->count();

        $id_project = DB::table('project')->select('id_project')->get();
        $detail_project = DB::table('detail_project')->get();

        return view('backend.projectmanager.project.selesai', compact('project','selesai', 'total', 'detail_project'));
    }

    public function accept($idlaporan){
        DB::table('laporan_project')
        ->where('id_laporan', $idlaporan)
        ->update([
            'status' => 'Accept',
            'waktu_dikonfirmasi' => now()
        ]);
        Alert::success('Success', 'Status Laporan Berhasil Diubah');
        return Redirect::back();
    }

    public function decline($idlaporan){
        DB::table('laporan_project')
        ->where('id_laporan', $idlaporan)
        ->update([
            'status' => 'Decline',
            'waktu_dikonfirmasi' => now()
        ]);
        Alert::success('Success', 'Status Laporan Berhasil Diubah');
        return Redirect::back();
    }

}
