<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "yoloiss_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to fetch class schedule
$sql = "SELECT id_kelas, nama_kelas, jam_kuliah FROM kelas"; // Updated query to include id_kelas
$result = $conn->query($sql);

$kelas = array();

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        $kelas[] = array(
            'id_kelas' => $row['id_kelas'], // Include id_kelas
            'nama_kelas' => $row['nama_kelas'],
            'jam_kuliah' => $row['jam_kuliah']
        );
    }
    echo json_encode($kelas);
} else {
    echo json_encode(array("message" => "No data found"));
}

$conn->close();
