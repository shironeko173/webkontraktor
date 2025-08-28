@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Akun Setting</li>
      <li class="breadcrumb-item active">
        <a href="/edit-akun">Edit Akun</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
      @if(session('status'))
            <div class="alert alert-success">
           {{session('status')}} 
            </div>
        @endif
        <h5 class="card-header">Form Edit User</h5>
        <form action="/update-akun" method="post">
        @csrf
        <div class="card-body">
          <div class="mb-3 row">
            <label for="html5-text-input" class="col-md-2 col-form-label">Nama</label>
            <div class="col-md-10">
              <input class="form-control" type="text" value="{{ $user->name }}" name="name"/>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="html5-email-input" class="col-md-2 col-form-label">Email</label>
            <div class="col-md-10">
              <input class="form-control" type="email" value="{{ $user->email }}" name="email"/>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Update</button>
        </div>
      </form>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection