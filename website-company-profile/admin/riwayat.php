<?php include("../inc/inc_header.php") ?>

<h1>Alumni</h1>

<table class="table table-striped">
    <thead>
        <tr>
            <th class="col-1">No.</th>
            <th>Nama</th>
            <th>Prodi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $sqltambahan = "";
        $per_halaman = 10;
        $sql1 = "SELECT alumni.id_alumni, alumni.nama, prodi.Nama AS nama_prodi FROM alumni JOIN prodi ON alumni.id_prodi = prodi.id_prodi $sqltambahan";
        $page = isset($_GET['page'])?(int)$_GET['page']:1;
        $mulai = ($page > 1) ? ($page * $per_halaman) - $per_halaman : 0;
        $q1 = mysqli_query($koneksi,$sql1);
        $total = mysqli_num_rows($q1);
        $pages = ceil($total / $per_halaman);
        $nomor = $mulai + 1;
        $sql1 = $sql1." ORDER BY alumni.id_alumni DESC LIMIT $mulai, $per_halaman";

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
                        <?php echo $r1['nama_prodi'] ?>
                    </td>
                </tr>
            <?php
        }
        ?>

    </tbody>
</table>