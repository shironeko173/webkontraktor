@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">User Setting</li>
      <li class="breadcrumb-item active">
        <a href="/user-info">User Info</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
        <h5 class="card-header">View User</h5>
        <div class="card-body">
          <div class="mb-3 row">
            <label for="html5-text-input" class="col-md-2 col-form-label">Nama</label>
            <div class="col-md-10">
              <input class="form-control" type="text" value="{{ $user->name }}" readonly />
            </div>
          </div>
          <div class="mb-3 row">
            <label for="html5-email-input" class="col-md-2 col-form-label">Email</label>
            <div class="col-md-10">
              <input class="form-control" type="email" value="{{ $user->email }}" readonly/>
            </div>
          </div>
          <div class="mb-3 row">
            <label class="col-md-2 col-form-label">Jabatan</label>
            <div class="col-md-10">
              <input class="form-control" type="text" value="{{ $user->jabatan }}" readonly />
            </div>
          </div>
        </div>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection