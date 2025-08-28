@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">
        <a href="/projectmanager/sedang-berjalan/{{ $detail_project->id_project }}">{{ $detail_project->nama_project }}</a>
      </li>
      <li class="breadcrumb-item">
        <a href="/projectmanager/sb-laporan/{{ $detail_project->id_project }}">Laporan</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/projectmanager/Laporan-Harian/{{ $detail_project->id_project }}">Laporan Harian</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

      <!-- Bordered Table -->
    <div class="card">
      <h5 class="card-header">Laporan Harian, Project : {{ $detail_project->nama_project }}</h5>
      <div class="card-body">
        <div class="table-responsive text-nowrap">
          <table class="table table-bordered" style="text-align: center">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Pengirim</th>
                <th>Waktu Dikirim</th>
                <th>Waktu Diterima</th>
                <th>Isi Laporan</th>
              </tr>
            </thead>  
            <tbody>
              @forelse ($laporan as $item)
                <tr >
                  <td>{{ $i++ }}</td>
                  <td>{{ $item->name }}</td>
                  <td>{{ Carbon\Carbon::parse($item->waktu_dikirim)->format('d M Y - H:i:s') }}</td>
                  <td>{{ Carbon\Carbon::parse($item->waktu_dikonfirmasi)->format('d M Y - H:i:s') }}</td>
                  <td><a href="/projectmanager/Laporan-Harian/view/{{ $item->id_laporan }}" style="font-size: 0.7rem;" class="btn rounded-pill btn-info">View</a></td>
                </tr>
                @empty
                <tr>
                  <td colspan="5">Belum ada data terbaru saat ini.</td>
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