<div class="popup container flex-grow-1 container-p-y   bg-light " id="formpekerjaan">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submitpkr" class="form-container py-3 px-3" method="post">
                    @csrf
                    <input type="hidden" value="{{ $PKR }}" name="kode_laporan_harian">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">Jenis Pekerjaan</label>
                        <input type="text" class="form-control" id="jenis_pekerjaan" name="jenis_pekerjaan">
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">Volume</label>
                        <input type="text" class="form-control" id="volume" name="volume">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">Lokasi</label>
                        <input type="text" class="form-control" id="lokasi" name="lokasi">
                    </div>
                
                    <button type="button" class="btn btn-cancel" onclick="closeformpekerjaan()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup container flex-grow-1 container-p-y   bg-light " id="formpr">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submitpr" method="post" class="form-container py-3 px-3">
                    @csrf
                    <input type="hidden" name="kode_laporan_harian" value="{{ $PR }}" id="">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">Jenis</label>
                        <input type="text" class="form-control" id="jenis" name="jenis" >
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">Volume</label>
                        <input type="text" class="form-control" id="volume" name="volume">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">Lokasi</label>
                        <input type="text" class="form-control" id="lokasi" name="lokasi">
                    </div>
                
                    <button type="button" class="btn btn-cancel" onclick="closeformpr()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup container flex-grow-1 container-p-y   bg-light " id="formpk">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submitpk" class="form-container py-3 px-3" method="post">
                    @method("post")
                    @csrf
                    <input type="hidden" value="{{ $PK }}" name="kode_laporan_harian">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">tugas jabatan</label>
                        <input type="text" class="form-control" id="jenis" name="tugas_jabatan" >
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">jumlah</label>
                        <input type="text" class="form-control" id="volume"  name="jumlah">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">Lokasi</label>
                        <input type="text" class="form-control" id="lokasi" name="lokasi">
                    </div>
                    <input type="hidden" name="kode_laporan_hari" value="">
                    <button type="button" class="btn btn-cancel" onclick="closeformpk()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup container flex-grow-1 container-p-y   bg-light " id="formcba">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submitcba" class="form-container py-3 px-3" method="post">
                    @csrf
                    <input type="hidden" value="{{ $cba }}" name="kode_laporan_harian">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">jenis</label>
                        <input type="text" class="form-control" id="jenis" name="jenis" >
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">rentang waktu</label>
                        <input type="text" class="form-control" id="volume"  name="rentang_waktu">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">Ket</label>
                        <input type="text" class="form-control" id="lokasi" name="ket">
                    </div>
                    <input type="hidden" name="kode_laporan_hari" value="">
                    <button type="button" class="btn btn-cancel" onclick="closeformcba()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup container flex-grow-1 container-p-y   bg-light " id="formtmpb">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submittmpb" class="form-container py-3 px-3" method="post">
                    @csrf
                    <input type="hidden" name="kode_laporan_harian" value="{{ $TMPB }}">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">jenis</label>
                        <input type="text" class="form-control" id="jenis" name="jenis" >
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">Volume</label>
                        <input type="text" class="form-control" id="volume"  name="volume">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">Lokasi</label>
                        <input type="text" class="form-control" id="lokasi" name="lokasi">
                    </div>
                    <input type="hidden" name="kode_laporan_hari" value="">
                    <button type="button" class="btn btn-cancel" onclick="closeformtmpb()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup container flex-grow-1 container-p-y   bg-light " id="formkjpp">
    <div class="row">
        <div class=" ms-5  col-8 mb-4 order-0">
            <div class="card">
                <form action="/submitkjpp" class="form-container py-3 px-3" method="post">
                    @csrf
                    <input type="hidden" value="{{ $kjpp }}" name="kode_laporan_harian">
                    <div class="mb-3">
                        <label for="jenis-pekerjaan" class="form-label">jenis</label>
                        <input type="text" class="form-control" id="jenis" name="jenis" >
                    </div>
                    <div class="mb-3">
                        <label for="Volume" class="form-label">rentang jam</label>
                        <input type="text" class="form-control" id="volume"  name="rentang_jam">
                    </div>
                    <div class="mb-3">
                        <label for="Lokasi" class="form-label">keterangan</label>
                        <input type="text" class="form-control" id="lokasi" name="ket">
                    </div>
                    <input type="hidden" name="kode_laporan_hari" value="">
                    <button type="button" class="btn btn-cancel" onclick="closeformkjpp()">Close</button>
                    <button type="submit"  class="btn btn-primary">send</button>
                </form>
            </div>
        </div>
    </div>
</div>
