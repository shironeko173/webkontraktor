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
          <a href="/projectmanager/sb-team/{{ $project->id_project }}">Team</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

    <!-- Striped Rows -->
    <div class="card">
      <div class="row">
        <div class="col-9">
          <h5 class="card-header">>Daftar Tim Project : {{ $project->nama_project }}</h5>
        </div>

        @if (Auth::user()->jabatan == 'Direktur' && $project->status == 'sedang_berjalan') 
          <div class="col-3 mt-3" style="text-align: right;">
            <a href="/Edit-Team/{{ $project->id_project }}" class="btn btn-primary" style="margin-right: 20%;"><i class="bx bx-edit me-2" style="margin-bottom:2px "></i>Edit</a>
          </div>
        @endif
        @if (Auth::user()->jabatan == 'Project_Manager' && $project->status == 'sedang_berjalan') 
          <div class="col-3 mt-3" style="text-align: right;">
            <a href="/Edit-Team/{{ $project->id_project }}" class="btn btn-primary" style="margin-right: 20%;"><i class="bx bx-edit me-2" style="margin-bottom:2px "></i>Edit</a>
          </div>
        @endif

        

      </div>
      <div class="table-responsive text-nowrap">
        
            
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Nama</th>
                  <th>Email</th>
                  <th>Jabatan</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody class="table-border-bottom-0">
                @foreach ($team_project as $item)
                    <tr>
                        <td><input name="name" value="{{ $item->name }}" type="text" class="form-control" id="defaultFormControlInput" aria-describedby="defaultFormControlHelp" readonly></td>
                        <td><input name="email" value="{{ $item->email}}" type="text" class="form-control " id="defaultFormControlInput" aria-describedby="defaultFormControlHelp" readonly></td>
                        <td><input name="jabatan" value="{{ $item->jabatan }}" type="text" class="form-control " id="defaultFormControlInput" aria-describedby="defaultFormControlHelp" readonly></td>
                        <td><span class="badge bg-label-primary me-1 status">Active</span></td>
                    </tr>
                @endforeach
                
              </tbody>
              
            </table>

      </div>
    </div>
    <!--/ Striped Rows -->
    
    <!--/ Responsive Table -->
  </div>

@endsection