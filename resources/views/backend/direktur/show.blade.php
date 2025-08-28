<table class="table table-dark" >
    <thead>
      <tr style="text-align: center">
        <th >Waktu</th>
        <th>From Table</th>
        <th>User</th>
        <th style="width: 30%;">Aktivitas</th>
      </tr>
    </thead>
      <tbody>
        @foreach ($data as $item)
            <tr>
                <td style="text-align: center">{{ $item->date_time }}</td>
                <td style="text-align: center">{{ $item->from_table }}</td>
                <td style="text-align: center"> {{ $item->user }}</td>
                <td>{{ $item->aktivitas }}</td>
            </tr>
        @endforeach
        
      </tbody>
  </table>