# Tugas Akhir Basis Data Terapan

## Pembuatan Halaman Admin Nilai IPK Unissula

1. buatlah kelompok dengan jumlah maksimum 5 orang
2. Buatlah aplikasi Web (PHP) yang terhubung ke database MySQL. di dalam aplikasi harus ada
- mekanisme penambahan data, ubah data, lihat data dan hapus data (crud)
- harus ada pemanggilan stored procedure, stored function, view dan trigger melalui aplikasi tersebut
- tema aplikasi bebas
3. Upload project yang sudah di buat ke repositori Github
- Repositori Harus di beri judul, deskripsi anggota kelompok, deskripsi project
- Tambahkan deskripsi link youtube tutorial pada repositori (lihat point. 4)
- Tambahkan Keterangan cara menggunakan aplikasi pada halaman repositori
4. buatlah video tutorial coding pembuatan aplikasi tersebut dengan durasi video maksimum 15 menit
5. link github dan video youtube harus di kumpulkan via aplikasi sinau pada saat uas (tidak ada uas tertulis)
6. bagi yang tidak mengumpulkan atau terlambat mengumpulkan dengan berbagai alasan, nilai uas dihitung nol dan tidak lulus mata kuliah 

 - "https://youtu.be/ne-VM4zVzs8?si=yrdW54difJ4cD07e" Membuat Website Dengan PHP dan MySQL.
 - "https://getbootstrap.com/docs/5.0/getting-started/introduction/" Bootstrap 5.
  
aplikasi yang di butuhkan
1. xampp
2. Mysql
3. Visual studio code
4. code runner (.PHP, .JS, .CSS)

# Fungsi Database

- CRUD

- Trigger
  - before update ipk
  - tabel insert update delete diriwayat (log) [id, tabel, aksi, tanggal(now())
  - tabel perubahan ipk before update [id, nama, idmhs, id_prodi as nama_prodi, ipk_old, ipk_now, waktu(now())]
  - tabel perubahan mahasiswa [id, nama, aksi, tanggal]

- Stored Function
  - rata-rata nilai ipk tiap prodi/ tiap fakultas/ seluruh mahasiswa
  - jumlah mahasiswa tiap prodi

- Stored Procedure
  - perubahan tabel mahasiswa(in nama_mhs, in aksi)

- View
  - tabel mahasiswa tiap prodi

-
note: simpan website-company-profile folder pada htcdocs folder di direktori "C:\xampp\htdocs" dan buka folder code compiler yang anda gunakan di website-company-profile yang telah anda download
