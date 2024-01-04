<?php
function getMahasiswaData($koneksi, $id) {
    $nama = "";
    $ip = "";
    $id_prodi = "";
    $error = "";

    if ($id != "") {
        $sql1 = "SELECT * FROM mahasiswa WHERE id_mhs = '$id'";
        $sq1 = mysqli_query($koneksi, $sql1);
        $r1 = mysqli_fetch_array($sq1);
        $nama = $r1['Nama'];
        $ip = $r1['Ip'];
        $id_prodi = $r1['id_prodi'];

        if ($nama == '') {
            $error = "Data tidak ditemukan";
        }
    }

    return [
        'nama' => $nama,
        'ip' => $ip,
        'id_prodi' => $id_prodi,
        'error' => $error
    ];
}

function saveMahasiswaData($koneksi, $post) {
    $nama = $post['nama'];
    $ip = $post['ip'];
    $id_prodi = $post['id_prodi'];
    $error = "";
    $sukses = "";

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

    return [
        'error' => $error,
        'sukses' => $sukses
    ];
}
?>
