@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item">
        <a href="/My-Project/Sedang-Berjalan">Project Berjalan</a>
      </li>
      <li class="breadcrumb-item">
        <a href="/stafflapangan/sb-laporan/{{ $project->id_project }}">{{ $project->nama_project }}</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/stafflapangan/Laporan-Harian/{{ $project->id_project }}">Laporan Harian</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="container bg-light shadow py-3 px-5">
            
            {{-- @if(session('alert'))
                <div class="alert alert-danger" role="alert">
                {{ session('alert') }}
                </div>
            @endif --}}
            <div class="text-center my-4">
                <h1>Laporan Harian</h1>
            </div>
            <div class="d-flex justify-content-end my-4">
                <a href="/stafflapangan/buatlaporanharian/{{ $idproject }}" class="btn btn-primary">Buat Laporan Harian</a>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" class="fs-5">Kode</th>
                        <th scope="col" class="fs-5">Tanggal Dibuat</th>
                        <th scope="col" class="fs-5">Tanggal Dikirim</th>
                        <th scope="col" class="fs-5">Status</th>
                        <th scope="col-sm-1" class="fs-5 text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($laporan as $item)
                        <tr>
                            <th scope="row">{{ $item->id_laporan }}</th>
                            <td>{{ $item->waktu_dibuat }}</td>
                            <td>{{ $item->waktu_dikirim }}</td>
                            @if ($item->status == 'Pending')
                                <td><button class="btn btn-warning btn-sm">Pending</button></td>
                            @elseif($item->status == 'Accept')
                                <td><button class="btn btn-success btn-sm">Diterima</button></td>
                            @elseif($item->status == 'Belum Dikirim')
                                <td><button class="btn btn-secondary btn-sm">Belum Dikirim</button></td>
                            @else
                                <td><button class="btn btn-danger btn-sm">Ditolak</button></td>
                            @endif
                            @if ($item->status == 'Belum Dikirim')
                                <td style="text-align: center;"><a href="/stafflapangan/detail-laporan/{{ $item->id_laporan }}" class="btn btn-primary btn-sm"><i class="bi bi-eye"></i></a>
                                    <a href="/stafflapangan/kirimlaporan/{{ $item->id_laporan }}"class="btn btn-success btn-sm"><i class="bi bi-send"></i></i></a>
                                    <a href="/stafflapangan/hapus/{{ $item->id_laporan }}"class="btn btn-sm btn-danger"><i class="bi bi-x-lg"></i></i></a></td>
                            @else
                                <td style="text-align: center;"><a href="/stafflapangan/detail-laporan/{{ $item->id_laporan }}" class="btn-sm btn btn-primary"><i class="bi bi-eye"></i></a></td>
                            @endif

                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
        <!-- Content wrapper -->
    </div>
@endsection
