<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// Koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$database = "yoloiss_db";

$conn = new mysqli($servername, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query untuk mengambil data dosen dan matakuliah yang berelasi
$sql = "SELECT dosen.nip, dosen.nama, matakuliah.kode_matkul, matakuliah.nama_matkul, matakuliah.jam_kuliah 
        FROM dosen
        INNER JOIN matakuliah ON dosen.kode_matkul = matakuliah.kode_matkul";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Inisialisasi array untuk menyimpan hasil query
    $response = array();

    // Ambil setiap baris hasil query
    while ($row = $result->fetch_assoc()) {
        // Tambahkan data ke dalam array response
        $data = array(
            'nip' => $row['nip'],
            'nama' => $row['nama'],
            'kode_matkul' => $row['kode_matkul'],
            'nama_matkul' => $row['nama_matkul'],
            'jam_kuliah' => $row['jam_kuliah']
        );
        array_push($response, $data);
    }

    // Convert array response menjadi format JSON dan kirimkan
    echo json_encode($response);
} else {
    echo "0 results";
}

// Tutup koneksi
$conn->close();
