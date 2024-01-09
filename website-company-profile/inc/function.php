<?php

include("inc_koneksi.php");

function tabelView($koneksi, $prodi)
{
    $sql = "SELECT * FROM view_$prodi";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-hover">
        <thead class="table-dark">
            <tr>
                <th class="col-1">No.</th>
                <th>Nama</th>
                <th>IPK</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
                <tr>
                    <td><?php echo $nomor++ ?></td>
                    <td><?php echo $row['Nama'] ?></td>
                    <td><?php echo $row['Ip'] ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
<?php
}

function tabelRiwayatSemua($koneksi)
{
    $sql = "SELECT * FROM riwayat";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th class="col-1">No.</th>
                <th>Tabel</th>
                <th>Aksi</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
                <tr>
                    <td><?php echo $nomor++ ?></td>
                    <td><?php echo $row['tabel'] ?></td>
                    <td><?php echo $row['aksi'] ?></td>
                    <td><?php echo $row['tanggal'] ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
<?php
}

function tabelRiwayatIpk($koneksi)
{
    $sql = "SELECT * FROM perubahan_ipk";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th class="col-1">No.</th>
                <th>Nama</th>
                <th>ID Mahasiswa</th>
                <th>Prodi</th>
                <th>Ipk Lama</th>
                <th>Ipk Baru</th>
                <th>Waktu</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
                <tr>
                    <td><?php echo $nomor++ ?></td>
                    <td><?php echo $row['nama'] ?></td>
                    <td><?php echo $row['id_mhs'] ?></td>
                    <td><?php echo $row['nama_prodi'] ?></td>
                    <td><?php echo $row['ipk_old'] ?></td>
                    <td><?php echo $row['ipk_now'] ?></td>
                    <td><?php echo $row['tanggal'] ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
<?php
}

function tabelRiwayatMahasiswa($koneksi)
{
    $sql = "SELECT * FROM riwayat_mahasiswa";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th class="col-1">No.</th>
                <th>Nama Mahasiswa</th>
                <th>Aksi</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
                <tr>
                    <td><?php echo $nomor++ ?></td>
                    <td><?php echo $row['nama'] ?></td>
                    <td><?php echo $row['aksi'] ?></td>
                    <td><?php echo $row['tanggal'] ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
<?php
}

function getRataIPKProdi($prodiId) {
    global $koneksi;
    $sql = "SELECT RataNilaiIPKProdi($prodiId) AS RataIPKProdi";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return number_format($row["RataIPKProdi"], 2);
}

function getRataIPKFakultas($fakultasId) {
    global $koneksi;
    $sql = "SELECT RataNilaiIPKFakultas($fakultasId) AS RataIPKFakultas";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return number_format($row["RataIPKFakultas"], 2);
}

function getRataIPKSeluruhMahasiswa() {
    global $koneksi;
    $sql = "SELECT RataNilaiIPKSeluruhMahasiswa() AS RataIPKSeluruhMahasiswa";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return number_format($row["RataIPKSeluruhMahasiswa"], 2);
}

function getJumlahMahasiswaProdi($prodiId) {
    global $koneksi;
    $sql = "SELECT JumlahMahasiswaProdi($prodiId) AS JumlahMahasiswaProdi";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row["JumlahMahasiswaProdi"];
}

function getJumlahMahasiswaFakultas($fakultasId) {
    global $koneksi;
    $sql = "SELECT JumlahMahasiswaFakultas($fakultasId) AS JumlahMahasiswaFakultas";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row["JumlahMahasiswaFakultas"];
}

