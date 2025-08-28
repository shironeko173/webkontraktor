<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Exports\AbsensiExport;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth; 
use Maatwebsite\Excel\Facades\Excel;
use RealRashid\SweetAlert\Facades\Alert;
 
class AdminWebController extends Controller
{
    public function index()
    {
        return view('backend.adminweb.dashboard');
    }

    public function emailproject()
    {
        $email = DB::table('client')
                ->join('negosiasi', 'client.id_client', '=', 'negosiasi.id_client')
                ->select('client.*', 'negosiasi.id_negosiasi', 'negosiasi.desc', 'negosiasi.alamat', 'negosiasi.type')
                ->get();
        $i = 1;        
        return view('backend.adminweb.email', compact('email', 'i'));
    }
 
    public function deleteEmail($idnegosiasi)
    {
        $email = DB::table('negosiasi')->where('id_negosiasi', $idnegosiasi)->delete();

        return redirect('/email-project');
    }

    public function userinfo()
    {
        $users = User::all();
        return view('backend.adminweb.userinfo', compact('users'));
    }

    public function adduser()
    {
        return view('backend.adminweb.adduser');
    }

    public function createuser(Request $request)
    {
        $request->validate([
            'email'=>'required',
            'password'=>'required'
        ]);

        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->jabatan = $request->jabatan;
        $user->save();

        if($user->save()){
            Alert::success('Success', 'User Berhasil Dibuat');
            return redirect('/add-user');
        } else {
            Alert::error('Oopps!!', 'User Gagal Dibuat!');
            return redirect('/add-user');
        }
    }

    public function edituser($iduser)
    {
        
        $user = User::where('id', $iduser)->first();

        if (Auth::user()->jabatan == 'Direktur') {
            if ($user->jabatan == 'Direktur') {
                abort(403, 'Unauthorized action.');
            }else {
                return view('backend.adminweb.edituser', compact('user', 'iduser'));    
            }
        } else {
            if ($user->jabatan == 'Direktur' || $user->jabatan == 'AdminWeb') {
                abort(403, 'Unauthorized action.');
            }else {
                return view('backend.adminweb.edituser', compact('user', 'iduser'));    
            }
        }
    
    } 

    public function viewuser($iduser)
    {
        /* $user = User::firstOrFail($iduser); */
        $user = User::where('id', $iduser)->first();
        return view('backend.adminweb.viewuser', compact('user', 'iduser'));
    } 

    public function updateuser(Request $request, $iduser)
    {
        // dd($request);
        $user = User::find($iduser);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->jabatan = $request->jabatan;
        $user->save();

        if($user->save()){
            Alert::success('Success', 'User Berhasil Diupdate');
            return redirect('/user-info');
        } else {
            Alert::error('Oopps!!', 'User Gagal Diupdate!');
            return redirect('/user-info');
        }
    }

    public function delete($iduser)
    {
        $user = User::find($iduser)->delete($iduser);

         if($user != null){
            return redirect('/user-info')->with('status','Delete Berhasil!');
        } else {
            return redirect('/user-info')->with('status','Delete Gagal!');
        }
    }

    public function projectBerjalan()
    {
        $project = DB::select("CALL adminweb_projectberjalan ()");
        $project_berjalan = DB::table('project')
            ->where('status', 'sedang_berjalan')->get();
        $total = $project_berjalan->count();

        $id_project = DB::table('project')->select('id_project')->get();
        $detail_project = DB::table('detail_project')->get();

        return view('backend.adminweb.project-berjalan', compact('project','project_berjalan', 'total', 'detail_project'));
    }

    public function projectSelesai()
    {
        $project = DB::select("CALL adminweb_projectsel ()");
        // $project = DB::table('project')
        //     ->join('detail_project', 'project.id_project', '=', 'detail_project.id_project')
        //     ->select('project.*','detail_project.nama_project',)
        //     ->where('status', 'selesai')->get();
  
        // $project = $project[0]->push((object)['users' => '3']);
        // // $project[0]->put('users','3');
        // dd($project);
        
        $selesai = DB::table('project')
            ->where('status', 'selesai')->get();
        $total = $selesai->count();

        $id_project = DB::table('project')->select('id_project')->get();
        $detail_project = DB::table('detail_project')->get();

        return view('backend.adminweb.project-selesai', compact('project','selesai', 'total', 'detail_project'));
    }

    public function exportExcel($id_user)
    {
        return Excel::download(new AbsensiExport($id_user), 'data-absensi.xlsx');
    }


}
