<?php include("inc_header.php") ?>
<?php
$nama = "";
$ip = "";
$id_prodi = "";
$error = "";
$sukses = "";

if(isset($_GET['id'])){
    $id = $_GET['id'];
}else{
    $id = "";
}

if($id !=""){
    $sql1 = "SELECT * FROM mahasiswa WHERE id_mhs = '$id'";
    $sq1 = mysqli_query($koneksi,$sql1);
    $r1 = mysqli_fetch_array($sq1);
    $nama = $r1['Nama'];
    $ip = $r1['Ip'];
    $id_prodi = $r1['id_prodi'];

    if($nama == ''){
        $error = "Data tidak ditemukan";
    }
}

if (isset($_POST['simpan'])) {
    $nama = $_POST['nama'];
    $ip = $_POST['ip'];
    $id_prodi = $_POST['id_prodi'];

    if ($nama == '' or $ip == '' or $id_prodi == '') {
        $error = "Silahkan masukkan semua data yakni adalah data nama, IP, dan ID Prodi.";
    }
    if (empty($error)) {
        try {
            $sql1 = "INSERT INTO mahasiswa(Nama, Ip, id_prodi) VALUES ('$nama','$ip','$id_prodi')";
            $q1 = mysqli_query($koneksi, $sql1);

            if (!$q1) {
                throw new Exception(mysqli_error($koneksi));
            }

            $sukses = "Sukses memasukkan data";
        } catch (Exception $e) {
            $error = "Error: " . $e->getMessage();
        }
    }
}
?>
<h1>Halaman Input Data Mahasiswa</h1>
<div class="mb-3 row">
    <a href="halaman.php"><< Kembali ke halaman utama</a>
</div>
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
    <div class="mb-3 row">
        <label for="nama" class="col-sm-2 form-label">Nama</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="nama" value="<?php echo $nama ?>" name="nama">
        </div>
    </div>
    <div class="mb-3 row">
        <label for="ip" class="col-sm-2 form-label">IP</label>
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
    <div class="mb-3 row">
        <div class="col-sm-2"></div>
        <div class="col-sm-10">
            <input type="submit" name="simpan" value="Simpan Data" class="btn btn-primary"/>
        </div>
    </div>
</form>
<?php include("inc_footer.php") ?>