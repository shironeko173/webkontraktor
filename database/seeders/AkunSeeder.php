<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AkunSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = [
            [
                'name' => 'ini adalah Direktur',
                'email' => 'Direktur2@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Direktur',
            ],
            [
                'name' => 'ini adalah Admin Web',
                'email' => 'adminWeb@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'AdminWeb',
            ],
            [
                'name' => 'ini adalah Project Manager',
                'email' => 'projectManager@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Project_Manager',
            ],
            [
                'name' => 'ini adalah Admin',
                'email' => 'Admin@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Admin',
            ],
            [
                'name' => 'ini adalah Drafter',
                'email' => 'Drafter@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Drafter',
            ],
            [
                'name' => 'ini adalah Pengawas Lapangan',
                'email' => 'PengawasLapangan@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Pengawas_Lapangan',
            ],
            [
                'name' => 'ini adalah Staff',
                'email' => 'Staff@gmail.com',
                'password' => bcrypt('123123123'),
                'jabatan' => 'Staff',
            ]
        ];
        foreach ($user as $key => $value) {
            User::create($value);
        }
    }
}
