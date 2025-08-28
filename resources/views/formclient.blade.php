<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title></title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Construction Company Website Template" name="keywords">
        <meta content="Construction Company Website Template" name="description">

        <!-- Favicon -->
        <link href="{{asset('frontend/img/favicon.ico')}}" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="{{asset('frontend/lib/flaticon/font/flaticon.css')}}" rel="stylesheet"> 
        <link href="{{asset('frontend/lib/animate/animate.min.css')}}" rel="stylesheet">
        <link href="{{asset('frontend/lib/owlcarousel/assets/owl.carousel.min.css')}}" rel="stylesheet">
        <link href="{{asset('frontend/lib/lightbox/css/lightbox.min.css')}}" rel="stylesheet">
        <link href="{{asset('frontend/lib/slick/slick.css')}}" rel="stylesheet">
        <link href="{{asset('frontend/lib/slick/slick-theme.css')}}" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="{{asset('frontend/css/style.css')}}" rel="stylesheet">
    </head>

    <body>
        <div class="wrapper">
            <!-- Top Bar Start -->
            <div class="top-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-4 col-md-12">
                            <div class="logo">
                                <a href="/">
                                    <h2>CV. KARYA RIZKI</h2>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7 d-none d-lg-block">
                            <div class="row">
                                <div class="col-4">
                                    <div class="top-bar-item">
                                        <div class="top-bar-icon">
                                            <i class="flaticon-calendar"></i>
                                        </div>
                                        <div class="top-bar-text">
                                            <h3>Opening Hour</h3>
                                            <p>SENIN - SABTU,<br>08.00 - 16.00 WIB</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="top-bar-item">
                                        <div class="top-bar-icon">
                                            <i class="flaticon-call"></i>
                                        </div>
                                        <div class="top-bar-text">
                                            <h3>Call Us</h3>
                                            <p>061-4291-0317</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="top-bar-item">
                                        <div class="top-bar-icon">
                                            <i class="flaticon-send-mail"></i>
                                        </div>
                                        <div class="top-bar-text">
                                            <h3>Email Us</h3>
                                            <p>info@example.com</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Top Bar End -->

            <!-- Nav Bar Start -->
            <div class="nav-bar">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
                        <a href="#" class="navbar-brand">MENU</a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto">
                                <a href="/" class="nav-item nav-link active">Home</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Nav Bar End -->

            <!-- Page Header Start -->
            <div class="page-header">
                <div class="container" style="opacity: inherit">
                    <div class="col-12">
                        <h2>Propose Project</h2>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->

            <!-- About Start -->
            <div class="about wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="row align-items-center">
                            <div class="section-header text-left">
                                @if(session('status'))
                                            <div class="alert alert-success" role="alert">
                                        {{session('status')}}
                                        </div>
                                     @endif
                                <p>Welcome to CV. KARYA RIZKI</p>
                                <h3>Fill the form</h3>
                            </div>
                            <div class="about-text">
                                <div class="contact-form">
                                    <form action="/kirimemail" method="POST">
                                        @csrf
                                        <div class="row mb-3">
                                          <label for="nama" class="col-sm-2 col-form-label">Nama</label>
                                          <div class="col-sm-7">
                                            <input type="text" class="form-control" id="name" name="name">
                                          </div>
                                        </div>
                                        <div class="row mb-3">
                                          <label for="email" class="col-sm-2 col-form-label">Email</label>
                                          <div class="col-sm-7">
                                            <input type="email" class="form-control" id="email" name="email">
                                          </div>
                                        </div>
                                        <div class="row mb-3">
                                          <label for="alamat" class="col-sm-2 col-form-label">Alamat Pengerjaan</label>
                                          <div class="col-sm-7">
                                            <input type="text" class="form-control" id="alamat" name="alamat">
                                          </div>
                                        </div>
                                        <div class="row mb-3">
                                          <label for="hp" class="col-sm-2 col-form-label">No. Handphone</label>
                                          <div class="col-sm-7">
                                            <input type="number" class="form-control" id="hp" name="nohp">
                                          </div>
                                        </div>
                                        <div class="row mb-3">
                                          <label for="paket" class="col-sm-2 col-form-label">Paket Pengerjaan</label>
                                          <div class="col-sm-7">
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="type">
                                                <option selected disabled>Pilih Paket</option>
                                                <option value="Pengerjaan">Pengerjaan</option>
                                                <option value="Perencanaan">Perencanaan</option>
                                                <option value="Pengerjaan Dan Perencanaan">Pengerjaan Dan Perencanaan</option>
                                              </select>
                                          </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="desc" class="col-sm-2 col-form-label">Deskripsi Project</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control" id="desc" name="desc" rows="3"></textarea> 
                                            </div>
                                          </div>
                                        <div class="col-md-8 ms-md-auto">
                                            <br>
                                            <button type="submit" class="btn btn-primary">Propose Project</button>
                                        </div>
                                      </form>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <!-- About End -->
@include('layouts.bottom')