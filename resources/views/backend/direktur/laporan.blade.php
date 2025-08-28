@extends('backend.component.main')
@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">

        <!-- Bordered Table -->
      <div class="card">
        <h5 class="card-header">Laporan Absen</h5>
        <form method="POST" enctype="multipart/form-data" action="/filterAbsen">
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
                    <button typr="submit" class="btn btn-primary"><i class="fa fa-print"></i> Filter Absen</button>
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