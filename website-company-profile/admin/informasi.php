<?php include("../inc/inc_header.php"); include("../inc/function.php"); ?>

<div class="d-flex justify-content-center">
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
</ul>

<div class="tab-content">
    <div id="informatika" class="tab-pane fade show active">
        <?php tabelView($koneksi, "informatika"); ?>
    </div>
    <div id="elektro" class="tab-pane fade">
        <?php tabelView($koneksi, "elektro"); ?>
    </div>
    <div id="tarbiyah" class="tab-pane fade">
        <?php tabelView($koneksi, "tarbiyah"); ?>
    </div>
    <div id="syariah" class="tab-pane fade">
        <?php tabelView($koneksi, "syariah"); ?>
    </div>
</div>