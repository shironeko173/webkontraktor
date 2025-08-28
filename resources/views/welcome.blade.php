@include('layouts.top')
<!-- Carousel Start -->
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1"></li>
                    <li data-target="#carousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="{{asset('frontend/img/carousel-1.jpg')}}" alt="Carousel Image">
                        <div class="carousel-caption">
                            <p class="animated fadeInRight">We Are Professional</p>
                            <h1 class="animated fadeInLeft">For Your Dream Project</h1>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img src="{{asset('frontend/img/carousel-2.jpg')}}" alt="Carousel Image">
                        <div class="carousel-caption">
                            <p class="animated fadeInRight">Professional Builder</p>
                            <h1 class="animated fadeInLeft">We Build Your Home</h1>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img src="{{asset('frontend/img/carousel-3.jpg')}}" alt="Carousel Image">
                        <div class="carousel-caption">
                            <p class="animated fadeInRight">We Are Trusted</p>
                            <h1 class="animated fadeInLeft">For Your Dream Home</h1>
                        </div>
                    </div>
                </div>

                <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Carousel End -->

            <!-- Feature Start-->
            <div class="feature wow fadeInUp" data-wow-delay="0.1s">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-4 col-md-12">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="flaticon-worker"></i>
                                </div>
                                <div class="feature-text">
                                    <h3>Expert Worker</h3>
                                    <p>Tenaga kerja yang handal</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="flaticon-building"></i>
                                </div>
                                <div class="feature-text">
                                    <h3>Quality Work</h3>
                                    <p>Kualitas kerja yang baik</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="flaticon-call"></i>
                                </div>
                                <div class="feature-text">
                                    <h3>24/7 Support</h3>
                                    <p>Siap membantu anda kapanpun</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Feature End-->

            <!-- About Start -->
            <div class="about wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-md-6">
                            <div class="about-img">
                                <img src="{{asset('frontend/img/about.jpg')}}" alt="Image">
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                            <div class="section-header text-left">
                                <p>Welcome to CV. KARYA RIZKI</p>
                                <h2>9 Years Experience</h2>
                            </div>
                            <div class="about-text">
                                <p>
                                    CV. KARYA RIZKI berpengalaman lebih dari 9 tahun didalam bidan Kontruksi, renovasi, arsitek, RAB, Design 2D / 3D dan masih banyak lagi, dimana pengalaman mengajarkan kami hingga menjadi arsitek profesional dan dipercaya oleh para client hingga hari ini.
                                    Selain berpengalaman, CV. KARYA RIZKI juga memiliki team yang soli dan juga profesional..
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About End -->

            <!-- Fact Start -->
            <div class="fact">
                <div class="container-fluid">
                    <div class="row counters">
                        <div class="col-md-6 fact-left wow slideInLeft">
                            <div class="row">
                                <div class="col-6">
                                    <div class="fact-icon">
                                        <i class="flaticon-worker"></i>
                                    </div>
                                    <div class="fact-text">
                                        <h2 data-toggle="counter-up">109</h2>
                                        <p>Expert Workers</p>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="fact-icon">
                                        <i class="flaticon-building"></i>
                                    </div>
                                    <div class="fact-text">
                                        <h2 data-toggle="counter-up">485</h2>
                                        <p>Happy Clients</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 fact-right wow slideInRight">
                            <div class="row">
                                <div class="col-6">
                                    <div class="fact-icon">
                                        <i class="flaticon-address"></i>
                                    </div>
                                    <div class="fact-text">
                                        <h2 data-toggle="counter-up">278</h2>
                                        <p>Completed Projects</p>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="fact-icon">
                                        <i class="flaticon-crane"></i>
                                    </div>
                                    <div class="fact-text">
                                        <h2 data-toggle="counter-up">13</h2>
                                        <p>Running Projects</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fact End -->

            <!-- Service Start -->
            <div class="service">
                <div class="container">
                    <div class="section-header text-center">
                        <p>Our Services</p>
                        <h2>We Provide Services</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-1.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>Building Construction</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-1.jpg')}}" data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-2.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>House Renovation</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-2.jpg')}}" data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-3.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>Architecture Design</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-3.jpg')}}" data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-4.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>Interior Design</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-4.jpg')}} data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-5.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>Fixing & Support</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-5.jpg')}}" data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                            <div class="service-item">
                                <div class="service-img">
                                    <img src="{{asset('frontend/img/service-6.jpg')}}" alt="Image">
                                    <div class="service-overlay">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                        </p>
                                    </div>
                                </div>
                                <div class="service-text">
                                    <h3>Painting</h3>
                                    <a class="btn" href="{{asset('frontend/img/service-6.jpg')}}" data-lightbox="service">+</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Service End -->

            <!-- Video Start -->
            <div class="video wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <button type="button" class="btn-play" data-toggle="modal" data-src="https://youtu.be/4SLnuCsaVGE" data-target="#videoModal">
                        <span></span>
                    </button>
                </div>
            </div>
            
            <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>        
                            <!-- 16:9 aspect ratio -->
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://youtu.be/4SLnuCsaVGE" id="video"  allowscriptaccess="always" allow="autoplay"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Video End -->

            <!-- Team Start -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="team">
                        <div class="container">
                            <div class="section-header text-center">
                                <p>Our Team</p>
                                <h2>Meet Our Engineer</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-1.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Adam Phillips</h2>
                                            <p>CEO & Founder</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-2.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Dylan Adams</h2>
                                            <p>Civil Engineer</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-3.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Jhon Doe</h2>
                                            <p>Interior Designer</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-4.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Josh Dunn</h2>
                                            <p>Painter</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <div class="team">
                            <div class="container">
                                <div class="section-header text-center">
                                    <p>Our Team</p>
                                    <h2>Meet Our Engineer</h2>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                        <div class="team-item">
                                            <div class="team-img">
                                                <img src="{{asset('frontend/img/team-1.jpg')}}" alt="Team Image">
                                            </div>
                                            <div class="team-text">
                                                <h2>Adam Phillips</h2>
                                                <p>CEO & Founder</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                        <div class="team-item">
                                            <div class="team-img">
                                                <img src="{{asset('frontend/img/team-2.jpg')}}" alt="Team Image">
                                            </div>
                                            <div class="team-text">
                                                <h2>Dylan Adams</h2>
                                                <p>Civil Engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                        <div class="team-item">
                                            <div class="team-img">
                                                <img src="{{asset('frontend/img/team-3.jpg')}}" alt="Team Image">
                                            </div>
                                            <div class="team-text">
                                                <h2>Jhon Doe</h2>
                                                <p>Interior Designer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                                        <div class="team-item">
                                            <div class="team-img">
                                                <img src="{{asset('frontend/img/team-4.jpg')}}" alt="Team Image">
                                            </div>
                                            <div class="team-text">
                                                <h2>Josh Dunn</h2>
                                                <p>Painter</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                  </div>
                  <div class="carousel-item">
                    <div class="team">
                        <div class="container">
                            <div class="section-header text-center">
                                <p>Our Team</p>
                                <h2>Meet Our Engineer</h2>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-1.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Adam Phillips</h2>
                                            <p>CEO & Founder</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-2.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Dylan Adams</h2>
                                            <p>Civil Engineer</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-3.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Jhon Doe</h2>
                                            <p>Interior Designer</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                                    <div class="team-item">
                                        <div class="team-img">
                                            <img src="{{asset('frontend/img/team-4.jpg')}}" alt="Team Image">
                                        </div>
                                        <div class="team-text">
                                            <h2>Josh Dunn</h2>
                                            <p>Painter</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Team End -->

            <!-- FAQs Start -->
            <div class="faqs">
                <div class="container">
                    <div class="section-header text-center">
                        <p>Frequently Asked Question</p>
                        <h2>You May Ask</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div id="accordion-1">
                                <div class="card wow fadeInLeft" data-wow-delay="0.1s">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" href="#collapseOne">
                                            Lorem ipsum dolor sit amet?
                                        </a>
                                    </div>
                                    <div id="collapseOne" class="collapse" data-parent="#accordion-1">
                                        <div class="card-body">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non.
                                        </div>
                                    </div>
                                </div>
                                <div class="card wow fadeInLeft" data-wow-delay="0.2s">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" href="#collapseTwo">
                                            Lorem ipsum dolor sit amet?
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="collapse" data-parent="#accordion-1">
                                        <div class="card-body">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div id="accordion-2">
                                <div class="card wow fadeInRight" data-wow-delay="0.1s">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" href="#collapseSix">
                                            Lorem ipsum dolor sit amet?
                                        </a>
                                    </div>
                                    <div id="collapseSix" class="collapse" data-parent="#accordion-2">
                                        <div class="card-body">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non.
                                        </div>
                                    </div>
                                </div>
                                <div class="card wow fadeInRight" data-wow-delay="0.2s">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" href="#collapseSeven">
                                            Lorem ipsum dolor sit amet?
                                        </a>
                                    </div>
                                    <div id="collapseSeven" class="collapse" data-parent="#accordion-2">
                                        <div class="card-body">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- FAQs End -->

            <!-- Testimonial Start -->
            <div class="testimonial wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="testimonial-slider-nav">
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-1.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-2.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-3.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-4.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-1.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-2.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-3.jpg')}}" alt="Testimonial"></div>
                                <div class="slider-nav"><img src="{{asset('frontend/img/testimonial-4.jpg')}}" alt="Testimonial"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="testimonial-slider">
                                <div class="slider-item">
                                    <h3>DEKAN UNIMED</h3>
                                    <p>"Pilihan desain beragam yang tidak kaku, pelayanan sangat profesional, sukses selalu untuk CV. KARYA RIZKI"</p>
                                </div>
                                <div class="slider-item">
                                    <h3>R. DESI NOVITA SIANTURI,SE.,MM</h3>
                                    <p>"Pelayanan baik, marketing memberikan solusi pilihan terbaik saat melakukan konsultasi masalah rumah impian, terima kasih CV. KARYA RIZKI"</p>
                                </div>
                                <div class="slider-item">
                                    <h3>MUALIM KURNIAWAN</h3>
                                    <p>"Desain sangat menarik, terdapat banyak pilihan yang bisa saya pilih sesuai impian yang saya inginkan selama ini, terima kasih CV. KARYA RIZKI"</p>
                                </div>
                                <div class="slider-item">
                                    <h3>NUR APIPAH</h3>
                                    <p>"RAB atau rancangan anggaran biaya sangat jelas dan mendetail, dan desain sangat milenial, Terima kasih CV. KARYA RIZKI"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Testimonial End -->

@include('layouts.bottom')