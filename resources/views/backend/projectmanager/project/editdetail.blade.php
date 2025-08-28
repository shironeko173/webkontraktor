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
         
            <h5 class="card-header">Detail Project</h5>
            <div class="card-body">
        <form action="/Update-Detail/{{ $project_detail->id_project }}" method="POST">
            @csrf
            
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Nama Project</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="nama" value="{{ $project->nama_project }}" id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Lokasi</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="lokasi" value="{{ $project->lokasi }}"  id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Estimasi Waktu</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="estimasi" value="{{ $project->estimasi }}" id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Cost</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="cost" value="{{ $project->cost }}"  id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label class="form-label col-md-2" for="basic-default-message">deskripsi</label>
                <div class="col-md-10">
                    <textarea id="basic-default-message" name="deskripsi" class="form-control">{{ $project->deskripsi }}</textarea>
                </div>
                
            </div>
            <div class="col-12" style="text-align: center;">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
            </div>
           
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection