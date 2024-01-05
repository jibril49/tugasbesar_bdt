<?php
function tabelView($koneksi, $prodi) {
    $sql = "SELECT * FROM view_$prodi";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-striped">
        <thead>
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
?>
<?php
function tabelRiwayatSemua($koneksi)
{
    $sql = "SELECT * FROM riwayat";
    $query = mysqli_query($koneksi, $sql);
    $nomor = 1;
    ?>
    <table class="table table-striped">
        <thead>
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
    <table class="table table-striped">
        <thead>
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
    <table class="table table-striped">
        <thead>
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
?>

<?php
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
?>