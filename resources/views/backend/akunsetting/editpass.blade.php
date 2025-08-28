@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Akun Setting</li>
      <li class="breadcrumb-item active">
        <a href="/edit-password">Ganti Password</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
      @error('pass_lama')  
        <div class="alert alert-danger" role="alert">{{ $message }}</div>
      @enderror
      @error('pass_baru')  
        <div class="alert alert-danger" role="alert">{{ $message }}</div>
      @enderror
      @error('pass_konfirmasi')  
        <div class="alert alert-danger" role="alert">{{ $message }}</div>
      @enderror
      @if(session('success'))
            <div class="alert alert-success">
           {{session('success')}}
            </div>
      @endif

      <h5 class="card-header">Form Update Password User : {{ $user->name }}</h5>
        <form action="/update-password" method="post">
        @csrf
        <div class="card-body">
          <div class="mb-3 row">
            <label for="html5-text-input" class="col-md-2 col-form-label">Password Lama</label>
            <div class="col-md-10">
              <input class="form-control" type="password" value="" name="pass_lama"/>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="html5-email-input" class="col-md-2 col-form-label">Password baru</label>
            <div class="col-md-10">
              <input class="form-control" type="password" value="" name="pass_baru"/>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="html5-email-input" class="col-md-2 col-form-label">Password Konfirmasi</label>
            <div class="col-md-10">
              <input class="form-control" type="password" value="" name="pass_konfirmasi"/>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Update</button>
        </div>
      </form>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection