<?php include("../inc/inc_header.php") ?>

<?php include("../inc/function.php"); 
$katakunci = isset($_GET['katakunci']) ? $_GET['katakunci'] : '';
?>

<div class="d-flex justify-content-center mb-2">
    <h2>Halaman Utama</h2>
</div>
<div class="d-flex justify-content-center mb-2">
    <div class="col-auto m-1">
        <form method="get">
            <div class="row g-2">
                <div class="col-auto">
                    <input type="text" class="form-control" placeholder="Masukkan Kata Kunci" name="katakunci"
                        value="<?php echo $katakunci ?>" />
                </div>
                <div class="col-auto">
                    <input type="submit" name="cari" value="Cari Mahasiswa" class="btn btn-secondary" />
                </div>
            </div>
        </form>
    </div>
    <div class="col-auto m-1">
        <a href="Halaman_input.php" class="btn btn-primary col">
            Tambah Mahasiswa
        </a>
    </div>
</div>

<?php
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$per_halaman = 10;
readTabelMahasiswa($koneksi, $katakunci, $page, $per_halaman);
?>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <?php
        $pages = (int)ceil(getJumlahMahasiswaSeluruh($koneksi, $katakunci) / $per_halaman);
        $cari = (isset($_GET['cari'])) ? $_GET['cari'] : "";
        for ($i = 1; $i <= $pages; $i++) {
            ?>
            <li class="page-item">
                <a class="page-link" href="halaman.php?katakunci=<?php echo $katakunci?>&cari=<?php echo $cari?>&page=<?php echo $i ?>"><?php echo $i ?></a>
            </li>
            <?php
        }
        ?>
    </ul>
</nav>

<?php include("../inc/inc_footer.php") ?>