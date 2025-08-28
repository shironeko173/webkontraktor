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

      <!-- Bordered Table -->
    <div class="card">
      <h5 class="card-header">All User</h5>
      @if(session('status'))
            <div class="alert alert-success">
           {{session('status')}}
            </div>
      @endif
      <div class="card-body">
        <div class="table-responsive text-nowrap">
          <table class="table table-bordered" style="text-align: center">
            <thead>
              <tr>  
                <th>Nama</th>
                <th>Email</th>
                <th>Jabatan</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
                @forelse($users as $user)
                <tr>
                  <td>{{$user->name}}</td>
                  <td>{{$user->email}}</td>
                  <td>
                    @if ($user->jabatan == 'Admin') Admin Lapangan 
                        @elseif($user->jabatan == 'Staff') Staff Kantor
                        @elseif($user->jabatan == 'Pengawas_Lapangan') Pengawas Lapangan
                        @elseif($user->jabatan == 'Project_Manager') Project Manager
                        @else {{ $user->jabatan }} @endif
                 </td>
                  <td>
                  @if (Auth::user()->jabatan == 'Direktur')
                      @if ($user->jabatan == 'Direktur')
                        <a href="/view-user/{{ $user->id }}" style="font-size: 0.7rem;" class="btn rounded-pill btn-info">View</a>
                      @else
                        <a href="/edit-user/{{ $user->id }}" style="font-size: 0.7rem;" class="btn rounded-pill btn-primary">Edit</a>
                        <form action="/delete/{{ $user->id }}" method="post" style="display: inline-block;">
                          @csrf
                          <input type="hidden" name="_method" value="DELETE">
                          <button type="submit" style="font-size: 0.7rem;" class="btn rounded-pill btn-danger">Delete</button>
                        </form>
                      @endif
                  @else  
                    @if ($user->jabatan == 'Direktur' || $user->jabatan == 'AdminWeb')
                      <a href="/view-user/{{ $user->id }}" style="font-size: 0.7rem;" class="btn rounded-pill btn-info">View</a>
                    @else
                      <a href="/edit-user/{{ $user->id }}" style="font-size: 0.7rem;" class="btn rounded-pill btn-primary">Edit</a>
                      <form action="/delete/{{ $user->id }}" method="post" style="display: inline-block;">
                        @csrf
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" style="font-size: 0.7rem;" class="btn rounded-pill btn-danger">Delete</button>
                      </form>
                    @endif
                  @endif
                 </td>
              </tr> 
                @empty
                <tr>
                  <td colspan="4"><b><i>TIDAK ADA DATA UNTUK DITAMPILKAN</i></b></td>
                </tr>
                @endforelse   
              </tbody>
          </table>
        </div>
      </div>
    </div>
    <!--/ Bordered Table -->

    
    <!--/ Responsive Table -->
  </div>
@endsection