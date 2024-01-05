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