@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Document</li>
      <li class="breadcrumb-item active">
        <a href="/repository-project">Repository Project</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

      <!-- Bordered Table -->
    <div class="card">
      <h5 class="card-header">Repository Project</h5>
       <!-- Search -->
        <div >
      <!-- /Search -->
      <div class="card-body">
        <div class="col-md-3 col-lg-2"> 
          <form action="/repository-project" method="GET">
            <div class="input-group input-group-merge md-4 mb-4">
                <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                <input
                type="text"
                name="search"
                class="form-control"
                placeholder="Search..."
                aria-label="Search..."
                aria-describedby="basic-addon-search31"
                />
            </div>
          </form>
        </div>
        <div class="table-responsive text-nowrap">
            
          <table class="table table-bordered" style="text-align: center">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Project</th>
                <th>Tanggal Mulai</th>
                <th>Tanggal Selesai</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
              @forelse ($project as $item)
                  <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $item->nama_project }}</td>
                    <td>{{ Carbon\Carbon::parse($item->created_at)->format('d M Y - H:i:s') }}</td>
                    <td>{{ Carbon\Carbon::parse($item->updated_at)->format('d M Y - H:i:s') }}</td>
                    <td><a href="/project/{{ $item->id_project }}" type="button" style="font-size: 0.7rem;" class="btn rounded-pill btn-info">View</a></td>
                  </tr>
              @empty
                  <tr>
                    <td colspan="5">Belum ada data saat ini.</td>
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