@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item">
        @if ($project->status == 'sedang_berjalan')
        <a href="/Project-Berjalan">Project Berjalan</a>
        @else
        <a href="/Project-Selesai">Project Selesai</a>
        @endif
        
      </li>
      <li class="breadcrumb-item active">
        <a href="/project/{{ $project->id_project }}">{{ $project->nama_project }}</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="col py-3">
            <div class="card h-100">
              <img class="card-img" src="https://picsum.photos/1800/900?grayscale" alt="Card image cap" style="height: 250px;" />
              <div class="card-img-overlay" style="padding: 5%;">
                <h1 class="card-title mt-4" style="text-align: center; color:white">{{ $project->nama_project }}</h1>
              </div>

              <div class="card-body" style="padding: 0.7rem 1.5rem;">
                <h3 class="mt-2" style="text-align: center; color:black">Start Date: {{ Carbon\Carbon::parse($project->created_at)->format('d M Y - H:i:s') }}</h3>
              </div>
               

            </div>
            @if (Auth::user()->jabatan == 'Direktur' && $project->status == 'sedang_berjalan') 
            
              <ul class="nav nav-pills flex-column flex-md-row mb-3 mt-3">
                <li class="nav-item">
                  <form action="/finishproject/{{ $project->id_project }}" method="post" style="display: inline-block;">
                    @csrf
                    <button class="nav-link active show_confirm" data-toggle="tooltip" title='Submit'>Submit Finish Project</button>
                  </form>
                </li>
              </ul>   
            @endif
            @if (Auth::user()->jabatan == 'Project_Manager' && $project->status == 'sedang_berjalan') 
            
              <ul class="nav nav-pills flex-column flex-md-row mb-3 mt-3">
                <li class="nav-item">
                  <form action="/finishproject/{{ $project->id_project }}" method="post" style="display: inline-block;">
                    @csrf
                    <button class="nav-link active show_confirm" data-toggle="tooltip" title='Submit'>Submit Finish Project</button>
                  </form>
                </li>
              </ul>   
            @endif
          </div>

          <div class="row mb-4">
            

              <div class="col-md-6 col-lg-6 mb-3 "> 
                <a href="/project/desc/{{ $project->id_project }}"><div class="card h-100">

                  <img class="card-img" src="https://picsum.photos/900/600?grayscale&1" alt="Card image cap" style="height: 200px;" />
                    <div class="card-img-overlay" style="padding: 8%;">
                      <h1 class="card-title mt-4" style="text-align: center; color:white">Detail Project</h1>
                    </div>
                  <div class="card-body" style="padding: 0.3rem 1.5rem;">
                    <h3 class="mt-2" style="text-align: center; color:black">View More</h3>
                  </div>
                </div></a>
              </div>
              <div class="col-md-6 col-lg-6 mb-3 ">
                <a href="/project/team/{{ $project->id_project }}"><div class="card h-100">

                  <img class="card-img" src="https://picsum.photos/900/600?grayscale&2" alt="Card image cap" style="height: 200px;" />
                    <div class="card-img-overlay" style="padding: 8%;">
                      <h1 class="card-title mt-4" style="text-align: center; color:white">Team Project</h1>
                    </div>
                  <div class="card-body" style="padding: 0.3rem 1.5rem;">
                    <h3 class="mt-2" style="text-align: center; color:black">View More</h3>
                  </div>
                </div></a>
              </div>
              <div class="col-md-6 col-lg-6 mb-3 ">
                <a href="/project/laporan/{{ $project->id_project }}"><div class="card h-100">

                  <img class="card-img" src="https://picsum.photos/900/600?grayscale&3" alt="Card image cap" style="height: 200px;" />
                    <div class="card-img-overlay" style="padding: 8%;">
                      <h1 class="card-title mt-4" style="text-align: center; color:white">Laporan Project</h1>
                    </div>
                  <div class="card-body" style="padding: 0.3rem 1.5rem;">
                    <h3 class="mt-2" style="text-align: center; color:black">View More</h3>
                  </div>
                </div></a>
              </div>
    </div>

    @push('custom-script')
    
    <script type="text/javascript">
 
      $('.show_confirm').click(function(event) {
           var form =  $(this).closest("form");
           var name = $(this).data("name");
           event.preventDefault();
           swal({
               title: `Konfirmasi`,
               text: "Apakah Kamu yakin Mensubmit Selesai Project ini?",
               icon: "warning",
               buttons: true,
               dangerMode: true,
           })
           .then((willSubmit) => {
             if (willSubmit) {
               form.submit();
             }
           });
       });
   
    </script>
  @endpush
@endsection
