@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">
        <a href="/projectmanager/sedang-berjalan/{{ $project->id_project }}">{{ $project->nama_project }}</a>
      </li>
      <li class="breadcrumb-item">
        <a href="/projectmanager/sb-laporan/{{ $project->id_project }}">Laporan</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/projectmanager/Laporan-Harian/{{ $project->id_project }}">Laporan Harian</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="col py-5"> 
            <div class="card h-100">
              <img class="card-img" src="{{ asset('images') }}/laporan5.png" alt="Card image cap" style="height: 250px;" />
              <div class="card-img-overlay" style="padding: 5%;">
                <h1 class="card-title mt-4" style="text-align: center; color:white">Laporan Harian</h1>
              </div>
            <div class="card-body" style="padding: 0.7rem 1.5rem;">
              <h3 class="mt-2" style="text-align: center; color:black">Project: {{ $project->nama_project }}</h3>
            </div>
            </div>
          </div>

          <div class="row mb-4">

              <div class="col-md-6 col-lg-6 mb-3 ">
                <a href="/projectmanager/Laporan-Harian/pending/{{ $project->id_project }}"><div class="card h-100">

                  <img class="card-img" src="{{ asset('images') }}/laporan2.png" alt="Card image cap" style="height: 200px;" />
                    <div class="card-img-overlay" style="padding: 8%;">
                      <h1 class="card-title mt-4" style="text-align: center; color:white">Belum Di-Verifikasi</h1>
                    </div>
                  <div class="card-body" style="padding: 0.3rem 1.5rem;">
                    <h3 class="mt-2" style="text-align: center; color:black">View More</h3>
                  </div>
                </div></a>
              </div>
              <div class="col-md-6 col-lg-6 mb-3 ">
                <a href="/projectmanager/Laporan-Harian/accept/{{ $project->id_project }}"><div class="card h-100">

                  <img class="card-img" src="{{ asset('images') }}/laporan2.png" alt="Card image cap" style="height: 200px;" />
                    <div class="card-img-overlay" style="padding: 8%;">
                      <h1 class="card-title mt-4" style="text-align: center; color:white">Sudah Di-Verifikasi</h1>
                    </div>
                  <div class="card-body" style="padding: 0.3rem 1.5rem;">
                    <h3 class="mt-2" style="text-align: center; color:black">View More</h3>
                  </div>
                </div></a>
              </div>
            

          </div>
    </div>
@endsection
