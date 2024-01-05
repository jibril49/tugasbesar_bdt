<?php include("../inc/inc_header.php") ?>
<?php
$sukses = "";
$katakunci = (isset($_GET['katakunci'])) ? $_GET['katakunci'] : "";
if (isset($_GET['op'])) {
    $op = $_GET['op'];
} else {
    $op = " ";
}
if ($op == 'delete') {
    $id = $_GET['id'];
    $sql1 = "DELETE FROM mahasiswa WHERE id_mhs = '$id'";
    $q1 = mysqli_query($koneksi, $sql1);
    if ($q1) {
        $sukses = "Berhasil hapus data";
    }
}
?>
<h2>Halaman Utama</h2>

<div class="row g-3">
    <div class="col-auto">
        <form method="get">
            <div class="row g-3">
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
    <div class="col-auto">
        <a href="Halaman_input.php" class="btn btn-primary">
            Tambah Mahasiswa
        </a>
        <?php
        if ($sukses) {
            ?>
            <div class="alert alert-primary" role="alert">
                <?php echo $sukses?>
            </div>
            <?php
        }
        ?>
    </div>
</div>

<table class="table table-striped">
    <thead>
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
        $sqltambahan = "";
        $per_halaman = 10;
        if ($katakunci != '') {
            $array_katakunci = explode(" ", $katakunci);
            for ($x = 0; $x < count($array_katakunci); $x++) {
                $sqlcari[] = "(mahasiswa.nama like '%" . $array_katakunci[$x] . "%' or prodi.nama like '%" . $array_katakunci[$x] . "%')";
            }
            $sqltambahan = " WHERE " . implode(" OR ", $sqlcari);
        }
        $sql1 = "SELECT mahasiswa.id_mhs, mahasiswa.nama, mahasiswa.ip, prodi.nama AS nama_prodi FROM mahasiswa INNER JOIN prodi ON mahasiswa.id_prodi = prodi.id_prodi $sqltambahan";
        $page = isset($_GET['page'])?(int)$_GET['page']:1;
        $mulai = ($page > 1) ? ($page * $per_halaman) - $per_halaman : 0;
        $q1 = mysqli_query($koneksi,$sql1);
        $total = mysqli_num_rows($q1);
        $pages = ceil($total / $per_halaman);
        $nomor = $mulai + 1;
        $sql1 = $sql1." ORDER BY mahasiswa.id_mhs DESC LIMIT $mulai, $per_halaman";

        $q1 = mysqli_query($koneksi, $sql1);
        
        while ($r1 = mysqli_fetch_array($q1)) {
            ?>
            <tr>
                <td>
                    <?php echo $nomor++ ?>
                </td>
                <td>
                    <?php echo $r1['nama'] ?>
                </td>
                <td>
                    <?php echo $r1['ip'] ?>
                </td>
                <td>
                    <?php echo $r1['nama_prodi'] ?>
                </td>
                <td>
                    <a href="halaman_input.php?id=<?php echo $r1['id_mhs']?>">
                    <span class="badge text-bg-warning">Edit</span>
                    </a>

                    <a href="halaman.php?op=delete&id=<?php echo $r1['id_mhs'] ?>"
                        onclick="return confirm('apakah yakin mau hapus data?')">
                        <span class="badge text-bg-danger">Delete</span>
                </td>
            </tr>
            <?php
        }
        ?>

    </tbody>
</table>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <?php
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
