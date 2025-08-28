@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item">
          @if ($project->status == 'sedang_berjalan')
          <a href="/projectmanager/sedang-berjalan">Project Berjalan</a>
          @else
          <a href="/projectmanager/selesai">Project Selesai</a>
          @endif
      </li>
      <li class="breadcrumb-item">
          <a href="/projectmanager/sedang-berjalan/{{ $project->id_project }}">{{ $project->nama_project }}</a>
      </li>
      <li class="breadcrumb-item active">
          <a href="/projectmanager/sb-desc/{{ $project->id_project }}">Detail</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

    <div class="card mb-4">
        <div class="row">
            <div class="col-9">
                <h5 class="card-header">Detail Project</h5>
            </div> 

            @if (Auth::user()->jabatan == 'Direktur' && $project->status == 'sedang_berjalan') 
                <div class="col-3 mt-3" style="text-align: right;">
                    <a href="/Edit-Detail/{{ $project->id_project }}" class="btn btn-primary" style="margin-right: 20%;"><i class="bx bx-edit me-2" style="margin-bottom:2px "></i>Edit</a>
                </div>
            @endif
            @if (Auth::user()->jabatan == 'Project_Manager' && $project->status == 'sedang_berjalan') 
                <div class="col-3 mt-3" style="text-align: right;">
                    <a href="/Edit-Detail/{{ $project->id_project }}" class="btn btn-primary" style="margin-right: 20%;"><i class="bx bx-edit me-2" style="margin-bottom:2px "></i>Edit</a>
                </div>
            @endif

            
        </div> 
            <div class="card-body">
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Nama Project</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="nama" value="{{ $project->nama_project }}" id="html5-text-input" readonly />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Lokasi</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="lokasi" value="{{ $project->lokasi }}"  id="html5-text-input" readonly />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Estimasi Waktu</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="estimasi" value="{{ $project->estimasi }}" id="html5-text-input" readonly />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Cost</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="cost" value="{{ $project->cost }}"  id="html5-text-input" readonly />
                </div>
            </div>
            <div class="mb-3 row">
                <label class="form-label col-md-2" for="basic-default-message">deskripsi</label>
                <div class="col-md-10">
                    <textarea id="basic-default-message" name="deskripsi" class="form-control" readonly>{{ $project->deskripsi }}</textarea>
                </div>
                
            </div>
            </div>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection