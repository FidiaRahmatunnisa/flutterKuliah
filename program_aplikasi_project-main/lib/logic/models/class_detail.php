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

$sql = "SELECT 
            k.id_kelas, 
            k.nama_kelas, 
            k.jam_kuliah, 
            d.nama AS nama_dosen, 
            m.kode_matkul, 
            m.nama_matkul 
        FROM 
            kelas k 
        JOIN 
            dosen d ON k.kode_matkul = d.kode_matkul 
        JOIN 
            matakuliah m ON k.kode_matkul = m.kode_matkul";

$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    echo "0 results";
}
$conn->close();

header('Content-Type: application/json');
echo json_encode($data);
