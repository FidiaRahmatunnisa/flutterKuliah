<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Koneksi ke database
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'yoloiss_db';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Koneksi Gagal: " . $conn->connect_error);
}

// Query untuk mengambil data dari tabel kelas, ruangan, dan matakuliah yang berelasi
$sql = "SELECT kelas.id_kelas, kelas.nama_kelas, ruangan.no_ruangan, ruangan.nama_ruangan, ruangan.status 
        FROM kelas
        INNER JOIN matakuliah ON kelas.kode_matkul = matakuliah.kode_matkul
        INNER JOIN ruangan ON ruangan.kode_matkul = matakuliah.kode_matkul";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Mengubah hasil query menjadi array asosiatif
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    // Mengembalikan data dalam format JSON
    echo json_encode($data);
} else {
    echo json_encode(array('message' => '0 results'));
}
$conn->close();
