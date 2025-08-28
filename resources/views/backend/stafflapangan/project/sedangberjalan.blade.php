@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Project</li>
      <li class="breadcrumb-item active">
        <a href="/My-Project/Sedang-Berjalan">Project Berjalan</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="text-center my-4">
            <h1>Project's Running</h1>
        </div>
        <div class="row">
            @foreach ($project as $item) 
                  
                <div class="card mt-3" >
                    <div class="d-flex align-items-end row">
                        <div class="card-body" style="padding-bottom: 1rem;">
                                <div class="row">
                                <div class="col col-lg-1"><i class="tf-icons bx bx-spreadsheet" style="font-size: 80px;"></i></div>
                                <div class="col col-lg-4"><h3 style="margin-top: 3%">{{ $item->nama_project }}</h3><h6>Start Date: {{ Carbon\Carbon::parse($item->created_at)->format('d M Y - H:i:s') }}</h6></div>
                                <div class="col col-lg-2" style="text-align: center;">
                                  <img src="{{ asset('backend/style1') }}/assets/img/avatars/7.png" alt="Avatar" style="width: 50px;" class="rounded-circle mt-3" />
                                  <br><span class="badge bg-label-warning rounded-pill mt-3" style="text-align: center">{{ $item->Total }} People</span>
                                </div>
                                <div class="col col-lg-2" spellcheck="text-align: center;"><h5>Total Hari Berjalan</h5>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                          <span class="avatar-initial rounded bg-label-primary"><i class="bx bx-mobile-alt"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                          <div class="me-2">
                                            <h6 class="mb-0">{{ now()->diffInDays($item->created_at) }} Days</h6>
                                          </div>
                                        </div>
                                      </li>
                                </div>
                                <div class="col col-lg-2" style="text-align: center;"><h5>Status</h5> <span class="badge bg-label-info rounded-pill" style="font-size: 15px">Running</span></div>
                                <div class="col col-lg-1" style="text-align: center;"><h5>View More</h5> <a href="/stafflapangan/sb-laporan/{{ $item->id_project }}" type="button" class="btn btn-outline-primary"><span class="tf-icons bx bx-log-in-circle"></span></a></div>
                                
                                {{-- <h5 class="card-title text-primary text-center"><a href="/stafflapangan/sedang-berjalan/{{ $item->id_project }}">{{ $item->nama_project }}</a> </h5>
                                <p class="mb-2 text-center">
                                    {{ Carbon\Carbon::parse($item->created_at)->format('d M Y - H:i:s') }}
                                </p> --}}

                            </div>
                        </div>
                    
                    </div>
                </div>

            @endforeach
           
        

            <div class="content-backdrop fade"></div>
        </div>
        <!-- Content wrapper -->
    </div>
@endsection
