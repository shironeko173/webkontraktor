@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Absensi Karyawan</li>
      <li class="breadcrumb-item active">
        <a href="/absensi">Absensi</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        
        

        <!-- Bordered Table -->
        <div class="card" style="margin-bottom: 20px;">
            <div class="card-header">{{$info['status']}}</div>

            <div class="card-body">
                @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                @endif

                <table class="table table-responsive">
                        <form action="/absen" method="post">
                            @csrf
                            <tr>
                                <td>
                                    <input type="text" class="form-controll" placeholder="keterangan..." name="note">
                                </td> 
                                <td>
                                    <button type="submit" class="btn btn-flat btn-primary" name="btnIn" value = "1" {{$info['btnIn']}} >ABSEN MASUK</button>    
                                </td> 
                                <td>
                                    <button type="submit" class="btn btn-flat btn-primary" name="btnOut" value = "1" {{$info['btnOut']}}>ABSEN KELUAR</button>    
                                </td>   
                            </tr>
                        </form>
                    </table>
            </div>
        </div>
      <!--/ Bordered Table -->

      
      <!--/ Responsive Table -->
    </div>

    <div class="container-xxl flex-grow-1 container-p-y">
        
        

        <!-- Bordered Table -->
      <div class="card">
        <h5 class="card-header">Laporan Absen Harian</h5>
        
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