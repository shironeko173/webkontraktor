@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Document</li>
      <li class="breadcrumb-item active">
        <a href="/dataAbsen">Laporan Absensi</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">

        <!-- Bordered Table -->
      <div class="card">
        <h5 class="card-header">Data Absen Bulanan</h5>

        <div class="card-body">
          <div class="table-responsive text-nowrap">
            <table class="table table-bordered">
              <thead> 
                <tr>
                  <th>Nama Karyawan</th>
                  <th>Email</th>
                  <th>Tingkat Kehadiran</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                @forelse($data_akun as $akun)
                <tr>
                  <td>{{$akun->name}}</td>
                  <td>{{$akun->email}}</td>
                  <td>80%</td>
                  <td><a class="btn rounded-pill btn-info" href="/laporanAbsensi/{{ $akun->id}}">Detail</a></td>
              </tr> 
                @empty
                <tr>
                  <td colspan="4"><b><i>TIDAK ADA DATA UNTUK DITAMPILKAN</i></b></td>
                </tr>
                @endforelse   
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!--/ Bordered Table -->

      
      <!--/ Responsive Table -->
    </div>
@endsection    