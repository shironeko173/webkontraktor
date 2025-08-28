<table border="1">
    <tbody>
        <td colspan="4" style="text-align: center"><b>DATA ABSENSI KARYAWAN : {{ $user->name }}</b></td>
    </tbody>
  </table>
  <table border="1">
    <thead>
      <tr >
        <th><b>Tanggal</b></th>
        <th><b>Jam Masuk</b></th>
        <th><b>Jam Keluar</b></th>
        <th><b>Keterangan</b></th>
      </tr>
    </thead>
    <tbody>
      @foreach ($absensi as $item)
        <tr>
          <td>{{ $item->date }}</td>
          <td>{{ $item->time_in }}</td>
          <td>{{ $item->time_out }}</td>
          <td>{{ $item->note }}</td>
        </tr>
      @endforeach
    </tbody>
    
  </table>