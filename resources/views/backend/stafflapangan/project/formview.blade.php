@foreach ($status as $status)
  
@if ($status->status == 'Belum Dikirim')

    <div class="container-xxl flex-grow-1 container-p-y" id="isi">
        <div class="row">
            <div class="col-12 mb-4 order-0">
                <div class="card">
                    <div class="d-flex align-items-end row">
                        <div class="text-center fs-1">Form Laporan harian</div>
                    
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">1. Pekerjaan</div>
                                
                                <div class="justify-content-end me-3"><button type="button" class="btn btn-primary btn-sm"
                                        onclick="openFormPekerjaan()">Tambah</button></div>
                                    
            
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                            
                                                <th scope="col">Kode</th>
                                                <th scope="col">Jenis Pekerjaan</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody id="pekerjaan">
                                            @foreach ($datapkr as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->jenis_pekerjaan }}</td>
                                                <td>{{ $item->volume }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                                <td> <a href="/hapuspkr/{{ $item->kode_laporan_harian }}/{{ $item->jenis_pekerjaan }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach
                                        

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">2. TIBA MUTASI PERATALATAN DAN BAHAN KONSTRUKSI
                                    POKOK</div>
                                    <div class="justify-content-end me-3"><button type="button"
                                        class="btn btn-primary btn-sm" onclick="openFormtmpb()">Tambah</button></div>
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Kode</th>
                                                <th scope="col">Jenis</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($datatmpb as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->jenis }}</td>
                                                <td>{{ $item->volume }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                                <td> <a href="/hapustmpb/{{ $item->kode_laporan_harian }}/{{ $item->jenis }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">3. PEMAKAIAN PERALATAN</div>
                                <div class="justify-content-end me-3"><button type="button"
                                    class="btn btn-primary btn-sm" onclick="openFormpr()">Tambah</button></div>
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Kode</th>
                                                <th scope="col">Jenis</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($datapr as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->jenis }}</td>
                                                <td>{{ $item->volume }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                                <td> <a href="/hapuspr/{{ $item->kode_laporan_harian }}/{{ $item->jenis }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">4. PERSONIL KONTRAKTOR/KONSULTAN DAN PROYEK</div>
                                <div class="justify-content-end me-3"><button type="button"
                                    class="btn btn-primary btn-sm" onclick="openFormpk()">Tambah</button></div>
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Tugas/Jabatan</th>
                                                <th scope="col">Jumlah</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($datapk as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->tugas_jabatan }}</td>
                                                <td>{{ $item->jumlah }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                                <td> <a href="/hapuspk/{{ $item->kode_laporan_harian }}/{{ $item->tugas_jabatan }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach
                            

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">5. Cuaca Dan bencana Alam</div>
                                <div class="justify-content-end me-3"><button type="button"
                                    class="btn btn-primary btn-sm" onclick="openFormcba()">Tambah</button></div>
                                
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Jenis</th>
                                                <th scope="col"  class="">Jam s/d Jam</th>
                                                <th scope="col">Lokasi</th>
                                                <th scope="col">aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($datacba as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->jenis }}</td>
                                                <td class="">{{ $item->rentang_waktu }}</td>
                                                <td>{{ $item->ket }}</td>
                                                <td> <a href="/hapuscba/{{ $item->kode_laporan_harian }}/{{ $item->jenis }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach
                                        

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">6. KEJADIAN LAIN PENGHAMBAT PEKERJAAN</div>
                                <div class="justify-content-end me-3"><button type="button"
                                    class="btn btn-primary btn-sm" onclick="openFormkjpp()">Tambah</button></div>
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Jenis</th>
                                                <th scope="col" >Jam s/d Jam</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($datakjpp as $item)
                                            <tr>
                                                <td>{{ $item->kode_laporan_harian }}</td>
                                                <td>{{ $item->jenis }}</td>
                                                <td>{{ $item->rentang_jam }}</td>
                                                <td>{{ $item->ket }}</td>
                                                <td> <a href="/hapuskjpp/{{ $item->kode_laporan_harian }}/{{ $item->jenis }}"class="btn btn-danger btn-sm"><i class="bi bi-x-lg"></i></i></a></td>
                                            </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-backdrop fade"></div>
        </div>
        <!-- Content wrapper -->
    </div>
@else
<div class="container-xxl flex-grow-1 container-p-y" id="isi">
    <div class="row">
        <div class="col-12 mb-4 order-0">
            <div class="card">
                <div class="d-flex align-items-end row">
                    <div class="text-center fs-1">Form Laporan harian</div>
                 
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">1. Pekerjaan</div>
                      
                                
           
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                           
                                            <th scope="col">Kode</th>
                                            <th scope="col">Jenis Pekerjaan</th>
                                            <th scope="col">Volume</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody id="pekerjaan">
                                        @foreach ($datapkr as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->jenis_pekerjaan }}</td>
                                            <td>{{ $item->volume }}</td>
                                            <td>{{ $item->lokasi }}</td>
                                            
                                        </tr>
                                        @endforeach
                                    

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">2. TIBA MUTASI PERATALATAN DAN BAHAN KONSTRUKSI
                                POKOK</div>
                     
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Kode</th>
                                            <th scope="col">Jenis</th>
                                            <th scope="col">Volume</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datatmpb as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->jenis }}</td>
                                            <td>{{ $item->volume }}</td>
                                            <td>{{ $item->lokasi }}</td>
                                        </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">3. PEMAKAIAN PERALATAN</div>
                       
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Kode</th>
                                            <th scope="col">Jenis</th>
                                            <th scope="col">Volume</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datapr as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->jenis }}</td>
                                            <td>{{ $item->volume }}</td>
                                            <td>{{ $item->lokasi }}</td>
                                        </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">4. PERSONIL KONTRAKTOR/KONSULTAN DAN PROYEK</div>
              
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Tugas/Jabatan</th>
                                            <th scope="col">Jumlah</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datapk as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->tugas_jabatan }}</td>
                                            <td>{{ $item->jumlah }}</td>
                                            <td>{{ $item->lokasi }}</td>
                                        </tr>
                                        @endforeach
                        

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">5. Cuaca Dan bencana Alam</div>
                     
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Jenis</th>
                                            <th scope="col"  class="">Jam s/d Jam</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datacba as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->jenis }}</td>
                                            <td class="">{{ $item->rentang_waktu }}</td>
                                            <td>{{ $item->ket }}</td>
                                        </tr>
                                        @endforeach
                                    

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="my-5">
                        <div class="container d-flex">
                            <div class="me-auto text-start fs-4 ms-3">6. KEJADIAN LAIN PENGHAMBAT PEKERJAAN</div>
                     
                        </div>
                        <div class="container d-flex justify-content-center">
                            <div class="col-10">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Jenis</th>
                                            <th scope="col" >Jam s/d Jam</th>
                                            <th scope="col">Lokasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datakjpp as $item)
                                        <tr>
                                            <td>{{ $item->kode_laporan_harian }}</td>
                                            <td>{{ $item->jenis }}</td>
                                            <td>{{ $item->rentang_jam }}</td>
                                            <td>{{ $item->ket }}</td>
                                        </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-backdrop fade"></div>
    </div>
    <!-- Content wrapper -->
</div>
@endif

@endforeach

