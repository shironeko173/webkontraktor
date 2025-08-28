@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">User Setting</li>
      <li class="breadcrumb-item">
        <a href="/user-info">User Info</a>
      </li>
      <li class="breadcrumb-item active">
        <a href="/edit-user/{{ $iduser }}">Edit</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
        <h5 class="card-header">Form Edit User</h5>
        <form action="/update/{{$iduser}}" method="post">
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
          <div class="mb-3 row">
            <label class="col-md-2 col-form-label">Jabatan</label>
            <div class="col-md-10">
                <select class="form-select" name="jabatan" aria-label="Default select example">
                    <option value="{{ $user->jabatan }}" selected>
                        @if ($user->jabatan == 'Admin') Admin Lapangan 
                        @elseif($user->jabatan == 'Staff') Staff Kantor
                        @elseif($user->jabatan == 'Pengawas_Lapangan') Pengawas Lapangan
                        @elseif($user->jabatan == 'Project_Manager') Project Manager
                        @else {{ $user->jabatan }} @endif
                    </option>
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
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
    
    <!--/ Responsive Table -->
  </div>
@endsection