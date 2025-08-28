<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StaffLapangan\DokumenStaffLapanganController;
use App\Http\Controllers\StaffLapangan\SubmitLaporanController;
use App\Http\Controllers\StaffLapangan\ProjectControllerStafflapangan;
use App\Http\Controllers\StaffLapangan\LaporanHarianStaffLapanganController;
use App\Http\Controllers\StaffLapangan\LaporanProgressStaffLapanganController;
use App\Http\Controllers\StaffLapangan\LaporanRABStaffLapanganController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!;
|
*/
 
Auth::routes();
Route::get('/', function(){
    return view('welcome');
});
Route::get('/about', function () {
    return view('about'); });
Route::get('/service', function () {
    return view('service'); });
Route::get('/team', function () {
    return view('team'); });
Route::get('/project', function () {
    return view('portfolio'); });
Route::get('/contact', function () {
    return view('contact'); });
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/form', [App\Http\Controllers\NegoisasiController::class, 'index']);
Route::post('/kirimemail', [App\Http\Controllers\NegoisasiController::class, 'negoisasi'])->name('form');

// AKUN USER
Route::get('/edit-akun', [App\Http\Controllers\AkunController::class, 'editakun'])->middleware('auth');
Route::post('/update-akun', [App\Http\Controllers\AkunController::class, 'updateakun'])->middleware('auth');
Route::get('/edit-password', [App\Http\Controllers\AkunController::class, 'editpassword'])->middleware('auth');
Route::post('/update-password', [App\Http\Controllers\AkunController::class, 'updatepassword'])->middleware('auth');

// ==========================================================================================================================
// ================================================== Direktur ==============================================================
// ==========================================================================================================================
Route::get('/direktur_dashboard', [App\Http\Controllers\DirekturController::class, 'index'])->middleware('jabatan:Direktur');
Route::get('/monitoring', [App\Http\Controllers\DirekturController::class, 'monitoring'])->middleware('jabatan:Direktur');
Route::get('/showlog', [App\Http\Controllers\DirekturController::class, 'show'])->middleware('jabatan:Direktur');

  
// ==========================================================================================================================
// ================================================== Admin Web =============================================================
// ==========================================================================================================================
Route::get('/adminweb_dashboard', [App\Http\Controllers\AdminWebController::class, 'index'])->middleware('jabatan:AdminWeb');
Route::get('/dataAbsen', [App\Http\Controllers\AbsenController::class, 'tampilAbsen'])->middleware('direk_adw');
Route::get('/laporanAbsensi/{iduser}', [App\Http\Controllers\AbsenController::class, 'filterAbsen'])->middleware('direk_adw');
Route::post('/laporanAbsensi/{iduser}', [App\Http\Controllers\AbsenController::class, 'filterAbsen']);
Route::get('/email-project', [App\Http\Controllers\AdminWebController::class, 'emailproject'])->middleware('direk_adw');
Route::delete('/deleteEmail/{idnegosiasi}', [App\Http\Controllers\AdminWebController::class, 'deleteEmail'])->middleware('direk_adw');

Route::get('/Export-Excel/{id_user}', [App\Http\Controllers\AdminWebController::class, 'exportExcel'])->middleware('direk_adw');


Route::get('/Project-Berjalan', [App\Http\Controllers\AdminWebController::class, 'projectBerjalan'])->middleware('dap');
Route::get('/Project-Selesai', [App\Http\Controllers\AdminWebController::class, 'projectSelesai'])->middleware('dap');
 
Route::get('/user-info', [App\Http\Controllers\AdminWebController::class, 'userinfo'])->middleware('direk_adw');
Route::get('/add-user', [App\Http\Controllers\AdminWebController::class, 'adduser'])->middleware('direk_adw');
Route::post('/c-user', [App\Http\Controllers\AdminWebController::class, 'createuser'])->middleware('direk_adw');
Route::get('/edit-user/{iduser}', [App\Http\Controllers\AdminWebController::class, 'edituser'])->middleware('direk_adw');
Route::get('/view-user/{iduser}', [App\Http\Controllers\AdminWebController::class, 'viewuser'])->middleware('direk_adw');
Route::post('/update/{iduser}', [App\Http\Controllers\AdminWebController::class, 'updateuser'])->middleware('direk_adw');
Route::delete('/delete/{iduser}', [App\Http\Controllers\AdminWebController::class, 'delete'])->middleware('direk_adw');

