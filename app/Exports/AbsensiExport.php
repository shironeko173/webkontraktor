<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Illuminate\Support\Facades\DB;

class AbsensiExport implements FromView
{
    public function __construct($id_user)
    {

        $this->data = $id_user;
    }

    public function view(): View
    {
        return view('backend.adminweb.export-excel', [
            'absensi' => DB::table('absen')->where('id_user', $this->data )->get(),
            'user' => DB::table('users')->where('id', $this->data )->first()
        ]);
    }
}
