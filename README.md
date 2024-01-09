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
 - "https://youtu.be/GkFVrKqhb9k"
  
aplikasi yang di butuhkan
1. xampp
2. Mysql
3. code compiler (contoh : VS_code)
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

# Deskripsi
- Penilaian IPK (Indeks Prestasi Kumulatif) adalah suatu sistem evaluasi yang digunakan dalam konteks pendidikan tinggi untuk mengukur kinerja akademis seorang mahasiswa selama masa studinya. IPK memberikan gambaran tentang pencapaian akademis seorang mahasiswa dengan merangkum nilai-nilai yang diperolehnya selama satu periode atau seluruh masa studi. Berikut adalah beberapa poin dalam mendeskripsikan penilaian IPK:

1. **Penghitungan Nilai:**
   - IPK dihitung berdasarkan nilai-nilai yang diperoleh mahasiswa dalam setiap mata kuliah yang diambil selama satu semester atau lebih. Setiap mata kuliah memiliki bobot kredit tertentu, dan nilai akhir dari setiap mata kuliah dijumlahkan dan dirata-ratakan untuk mendapatkan IPK.

2. **Bobot Kredit:**
   - Setiap mata kuliah memiliki bobot kredit yang mencerminkan tingkat kesulitan dan lamanya mata kuliah tersebut. IPK dihitung dengan mempertimbangkan bobot kredit, sehingga mata kuliah dengan bobot kredit lebih tinggi memiliki pengaruh yang lebih besar terhadap IPK.

3. **Skala Penilaian:**
   - Penilaian IPK umumnya menggunakan skala penilaian yang telah ditentukan, seperti A, B, C, D, dan F. Setiap nilai memiliki poin tertentu yang digunakan dalam perhitungan IPK. Sebagai contoh, A mungkin memiliki nilai poin lebih tinggi daripada B.

4. **Prestasi Akademis:**
   - IPK mencerminkan prestasi akademis seorang mahasiswa selama masa studinya. Semakin tinggi IPK, semakin baik prestasi akademisnya. IPK dapat menjadi indikator penting dalam menilai kemampuan mahasiswa dalam menyelesaikan tugas-tugas akademis dengan baik.

5. **Peran dalam Kelayakan Kelulusan:**
   - IPK sering menjadi faktor penentu dalam menilai apakah seorang mahasiswa memenuhi syarat untuk lulus atau mungkin untuk mendapatkan gelar tertentu. Beberapa program studi atau institusi pendidikan memiliki persyaratan IPK minimum yang harus dipenuhi untuk mencapai kelulusan.

6. **Pemantauan Perkembangan Akademis:**
   - IPK juga digunakan sebagai alat pemantauan perkembangan akademis seorang mahasiswa dari waktu ke waktu. Pemantauan ini dapat membantu mahasiswa dan dosen pembimbing untuk mengidentifikasi area yang perlu ditingkatkan atau perubahan yang perlu dilakukan.

- Dengan merinci aspek-aspek di atas, deskripsi penilaian IPK dapat memberikan gambaran menyeluruh tentang bagaimana prestasi akademis seorang mahasiswa dievaluasi dalam konteks pendidikan tinggi.

- kontributor
  - habib baihaqi arrozaq
  - Marwan hadid
  - jibril amjad taqiudin
  - Moh Rian Hadi KH

# Cara menggunakan Repositori
- Download
  - install aplikasi xampp, mysql, dan code compiler dengan benar dan mengguanakan port yang benar, untuk lebih mudah gunakanlah port 3306.
  - install aplikasi code runner pada text compiler yang anda miliki untuk menjalankan file .php, .js, dll.
  - download file .zip yang sudah di sediakan pada repositori yaitu website-company-profile yang ada pada tombol hijau.
  - buka .zip dengan cara klik kanan pada file yang sudah di download lalu extract file.(download lah aplikasi .zip opener untuk membuka file)
  - copy file website-company-profile lalu paste pada "C:\xampp\htdocs" untuk menyambung koneksi antara xampp dan mysql.
  - atau gunakan github desktop untul meng clone download repository "https://youtu.be/PoZNIbs_wx8?si=GbUrhl8TZHj-5613". menggunakan git dan git bash.

- Menjalankan Program
  - run program xampp control panel.
  - Buka code compiler yang sudah di download lalu klik file > open folder "C:\xampp\htdocs\website-company-profile".
  - Buka open editor lalu cek koneksi melalui inc_koneksi.php, dan jalankan program, jika gagal akan menampilkan "Gagal Koneksi"
  - Buka "http://localhost/website-company-profile/admin/halaman.php" pada website yang anda miliki.
  - Buka "http://localhost/phpmyadmin/index.php" untuk menampilkan database, localhost akan me-direct web ke xampp unissula_uas.
  - buka database "unissula_uas" pada phpMyAdmin disana akan menampilkan database yang akan diperlukan.

note: simpan website-company-profile folder pada htcdocs folder di direktori "C:\xampp\htdocs" dan buka folder code compiler yang anda gunakan di website-company-profile yang telah anda download.
