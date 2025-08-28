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
      </div>

      <div class="table-responsive text-nowrap">
        <form method="POST" action="/Update-Team/{{ $project->id_project }}">
          @csrf
            
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Nama</th>
                  <th>Email</th>
                  <th>Jabatan</th>
                  <th>Status</th>
                  <th> <a href="javascript:void(0)" class="btn btn-icon btn-primary addRow">+</a></th>
                </tr>
              </thead>
              <tbody class="table-border-bottom-0">
                @foreach ($team_project as $item)
                    <tr>
                        <td><select class="form-select changeIN" id="exampleFormControlSelect1" aria-label="Default select example" name="input_team[]">
                          <option value="{{ $item->id_user }}" selected>{{ $item->name }}</option>
                          @foreach ($users as $user)  
                            <option data-email="{{ $user->email }}" data-jabatan="{{ $user->jabatan }}" value="{{ $user->id }}">{{ $user->name }}</option>
                          @endforeach
                          </select>
                        </td>
                        <td><input name="email[]" value="{{ $item->email}}" type="text" class="form-control email" id="defaultFormControlInput" aria-describedby="defaultFormControlHelp" readonly></td>
                        <td><input name="jabatan[]" value="{{ $item->jabatan }}" type="text" class="form-control jabatan" id="defaultFormControlInput" aria-describedby="defaultFormControlHelp" readonly></td>
                        <td><input type="hidden" name="id_project[]" value="{{ $idproject }}"><span class="badge bg-label-primary me-1 status">Active</span></td>
                        <td>
                          <a href="javascript:void(0)" class="btn btn-icon btn-danger deleteRow">x</a>
                        </td>
                    </tr>
                @endforeach
              </tbody>
              

            </table>
            <div class="col-12 my-4" style="text-align: center;">
              <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>    
      </div>

    </div>
    <!--/ Striped Rows -->
    
    <!--/ Responsive Table -->
  </div>

  @push('custom-script')
  <script>
    $('thead').on('click', '.addRow', function(){
        var tr = "<tr>"+
                    "<td><select class='form-select changeIN' id='exampleFormControlSelect1' aria-label='Default select example' name='input_team[]'>"+
                        "<option selected disabled>Pilih Staff Lapangan</option>"+
                        "@foreach ($users as $user)"+
                        "<option data-email='{{ $user->email }}' data-jabatan='{{ $user->jabatan }}' value='{{ $user->id }}'>{{ $user->name }}</option>"+
                        "@endforeach"+
                        "</select>"+
                    "</td>"+
                    "<td><input value='' name='email[]' type='text' class='form-control email' id='defaultFormControlInput' placeholder='...' aria-describedby=defaultFormControlHelp readonly></td>"+
                    "<td><input value='' name='jabatan[]' type='text' class='form-control jabatan' id='defaultFormControlInput' placeholder='...' aria-describedby=defaultFormControlHelp readonly></td>"+
                    "<td><input type='hidden' name='id_project[]' value='{{ $idproject }}'><span class='badge bg-label-primary me-1 status' style='display:none;' >Active</span></td>"+
                    "<td>"+
                        "<a href='javascript:void' class='btn btn-icon btn-danger deleteRow'>x</a>"+
                    "</td>"+
                "</tr>"
        $('tbody').append(tr);
    });

    $('tbody').on('click', '.deleteRow', function(){
        $(this).parent().parent().remove();
    });


    $('tbody').on('change', '.changeIN', function(){

        var email = $("option:selected", this).attr('data-email');
        var jabatan = $("option:selected", this).attr('data-jabatan');
        $(this).closest('tr').find(".email").attr('value', email);
        $(this).closest('tr').find(".jabatan").attr('value', jabatan);
        $(this).closest('tr').find(".status").attr('style', "display:inline-block;");

    });

</script>
@endpush

@endsection