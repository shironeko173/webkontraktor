@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item active">
        <a href="/create-project">Buat Project</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

    <div class="card mb-4">
        <form method="POST" action="/buatproject">
            @csrf

        
            <h5 class="card-header">Form Buat Project</h5>
            <div class="card-body">
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Nama Project</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="nama" value="" placeholder="Masukkan Nama Project.." id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Lokasi</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="lokasi" value="" placeholder="Masukkan tempat dan lokasi project.." id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Estimasi Waktu</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="estimasi" value="" placeholder="Masukkan perkiraan waktu pengerjaan project.." id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="html5-text-input" class="col-md-2 col-form-label">Cost</label>
                <div class="col-md-10">
                <input class="form-control" type="text" name="cost" value="" placeholder="Masukkan biaya project.." id="html5-text-input" />
                </div>
            </div>
            <div class="mb-3 row">
                <label class="form-label col-md-2" for="basic-default-message">deskripsi</label>
                <div class="col-md-10">
                    <textarea id="basic-default-message" name="deskripsi" class="form-control" placeholder="..."></textarea>
                </div>
                
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
            </div>

        </form>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection