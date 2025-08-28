@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Document</li>
      <li class="breadcrumb-item">
        <a href="/dataAbsen">Laporan Absensi</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/laporanAbsensi/{{ $id_user }}">Absensi : {{ $id_user }}</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

      <!-- Bordered Table -->
    <div class="card">
      <h5 class="card-header">Laporan Absen</h5>
      <form method="POST" enctype="multipart/form-data" action="/laporanAbsensi/{{ $id_user }}">
          @csrf

              <div class="modal-body">
                  <div class="form-group"> 
                      <label>Tgl Mulai</label>
                      <input type="date" class="form-control" name="tgl_mulai" >
                    </div>

                  <div class="form-group">
                      <label>Tgl Selesai</label>
                      <input type="date" class="form-control" name="tgl_selesai" >
                  </div>

              </div>

              <div class="modal-footer">
                @if (Auth::user()->jabatan == 'AdminWeb' || Auth::user()->jabatan == 'Direktur')
                  <a href="/Export-Excel/{{ $id_user }}" target="_blank" class="btn btn-success"><i class="fa fa-print"></i> Export Excel</a>    
                @endif
                  <button type="submit" class="btn btn-primary"><i class="fa fa-print"></i> Filter Absen</button>
              </div>

          
          </form>
      <div class="card-body">
        <div class="table-responsive text-nowrap">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Tanggal</th>
                <th>Jam Masuk</th>
                <th>Jam Keluar</th>
                <th>Keterangan</th>
              </tr>
            </thead>
            <tbody>
              @forelse($data_absen as $absen)
              <tr>
                <td>{{$absen->date}}</td>
                <td>{{$absen->time_in}}</td>
                <td>{{$absen->time_out}}</td>
                <td>{{$absen->note}}</td>
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