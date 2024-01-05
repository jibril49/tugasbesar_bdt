<?php include("../inc/inc_header.php"); include("../inc/function.php"); ?>

<div class="d-flex justify-content-center mb-2">
    <h2>Riwayat</h2>
</div>


<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#riwayat">Riwayat Tabel</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#riwayatmahasiswa">Riwayat Mahasiswa</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#riwayatipk">Riwayat IPK</a>
    </li>    

</ul>

<div class="tab-content">
    <div id="riwayat" class="tab-pane fade show active">
        <?php tabelRiwayatSemua($koneksi); ?>
    </div>
    <div id="riwayatmahasiswa" class="tab-pane fade">
        <?php tabelRiwayatMahasiswa($koneksi); ?>
    </div>
    <div id="riwayatipk" class="tab-pane fade">
        <?php tabelRiwayatIpk($koneksi); ?>
    </div>    
</div>

<?php include("../inc/inc_footer.php") ?>