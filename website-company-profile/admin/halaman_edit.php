
<?php include("../inc/inc_header.php"); include("../inc/function.php"); ?>
<h2>Halaman Merubah Data Mahasiswa</h2>
<?php
if ($error) {
    ?>
    <div class="alert alert-danger" role="alert">
        <?php echo $error ?>
    </div>
    <?php
}
?>
<?php
if ($sukses) {
    ?>
    <div class="alert alert-primary" role="alert">
        <?php echo $sukses ?>
    </div>
    <?php
}
?>
<form action="" method="post">
    <input type="hidden" name="id" value="<?php echo $id ?>">
    <div class="mb-3 row">
        <label for="nama" class="col-sm-2 form-label">Nama</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="nama" value="<?php echo $nama ?>" name="nama">
        </div>
    </div>
    <div class="mb-3 row">
        <label for="ip" class="col-sm-2 form-label">IPK</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="ip" value="<?php echo $ip ?>" name="ip">
        </div>
    </div>
    <div class="mb-3 row">
        <label for="id_prodi" class="col-sm-2 form-label">ID Prodi</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="id_prodi" value="<?php echo $id_prodi ?>" name="id_prodi">
        </div>
    </div>
    <div class="container text-center">
        <div class="row row-cols-auto">
            <div class="col-2"></div>
            <div class="col">
                <input type="submit" name="simpan" value="Simpan Data" class="btn btn-primary"/>
            </div>
            <div class="col">
                <input type="reset" value="Reset" class="btn btn-secondary"/>
            </div>
            <div class="col">
                <a href="halaman.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
</form>

<?php include("../inc/inc_footer.php") ?>