// ==========================================================================================================================
// =============================================== Project Manager ==========================================================
// ==========================================================================================================================
Route::get('/projectmanager_dashboard', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'index'])->middleware('jabatan:Project_Manager');
Route::get('/create-project', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'buatproject'])->middleware('jabatan:Project_Manager');
Route::post('/buatproject', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'insertproject'])->middleware('jabatan:Project_Manager');
Route::post('/finishproject/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'finish'])->middleware('direk_pm');
Route::post('/buatteam', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'insertteam'])->middleware('jabatan:Project_Manager');
// project-Berjalan
Route::get('/projectmanager/sedang-berjalan', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'projectberjalan'])->middleware('jabatan:Project_Manager');
Route::get('/projectmanager/sedang-berjalan/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'project_berjalan'])->middleware('jabatan:Project_Manager');
Route::get('/projectmanager/sb-desc/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'detail'])->middleware('jabatan:Project_Manager');
Route::get('/projectmanager/sb-team/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'team'])->middleware('jabatan:Project_Manager');
Route::get('/projectmanager/sb-laporan/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'laporan'])->middleware('jabatan:Project_Manager');
// project-Selesai
Route::get('/projectmanager/selesai', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'selesai'])->middleware('jabatan:Project_Manager');

// Edit Project
Route::get('/Edit-Detail/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'editdetail'])->middleware('direk_pm');
Route::post('/Update-Detail/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'updatedetail'])->middleware('direk_pm');
Route::get('/Edit-Team/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'editteam'])->middleware('direk_pm');
Route::post('/Update-Team/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'updateteam'])->middleware('direk_pm');

// ====================>> Laporan <<======================= //
// Laporan Harian
Route::get('/projectmanager/Laporan-Harian/{idproject}', [App\Http\Controllers\ProjectManager\LaporanHarianProjectManagerController::class, 'laporanHarian'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Harian/pending/{idproject}', [App\Http\Controllers\ProjectManager\LaporanHarianProjectManagerController::class, 'laporanHarian_pending'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Harian/accept/{idproject}', [App\Http\Controllers\ProjectManager\LaporanHarianProjectManagerController::class, 'laporanHarian_accept'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Harian/view/{idlaporan}', [App\Http\Controllers\ProjectManager\LaporanHarianProjectManagerController::class, 'laporanHarian_view'])->middleware('direk_pm');
// Laporan Progress
Route::get('/projectmanager/Laporan-Progress/{idproject}', [App\Http\Controllers\ProjectManager\LaporanProgressProjectManagerController::class, 'laporanProgress'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Progress/pending/{idproject}', [App\Http\Controllers\ProjectManager\LaporanProgressProjectManagerController::class, 'laporanProgress_pending'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Progress/accept/{idproject}', [App\Http\Controllers\ProjectManager\LaporanProgressProjectManagerController::class, 'laporanProgress_accept'])->middleware('direk_pm');
// Laporan RAB
Route::get('/projectmanager/Laporan-RAB/{idproject}', [App\Http\Controllers\ProjectManager\LaporanRABProjectManagerController::class, 'laporanRab'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-RAB/pending/{idproject}', [App\Http\Controllers\ProjectManager\LaporanRABProjectManagerController::class, 'laporanRab_pending'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-RAB/accept/{idproject}', [App\Http\Controllers\ProjectManager\LaporanRABProjectManagerController::class, 'laporanRab_accept'])->middleware('direk_pm');
// Dokumen Tambahan
Route::get('/projectmanager/Dokumen-Tambahan/{idproject}', [App\Http\Controllers\ProjectManager\LaporanDokumenProjectManagerController::class, 'laporanDokumen'])->middleware('direk_pm');
Route::get('/projectmanager/Dokumen-Tambahan/pending/{idproject}', [App\Http\Controllers\ProjectManager\LaporanDokumenProjectManagerController::class, 'laporanDokumen_pending'])->middleware('direk_pm');

Route::get('/projectmanager/Dokumen-Tambahan/accept/{idproject}', [App\Http\Controllers\ProjectManager\LaporanDokumenProjectManagerController::class, 'laporanDokumen_accept'])->middleware('direk_pm');
// Laporan Akhir
Route::get('/projectmanager/Laporan-Akhir/{idproject}', [App\Http\Controllers\ProjectManager\LaporanAkhirProjectManagerController::class, 'laporanAkhir'])->middleware('direk_pm');
Route::post('/Upload-LaporanAkhir/{idproject}', [App\Http\Controllers\ProjectManager\LaporanAkhirProjectManagerController::class, 'upload'])->middleware('direk_pm');
Route::get('/projectmanager/LA-hapus/{idlaporan}',[App\Http\Controllers\ProjectManager\LaporanAkhirProjectManagerController::class, 'hapus'])->middleware('direk_pm');

// Update status laporan
Route::get('/projectmanager/Laporan-Accept/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'accept'])->middleware('direk_pm');
Route::get('/projectmanager/Laporan-Decline/{idproject}', [App\Http\Controllers\ProjectManager\ProjectManagerController::class, 'decline'])->middleware('direk_pm');

// ==========================================================================================================================
// =============================================== Staff Lapangan ===========================================================
// ==========================================================================================================================
// Route::get('/stafflapangan_dashboard', [App\Http\Controllers\StaffLapangan\StaffLapanganController::class, 'index'])->middleware('stafflapangan');

// Route::get('/My-Project/Sedang-Berjalan', [ProjectControllerStafflapangan::class, 'tampil_semua_project'])->middleware('jabatan:Pengawas_Lapangan');
// Route::get('/My-Project/Selesai', [ProjectControllerStafflapangan::class, 'selesai'])->middleware('jabatan:Pengawas_Lapangan');

// Route::get('/stafflapangan/sb-laporan/{idproject}', [ProjectControllerStafflapangan::class, 'laporan'])->middleware('jabatan:Pengawas_Lapangan');

Route::get('/stafflapangan_dashboard', [App\Http\Controllers\StaffLapangan\StaffLapanganController::class, 'index'])->middleware('auth');

Route::get('/My-Project/Sedang-Berjalan', [ProjectControllerStafflapangan::class, 'tampil_semua_project'])->middleware('auth');
Route::get('/My-Project/Selesai', [ProjectControllerStafflapangan::class, 'selesai'])->middleware('auth');

Route::get('/stafflapangan/sb-laporan/{idproject}', [ProjectControllerStafflapangan::class, 'laporan'])->middleware('auth');

// ====================>> Laporan <<======================= //
// Laporan Harian
Route::get('/stafflapangan/Laporan-Harian/{idproject}', [ProjectControllerStafflapangan::class, 'laporanHarian'])->middleware(('auth'));
Route::get('/stafflapangan/buatlaporanharian/{idproject}',[LaporanHarianStaffLapanganController::class, 'index'])->middleware(('auth'))->name('buatlaporan');
Route::get('/stafflapangan/detail-laporan/{idharian}',[LaporanHarianStaffLapanganController::class, 'show'])->middleware(('auth'))->name('viewlaporan');
Route::get('/hapuspk/{kode_laporan_harian}/{tugas_jabatan}',[LaporanHarianStaffLapanganController::class, 'hapuspk'])->middleware(('auth'));
Route::get('/hapuspkr/{kode_laporan_harian}/{jenis_pekerjaan}',[LaporanHarianStaffLapanganController::class, 'hapuspkr'])->middleware(('auth'));
Route::get('/hapuspr/{kode_laporan_harian}/{jenis}',[LaporanHarianStaffLapanganController::class, 'hapuspr'])->middleware(('auth'));
Route::get('/hapustmpb/{kode_laporan_harian}/{jenis}',[LaporanHarianStaffLapanganController::class, 'hapustmpb'])->middleware(('auth'));
Route::get('/hapuscba/{kode_laporan_harian}/{jenis}',[LaporanHarianStaffLapanganController::class, 'hapuscba'])->middleware(('auth'));
Route::get('/hapuskjpp/{kode_laporan_harian}/{jenis}',[LaporanHarianStaffLapanganController::class, 'hapuskjpp'])->middleware(('auth'));
Route::post('/submitcba',[SubmitLaporanController::class, 'cba'])->middleware(('auth'));
Route::post('/submitpk',[SubmitLaporanController::class, 'pk'])->middleware(('auth'));
Route::post('/submitpkr',[SubmitLaporanController::class, 'pkr'])->middleware(('auth'));
Route::post('/submitpr',[SubmitLaporanController::class, 'pr'])->middleware(('auth'));
Route::post('/submittmpb',[SubmitLaporanController::class, 'tmpb'])->middleware(('auth'));
Route::post('/submitkjpp',[SubmitLaporanController::class, 'kjpp'])->middleware(('auth'));
Route::get('/stafflapangan/kirimlaporan/{idlaporan}',[SubmitLaporanController::class, 'kirim'])->middleware(('auth'));
Route::get('/stafflapangan/hapus/{idlaporan}',[SubmitLaporanController::class, 'hapus'])->middleware(('auth'));

// Laporan Progress
Route::get('/stafflapangan/Laporan-Progress/{idproject}', [ProjectControllerStafflapangan::class, 'laporanProgress'])->middleware(('auth'));
Route::post('/Upload-LaporanProgress/{idproject}', [LaporanProgressStaffLapanganController::class, 'upload'])->middleware(('auth'));

// Laporan RAB
Route::get('/stafflapangan/Laporan-RAB/{idproject}', [ProjectControllerStafflapangan::class, 'laporanRAB'])->middleware(('auth'));
Route::post('/Upload-LaporanRAB/{idproject}', [LaporanRABStaffLapanganController::class, 'upload'])->middleware(('auth'));

// Dokumen Tambahan
Route::get('/stafflapangan/Dokumen-Tambahan/{idproject}', [ProjectControllerStafflapangan::class, 'dokumenTambahan'])->middleware(('auth'));
Route::post('/Upload-DokumenTambahan/{idproject}', [DokumenStaffLapanganController::class, 'upload'])->middleware(('auth'));



// ==========================================================================================================================
// ================================================ Staff Kantor ============================================================
// ==========================================================================================================================
Route::get('/staff_dashboard', [App\Http\Controllers\StaffController::class, 'index'])->middleware('jabatan:Staff');
Route::get('/absensi', [App\Http\Controllers\AbsenController::class, 'index'])->middleware('jabatan:Staff');
Route::post('/absen', [App\Http\Controllers\AbsenController::class, 'absen'])->middleware('jabatan:Staff');
Route::get('/My-Absensi', [App\Http\Controllers\AbsenController::class, 'myAbsen'])->middleware('jabatan:Staff');

// ==========================================================================================================================
// ==================================================== PROJECT =============================================================
// ==========================================================================================================================

    Route::get('/repository-project', [App\Http\Controllers\Repository\ProjectController::class, 'index'])->middleware('dap');
    Route::get('/project/{idproject}', [App\Http\Controllers\Repository\ProjectController::class, 'lamanProject'])->middleware('dap');
    Route::get('/project/desc/{idproject}', [App\Http\Controllers\Repository\ProjectController::class, 'detail'])->middleware('dap');
    Route::get('/project/team/{idproject}', [App\Http\Controllers\Repository\ProjectController::class, 'team'])->middleware('dap');
    Route::get('/project/laporan/{idproject}', [App\Http\Controllers\Repository\ProjectController::class, 'laporan'])->middleware('project'); 

// ========================================================================
// =============================== LAPORAN ================================
// ========================================================================
// Laporan Harian
Route::get('/project/Laporan-Harian/{idproject}', [App\Http\Controllers\Repository\LaporanHarianController::class, 'laporanHarian'])->middleware('project');
Route::get('/project/Laporan-Harian/view/{idlaporan}', [App\Http\Controllers\Repository\LaporanHarianController::class, 'laporanHarian_view'])->middleware('project');
// Laporan Progress
Route::get('/project/Laporan-Progress/{idproject}', [App\Http\Controllers\Repository\LaporanProgressController::class, 'laporanProgress'])->middleware('project');
// Laporan RAB
Route::get('/project/Laporan-RAB/{idproject}', [App\Http\Controllers\Repository\LaporanRabController::class, 'laporanRab'])->middleware('project');
// Dokumen Tambahan
Route::get('/project/Dokumen-Tambahan/{idproject}', [App\Http\Controllers\Repository\LaporanDokumenController::class, 'laporanDokumen'])->middleware('project');
// Laporan Akhir
Route::get('/project/Laporan-Akhir/{idproject}', [App\Http\Controllers\Repository\LaporanAkhirController::class, 'laporanAkhir'])->middleware('project');

 