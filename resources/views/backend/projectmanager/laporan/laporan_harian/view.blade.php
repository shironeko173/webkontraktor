@extends('backend.component.main')
@section('content')
    <div class="container-xxl flex-grow-1 container-p-y" id="isi">
        <div class="row">
            <div class="col-12 mb-4 order-0">
                <div class="card">
                    <div class="d-flex align-items-end row">
                        <div class="text-center fs-1">Laporan harian</div>
                        <div class="container d-flex ms-3 mt-3">
                            <div class="col-3">
                                <label >Project :{{ $identify->nama_project }}</label><br>
                                <label >Tanggal :{{ Carbon\Carbon::parse($identify->waktu_dikirim)->format('d M Y - H:i:s') }} </label><br>
                                <label >Dari    :{{ $identify->name }} </label>
                            </div>
                        </div>
                        <div class="my-5">
                            <div class="container d-flex">
                                <div class="me-auto text-start fs-4 ms-3">1. Pekerjaan</div>
                            </div>
                            <div class="container d-flex justify-content-center">
                                <div class="col-10">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Jenis Pekerjaan</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody id="pekerjaan">
                                            @forelse ($data_pkr as $item)
                                            <tr>
                                                <td>{{ $i++ }}</td>
                                                <td>{{ $item->jenis_pekerjaan }}</td>
                                                <td>{{ $item->volume }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                            </tr>
                                            @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse

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
                                                <th scope="col">No.</th>
                                                <th scope="col">Jenis Pekerjaan</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <p style="display: none">{{ $i=1 }}</p>
                                            @forelse ($data_tmpb as $item)
                                                <tr>
                                                    <td>{{ $i++ }}</td>
                                                    <td>{{ $item->jenis }}</td>
                                                    <td>{{ $item->volume }}</td>
                                                    <td>{{ $item->lokasi }}</td>
                                                </tr>
                                                @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse
                                            
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
                                                <th scope="col">Jenis</th>
                                                <th scope="col">Volume</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <p style="display: none">{{ $i=1 }}</p>
                                            @forelse ($data_pr as $item)
                                            <tr>
                                                <td>{{ $i++ }}</td>
                                                <td>{{ $item->jenis }}</td>
                                                <td>{{ $item->volume }}</td>
                                                <td>{{ $item->lokasi }}</td>
                                            </tr>
                                            @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse
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
                                            <p style="display: none">{{ $i=1 }}</p>
                                            @forelse ($data_pk as $item)
                                                <tr>
                                                    <td>{{ $i++ }}</td>
                                                    <td>{{ $item->tugas_jabatan }}</td>
                                                    <td>{{ $item->jumlah }}</td>
                                                    <td>{{ $item->lokasi }}</td>
                                                </tr>
                                                @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse
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
                                                <th scope="col">Jam s/d Jam</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <p style="display: none">{{ $i=1 }}</p>
                                            @forelse ($data_cba as $item)
                                                <tr>
                                                    <td>{{ $i++ }}</td>
                                                    <td>{{ $item->jenis }}</td>
                                                    <td>{{ $item->rentang_waktu }}</td>
                                                    <td>{{ $item->ket }}</td>
                                                </tr>
                                                @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse

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
                                                <th scope="col">Jam s/d Jam</th>
                                                <th scope="col">Lokasi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <p style="display: none">{{ $i=1 }}</p>
                                            @forelse ($data_kjpp as $item)
                                                <tr> 
                                                    <td>{{ $i++ }}</td>
                                                    <td>{{ $item->jenis}}</td>
                                                    <td>{{ $item->rentang_jam}}</td>
                                                    <td>{{ $item->ket}}</td>
                                                </tr>    
                                                @empty
                                                <td colspan="4" style="text-align: center">tidak ada data</td>
                                            @endforelse    
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

@endsection
 