@extends('backend.component.main')
@section ('breadcrumb')
  <nav aria-label="breadcrumb" class="mt-4">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item">Website</li>
      <li class="breadcrumb-item active">
        <a href="/monitoring">Monitoring Aktivitas</a>
      </li>
    </ol>
  </nav>
@endsection

@section('content')
  <div class="container-xxl flex-grow-1 container-p-y">

      <!-- Bordered Table -->
    <div class="card">
      <h3 class="card-header" style="text-align: center">Monitoring Aktivitas</h3>
      <div class="card-body">
        <div class="table-responsive text-nowrap" id="showlog">
         
        </div>
      </div>
    </div>
    <!--/ Bordered Table -->

    <!--/ Responsive Table -->
  </div>

  @push('custom-script')
    <script>
      $(document).ready(function(){
        show();
        setInterval(() => {
          show()
        }, 3000);

        // function show(){
        //   $.ajax({
        //     type: "GET",
        //     url: "/showlog",
        //     dataType: "json",
        //     success: function(response){
        //       // console.log(response.data);
        //       $.each(response.data, function(key, item){
        //         $('tbody').append(
        //           '<tr>\
        //               <td>'+item.from_table+'</td>\
        //               <td>'+item.date_time+'</td>\
        //               <td>'+item.user+'</td>\
        //               <td>'+item.aktivitas+'</td>\
        //           </tr>'
        //         );
        //       });
        //     }
        //   });
        // }

        
      });

      function show(){
          $.get("{{ url('showlog') }}", {}, function(data, status){
              $("#showlog").html(data);
          });
      }
    </script>
  @endpush
@endsection