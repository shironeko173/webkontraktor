<?php

namespace App\Http\Controllers\Repository;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $i = 1;

        if($request->has('search')){
            // $project = DB::table('project')
            // ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            // ->select('project.*','detail_project.nama_project')
            // ->where('project.status', 'selesai')
            // ->where('detail_project.nama_project', 'LIKE', '%' .$request->search.'%')
            // ->get();
            $project= DB::select("CALL 	repository_index_project1 (?)", array($request->search));

        }else{
            // $project = DB::table('project')
            // ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            // ->select('project.*','detail_project.nama_project')
            // ->where('project.status', 'selesai')->get();
            $project= DB::select("CALL 	repository_index_project2 ()");
        }


        return view('backend.repository-project.repository', compact('i', 'project'));
    }
    public function lamanProject($idproject)
    {
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*', 'detail_project.nama_project')
        //     ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL repository_lamanproject_project (?)", array($idproject));
        $project = $projects[0];

        return view('backend.repository-project.laman-project', compact('project'));
    }

    public function detail($idproject){
        
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*', 'detail_project.nama_project', 'detail_project.lokasi', 'detail_project.estimasi', 'detail_project.cost', 'detail_project.deskripsi')
        //     ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL repository_detail_project (?)", array($idproject));
        $project = $projects[0];

        $project_detail = DB::table('detail_project')->where('id_project', $idproject)->first();

        return view('backend.repository-project.detail_project.detail', compact('project','project_detail'));
    }

    public function team($idproject){
         

        // $team_project = DB::table('team_project')
        //     ->join('users', 'team_project.id_user', '=', 'users.id')
        //     ->select('team_project.id_user', 'users.name', 'users.email', 'users.jabatan')
        //     ->where('team_project.id_project', $idproject)->get();
        $team_project = DB::select("CALL repository_team_teamproject (?)", array($idproject));
        
        $project = DB::table('project')
            ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
            ->select('project.*', 'detail_project.nama_project', 'detail_project.lokasi', 'detail_project.estimasi', 'detail_project.cost', 'detail_project.deskripsi')
            ->where('project.id_project', $idproject)->first();

        return view('backend.repository-project.detail_project.team', compact('team_project', 'project'));
    }

    public function laporan($idproject){
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*', 'detail_project.nama_project')
        //     ->where('project.id_project', $idproject)->first();
        $projects = DB::select("CALL repository_laporan_project (?)", array($idproject));
        $project = $projects[0];

        return view('backend.repository-project.laporan.all-laporan', compact('project'));
    }
    
}
