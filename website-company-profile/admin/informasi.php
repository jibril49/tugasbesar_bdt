<?php include("../inc/inc_header.php"); include("../inc/function.php"); ?>

<div class="d-flex justify-content-center mb-2">
    <h2>Informasi Mahasiswa</h2>
</div>


<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#informatika">Informatika</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#elektro">Elektro</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#tarbiyah">Tarbiyah</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#syariah">Syariah</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#akademik">Akademik</a>
    </li>
</ul>

<div class="tab-content">
    <div id="informatika" class="tab-pane fade show active">
        <?php tabelView($koneksi, "informatika"); ?>
    </div>
    <div id="elektro" class="tab-pane fade">
        <?php tabelView($koneksi, "elektro"); ?>
    </div>
    <div id="syariah" class="tab-pane fade">
        <?php tabelView($koneksi, "syariah"); ?>
    </div>    
    <div id="tarbiyah" class="tab-pane fade">
        <?php tabelView($koneksi, "tarbiyah"); ?>
    </div>
    <div id="akademik" class="tab-pane fade">
        <h4 class="mb-2 m-2">Jumlah Mahasiswa</h4>
        <ul>
            <li>
                <p>Jumlah Mahasiswa Prodi Informatika : <?php echo getJumlahMahasiswaProdi(4); ?></p>
            </li>            
            <li>
                <p>Jumlah Mahasiswa Prodi Elektro : <?php echo getJumlahMahasiswaProdi(3); ?></p>
            </li>            
            <li>
                <p>Jumlah Mahasiswa Prodi Syariah : <?php echo getJumlahMahasiswaProdi(1); ?></p>
            </li>            
            <li>
                <p>Jumlah Mahasiswa Prodi Tarbiyah : <?php echo getJumlahMahasiswaProdi(2); ?></p>
            </li>
            <li>
                <p>Jumlah Mahasiswa Fakultas Agama Islam : <?php echo getJumlahMahasiswaFakultas(1); ?></p>
            </li>            
            <li>
                <p>Jumlah Mahasiswa Fakultas Teknologi Industri : <?php echo getJumlahMahasiswaFakultas(2); ?></p>
            </li>
            <li>
                <p>Jumlah Mahasiswa Seluruh : <?php echo getJumlahMahasiswaSeluruh(); ?></p>
            </li>
        </ul>

        <h4 class="mb-2 m-2">Rata rata IPK</h4>
        <ul>
            <li>
                <p>Rata rata IPK Seluruh Mahasiswa : <?php echo getRataIPKSeluruhMahasiswa(); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Prodi Informatika : <?php echo getRataIPKProdi(4); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Prodi Elektro : <?php echo getRataIPKProdi(3); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Prodi Syariah : <?php echo getRataIPKProdi(1); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Prodi Tarbiyah : <?php echo getRataIPKProdi(2); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Fakultas Agama Islam : <?php echo getRataIPKFakultas(1); ?></p>
            </li>
            <li>
                <p>Rata rata IPK Fakultas Teknologi Industri : <?php echo getRataIPKFakultas(2); ?></p>
            </li>
        </ul>      
    </div>
</div>

<?php include("../inc/inc_footer.php") ?>