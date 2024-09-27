<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// Koneksi ke database
$servername = "localhost"; // Ganti dengan nama server database Anda jika berbeda
$username = "root"; // Ganti dengan username database Anda
$password = ""; // Ganti dengan password database Anda
$database = "yoloiss_db"; // Ganti dengan nama database Anda

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $database);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query untuk mengambil data dari tabel matakuliah, ruangan, dan dosen
$sql = "SELECT matakuliah.kode_matkul, matakuliah.jam_kuliah, ruangan.no_ruangan, dosen.nama
        FROM matakuliah
        INNER JOIN ruangan ON matakuliah.kode_matkul = ruangan.kode_matkul
        INNER JOIN dosen ON matakuliah.kode_matkul = dosen.kode_matkul";

$result = $conn->query($sql);

// Menyimpan hasil query ke dalam array
$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Mengirimkan data dalam format JSON
header('Content-Type: application/json');
echo json_encode($data);

// Menutup koneksi database
$conn->close();
