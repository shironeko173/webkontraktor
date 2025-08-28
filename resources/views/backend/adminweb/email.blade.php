@extends('backend.component.main')
@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

      <!-- Bordered Table -->
    <div class="card">
      <h5 class="card-header">Email Project</h5>
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
                <th>No</th>
                <th>Nama Client</th>
                <th>Isi Pesan</th>
                <th>Tanggal</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
              @forelse ($email as $item)
                  <tr> 
                    <td>{{ $i++ }}</td>
                    <td>{{ $item->name }}</td>
                    <td>
                      <button type="button" style="font-size: 0.7rem;" class="btn rounded-pill btn-info"
                        data-name="{{ $item->name }}"
                        data-email="{{ $item->email }}" 
                        data-nohp="{{ $item->nohp }}" 
                        data-tanggal="{{ Carbon\Carbon::parse($item->created_at)->format('d M Y') }}" 
                        data-desc="{{ strip_tags($item->desc) }}" 
                        data-alamat="{{ $item->alamat }}" 
                        data-type="{{ $item->type }}" 
                        data-bs-toggle="modal" 
                        data-bs-target="#email-view">
                        View
                      </button>
                    </td>
                    <td>{{ Carbon\Carbon::parse($item->created_at)->format('d M Y') }}</td>
                    <td>
                      <form action="/deleteEmail/{{ $item->id_negosiasi }}" method="post" style="display: inline-block;">
                        @csrf
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" style="font-size: 0.7rem;" class="btn rounded-pill btn-danger show_confirm" data-toggle="tooltip" title='Delete'>x</button>
                      </form>

                    </td>
                  </tr>
              @empty
                <tr>
                  <td colspan="5">Belum ada email project saat ini.</td>
                </tr>
              @endforelse
              

            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!--/ Bordered Table -->

     <!-- Modal -->
     <div class="modal fade" id="email-view" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel1">Email Project</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col mb-2">
                <label for="nama" class="form-label">Nama</label>
                <input type="text" id="name" class="form-control" disabled />
              </div>
            </div>
            <div class="row g-2 mb-2">
              <div class="col mb-0">
                <label for="email" class="form-label">Email</label>
                <input type="text" id="email" class="form-control" disabled />
              </div>
              <div class="col mb-0">
                <label for="tanggal" class="form-label">Tanggal</label>
                <input type="text" id="tanggal" class="form-control" disabled />
              </div>
            </div>
            <div class="row g-2 mb-2">
              <div class="col mb-0">
                <label for="nohp" class="form-label">Nomor HP</label>
                <input type="text" id="nohp" class="form-control" disabled />
              </div>
              <div class="col mb-0">
                <label for="type" class="form-label">Paket Pengerjaan</label>
                <input type="text" id="type" class="form-control" disabled />
              </div>
            </div>
              <div class="row mb-2">
                <div class="col mb-3">
                  <label for="alamat" class="form-label">Alamat Pengerjaan</label>
                  <input type="text" id="alamat" class="form-control" disabled />
                </div>
              </div>
              <div class="row">
                <div class="col mb-3">
                  <label for="desc" class="form-label">Deskripsi</label>
                  <textarea class="form-control" id="desc" rows="3" disabled></textarea>
                </div>
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <!--/ Responsive Table -->
  </div>

  @push('custom-script')
      <script>
        $('#email-view').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget)
            var name = button.data('name')
            var email = button.data('email')
            var nohp = button.data('nohp')
            var tanggal = button.data('tanggal')
            var desc = button.data('desc')
            var alamat = button.data('alamat')
            var type = button.data('type')
            
      
            var modal = $(this)
            modal.find('.modal-body input#name').val(name);
            modal.find('.modal-body input#email').val(email);
            modal.find('.modal-body input#tanggal').val(tanggal);
            modal.find('.modal-body input#nohp').val(nohp);
            modal.find('.modal-body input#type').val(type);
            modal.find('.modal-body input#alamat').val(alamat);
            modal.find('.modal-body textarea#desc').val(desc);
        })
    </script>
    
    <script type="text/javascript">
 
      $('.show_confirm').click(function(event) {
           var form =  $(this).closest("form");
           var name = $(this).data("name");
           event.preventDefault();
           swal({
               title: `Apakah kamu yakin menghapus data ini?`,
               text: "sebelum kamu hapus, pastikan sudah dibaca.",
               icon: "warning",
               buttons: true,
               dangerMode: true,
           })
           .then((willDelete) => {
             if (willDelete) {
               form.submit();
             }
           });
       });
   
    </script>
  @endpush
@endsection