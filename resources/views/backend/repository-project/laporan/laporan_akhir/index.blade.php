@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      @if (Auth::user()->jabatan == 'Pengawas_Lapangan' ||Auth::user()->jabatan == 'Admin'|| Auth::user()->jabatan == 'Drafter')
        <li class="breadcrumb-item">Project</li>
        <li class="breadcrumb-item">
          <a href="/My-Project/Selesai">Project Selesai</a>
        </li>
        <li class="breadcrumb-item">
          <a href="/project/laporan/{{ $project->id_project }}">{{ $project->nama_project }}</a>
        </li>
        <li class="breadcrumb-item active">
          <a href="/project/Laporan-Akhir/{{ $project->id_project }}">Laporan Akhir</a>
        </li>
      @else
        <li class="breadcrumb-item">
          <a href="/project/{{ $project->id_project }}">{{ $project->nama_project }}</a>
        </li>
        <li class="breadcrumb-item">
          <a href="/project/laporan/{{ $project->id_project }}">Laporan</a>
        </li>
        <li class="breadcrumb-item active">
          <a href="/project/Laporan-Akhir/{{ $project->id_project }}">Laporan Akhir</a>
        </li>
      @endif

    </ol>
  </nav>
@endsection

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="col py-5">
            <div class="card h-100">
              <img class="card-img" src="{{ asset('images') }}/laporan5.png" alt="Card image cap" style="height: 250px;" />
              <div class="card-img-overlay" style="padding: 5%;">
                <h1 class="card-title mt-4" style="text-align: center; color:white">Laporan Akhir</h1>
              </div>
            <div class="card-body" style="padding: 0.7rem 1.5rem;">
              <h3 class="mt-2" style="text-align: center; color:black">Project: {{ $project->nama_project }}</h3>
            </div>
            </div>
          </div>
          <div class="container bg-light shadow py-3 px-5">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" class="fs-5">Kode</th>
                        <th scope="col" class="fs-5">Tanggal dibuat</th>
                        <th scope="col" class="fs-5">Status</th>
                        <th scope="col-sm-1" class="fs-5 text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($laporan as $item)
                        <tr>
                            <th scope="row">{{ $item->id_laporan }}</th>
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
                           
                                <td style="text-align: center;">
                                    <a href="/Upload/laporanAkhir/{{ $item->dokumen }}" class="btn btn-primary btn-sm"><i class="bi bi-eye"></i></a>
                                </td>

                        </tr>
                    @empty
                    <tr>
                        <td colspan="4" style="text-align: center;">Belum Ada Laporan Akhir Saat Ini</td>
                    </tr>

                    @endforelse

                </tbody>
            </table>
        </div>
        <!-- Content wrapper -->
    </div>

    

      <!-- Modal -->
      <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalCenterTitle">Upload Laporan Akhir</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
    <form method="POST" action="/Upload-LaporanAkhir/{{ $idproject }}" enctype="multipart/form-data">
        @csrf
            <div class="modal-body">
              <div class="row">
                <div class="col mb-3">
                
                  <label for="formFile" class="form-label">File Laporan Akhir</label>
                  <input class="form-control" type="file" id="formFile" name="filelaporan" />
                 
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                Close
              </button>
              <button type="submit" class="btn btn-primary">Upload</button>
            </div>
          </div>
    </form> 
        </div>
      </div>

@endsection
