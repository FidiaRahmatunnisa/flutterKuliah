<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$servername = "localhost"; // Ganti dengan nama server MySQL Anda
$username = "root"; // Ganti dengan username MySQL Anda
$password = ""; // Ganti dengan password MySQL Anda
$dbname = "yoloiss_db"; // Ganti dengan nama database Anda

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array(); // Inisialisasi array respons

// Query untuk mengambil data matakuliah dari tabel matakuliah
$sql = "SELECT nama_matkul, jam_kuliah FROM matakuliah";
$result = $conn->query($sql);

if ($result) {
    if ($result->num_rows > 0) {
        $response['status'] = 'success';
        $response['data'] = array();

        // Ambil data matakuliah dan jam_kuliah dari hasil query
        while ($row = $result->fetch_assoc()) {
            $data = array(
                'nama_matkul' => $row['nama_matkul'],
                'jam_kuliah' => $row['jam_kuliah']
            );
            array_push($response['data'], $data);
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = 'No data found';
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Query failed';
}

// Mengirim respon dalam format JSON
echo json_encode($response);

$conn->close();