function getJumlahMahasiswaSeluruh() {
    global $koneksi;
    $sql = "SELECT JumlahMahasiswaSeluruh() AS JumlahMahasiswaSeluruh";
    $result = mysqli_query($koneksi, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row["JumlahMahasiswaSeluruh"];
}

function hapusData($koneksi)
{
    $op = (isset($_GET['op'])) ? $_GET['op'] : " ";
    $sukses = "";

    if ($op == 'delete') {
        $id = mysqli_real_escape_string($koneksi, $_GET['id']);
        $sql1 = "DELETE FROM mahasiswa WHERE id_mhs = '$id'";
        $q1 = mysqli_query($koneksi, $sql1);
        if ($q1) {
            $sukses = "Berhasil hapus data";
        }
    }

    return $sukses;
}

function readTabelMahasiswa($koneksi, $katakunci, $page, $per_halaman)
{
    $sqltambahan = "";
    if ($katakunci != '') {
        $array_katakunci = explode(" ", $katakunci);
        for ($x = 0; $x < count($array_katakunci); $x++) {
            $sqlcari[] = "(mahasiswa.nama like '%" . $array_katakunci[$x] . "%' or prodi.nama like '%" . $array_katakunci[$x] . "%')";
        }
        $sqltambahan = " WHERE " . implode(" OR ", $sqlcari);
    }
    $sql = "SELECT mahasiswa.id_mhs, mahasiswa.nama, mahasiswa.ip, prodi.nama AS nama_prodi 
            FROM mahasiswa 
            INNER JOIN prodi ON mahasiswa.id_prodi = prodi.id_prodi 
            $sqltambahan";
    
    $mulai = ($page > 1) ? ($page * $per_halaman) - $per_halaman : 0;
    $sql = $sql . " ORDER BY mahasiswa.id_mhs DESC LIMIT $mulai, $per_halaman";

    $query = mysqli_query($koneksi, $sql);

    $nomor = $mulai + 1;

    $sukses = hapusData($koneksi);
    if ($sukses) {
        ?>
        <div class="alert alert-primary" role="alert">
            <?php echo $sukses; ?>
        </div>
        <?php
        $query = mysqli_query($koneksi, $sql);
    }
    ?>
    
    <table class="table table-hover">
        <thead class="table-light">
            <tr>
                <th class="col-1">No.</th>
                <th>Nama</th>
                <th>IPK</th>
                <th>Prodi</th>
                <th class="col-2">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
                <tr>
                    <td><?php echo $nomor++ ?></td>
                    <td><?php echo $row['nama'] ?></td>
                    <td><?php echo $row['ip'] ?></td>
                    <td><?php echo $row['nama_prodi'] ?></td>
                    <td>
                        <a class="m-1" href="halaman_edit.php?id=<?php echo $row['id_mhs']?>">
                            <span class="badge text-bg-warning"> Edit </span>
                        </a>
                        <a class="m-1" href="halaman.php?op=delete&id=<?php echo $row['id_mhs'] ?>"
                            onclick="return confirm('apakah yakin mau hapus data?')">
                            <span class="badge text-bg-danger"> Delete </span>
                        </a>
                    </td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
    <?php
}

function getDataById($koneksi, $id)
{
    $id = mysqli_real_escape_string($koneksi, $id);
    $sql = "SELECT * FROM mahasiswa WHERE id_mhs = '$id'";
    $result = mysqli_query($koneksi, $sql);
    return mysqli_fetch_array($result);
}

function insertOrUpdateMahasiswa($koneksi, $id, $nama, $ip, $id_prodi)
{
    $nama = mysqli_real_escape_string($koneksi, $nama);
    $ip = mysqli_real_escape_string($koneksi, $ip);
    $id_prodi = mysqli_real_escape_string($koneksi, $id_prodi);

    if ($id != "") {
        $sql = "UPDATE mahasiswa SET Nama='$nama', Ip='$ip', id_prodi='$id_prodi' WHERE id_mhs='$id'";
    } else {
        $sql = "INSERT INTO mahasiswa(Nama, Ip, id_prodi) VALUES ('$nama','$ip','$id_prodi')";
    }

    $q = mysqli_query($koneksi, $sql);

    if (!$q) {
        throw new Exception(mysqli_error($koneksi));
    }

    return ($id != "") ? "Sukses mengubah data" : "Sukses memasukkan data";
}

$nama = "";
$ip = "";
$id_prodi = "";
$error = "";
$sukses = "";

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $data = getDataById($koneksi, $id);

    if (!$data) {
        $error = "Data tidak ditemukan";
    } else {
        $nama = $data['Nama'];
        $ip = $data['Ip'];
        $id_prodi = $data['id_prodi'];
    }
}

if (isset($_POST['simpan'])) {
    $id = (isset($_POST['id'])) ? $_POST['id'] : "";
    $nama = $_POST['nama'];
    $ip = $_POST['ip'];
    $id_prodi = $_POST['id_prodi'];

    if ($nama == '' or $ip == '' or $id_prodi == '') {
        $error = "Silahkan masukkan semua data, yakni Nama, IPK, dan ID Prodi.";
    }

    if (empty($error)) {
        try {
            $sukses = insertOrUpdateMahasiswa($koneksi, $id, $nama, $ip, $id_prodi);
        } catch (Exception $e) {
            $error = "Error: " . $e->getMessage();
        }
    }
}

?>