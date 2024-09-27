<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
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

// Query untuk mengambil data dari tabel kelas dan tabel mahasiswa yang berelasi melalui id_kelas
// Hanya mengambil data dengan nama_kelas "TEKOM 2A"
$sql = "SELECT 
            kelas.id_kelas, 
            kelas.nama_kelas, 
            mahasiswa.nim, 
            mahasiswa.nama, 
            mahasiswa.foto_mahasiswa 
        FROM kelas 
        INNER JOIN mahasiswa ON kelas.id_kelas = mahasiswa.id_kelas
        WHERE kelas.nama_kelas = 'TEKOM 2A'";

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
    echo json_encode(array("message" => "0 results"));
}

$conn->close();
