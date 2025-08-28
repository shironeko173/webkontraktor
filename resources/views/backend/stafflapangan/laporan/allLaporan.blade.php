@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item">
        <a href="/My-Project/Sedang-Berjalan">Project Berjalan</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/stafflapangan/sb-laporan/{{ $project->id_project }}">{{ $project->nama_project }}</a>
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
                <h1 class="card-title mt-4" style="text-align: center; color:white">{{ $project->nama_project }}</h1>
              </div>
            <div class="card-body" style="padding: 0.7rem 1.5rem;">
              <h3 class="mt-2" style="text-align: center; color:black">Start Date: {{ Carbon\Carbon::parse($project->created_at)->format('d M Y - H:i:s') }}</h3>
            </div>
            </div>
          </div>

          <div class="row mb-5">
            <div class="col-md">
              <div class="card mb-3">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img class="card-img card-img-left" src="{{ asset('images/LH.png') }}" alt="Card image" />
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h3 class="card-title">Laporan Harian</h3>
                      <p class="card-text">
                        This is a wider card with supporting text below as a natural lead-in to additional content.
                        This content is a little bit longer.
                      </p>
                      <a href="/stafflapangan/Laporan-Harian/{{ $project->id_project }}" type="button" class="btn btn-primary">View More</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md">
              <div class="card mb-3">
                <div class="row g-0">
                  <div class="col-md-8">
                    <div class="card-body">
                      <h3 class="card-title">Laporan Progress</h3>
                      <p class="card-text">
                        This is a wider card with supporting text below as a natural lead-in to additional content.
                        This content is a little bit longer.
                      </p>
                      <a href="/stafflapangan/Laporan-Progress/{{ $project->id_project }}" type="button" class="btn btn-primary">View More</a>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <img class="card-img card-img-right" src="{{ asset('images') }}/LP.png" alt="Card image" />
                  </div>
                </div>
              </div>
            </div>
          </div> 
          <div class="row mb-5">
            <div class="col-md">
              <div class="card mb-3">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img class="card-img card-img-left" src="{{ asset('images') }}/LR.png" alt="Card image" />
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h3 class="card-title">Laporan RAB</h3>
                      <p class="card-text">
                        This is a wider card with supporting text below as a natural lead-in to additional content.
                        This content is a little bit longer.
                      </p>
                      <a href="/stafflapangan/Laporan-RAB/{{ $project->id_project }}" type="button" class="btn btn-primary">View More</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md">
              <div class="card mb-3">
                <div class="row g-0">
                  <div class="col-md-8">
                    <div class="card-body">
                      <h3 class="card-title">Dokumen Tambahan</h3>
                      <p class="card-text">
                        This is a wider card with supporting text below as a natural lead-in to additional content.
                        This content is a little bit longer.
                      </p>
                      <a href="/stafflapangan/Dokumen-Tambahan/{{ $project->id_project }}" type="button" class="btn btn-primary">View More</a>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <img class="card-img card-img-right" src="{{ asset('images') }}/DT.png" alt="Card image" />
                  </div>
                </div>
              </div>
            </div>
          </div>
    </div>
@endsection