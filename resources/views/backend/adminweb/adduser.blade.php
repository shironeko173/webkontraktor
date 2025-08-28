@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">User Setting</li>
      <li class="breadcrumb-item active">
        <a href="/add-user">Add User</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

    <div class="card mb-4">
        <h5 class="card-header">Form Add User</h5>
        @if(session('status'))
            <div class="alert alert-success">
           {{session('status')}}
            </div>
        @endif
        <div class="card-body">
          <form action="/c-user" method="POST">
            @csrf
          <div class="mb-3 row">
            <label for="name" class="col-md-2 col-form-label">Nama</label>
            <div class="col-md-10">
              <input class="form-control" type="text" placeholder="Masukkan Nama Karyawan" name="name"/>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="email" class="col-md-2 col-form-label">Email</label>
            <div class="col-md-10">
              <input class="form-control" type="email" placeholder="Masukkan email" name="email" />
              @error('email')
                <div class="alert alert-danger" style="width: 250px">{{ $message }}</div>
              @enderror
            </div>
          </div>
          <div class="mb-3 row">
            <label for="password" class="col-md-2 col-form-label">Password</label>
            <div class="col-md-10">
              <input class="form-control" type="password" placeholder="Masukkan Password" name="password" />
              @error('password')
               <div class="alert alert-danger" style="width: 250px">{{ $message }}</div>
              @enderror
            </div>
          </div>
          <div class="mb-3 row">
              <div class="col-md-12">
                <label class="col-md-2 col-form-label">Jabatan</label>
                <select class="form-select" style="width:400px; display:inline-block;" name="jabatan" aria-label="Default select example">
                    <option disabled>Pilih Posisi Karyawan</option>
                    @if (Auth::user()->jabatan == 'Direktur')
                      <option value="Staff">Staff Kantor</option>
                      <option value="Drafter">Drafter</option>
                      <option value="Admin">Admin Lapangan</option>
                      <option value="Pengawas_Lapangan">Pengawas Lapangan</option>
                      <option value="AdminWeb">Admin Web</option>
                    @else
                      <option value="Staff">Staff Kantor</option>
                      <option value="Drafter">Drafter</option>
                      <option value="Admin">Admin Lapangan</option>
                      <option value="Pengawas_Lapangan">Pengawas Lapangan</option>
                    @endif
                    
                  </select>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Create</button>
        </div>
      </form>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection