<?php
include 'db_connection.php';

// Example: Fetch data
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $sql = "SELECT * FROM your_table";
    $result = $conn->query($sql);
    $data = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        echo "0 results";
    }
}

// Example: Insert data
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    $sql = "INSERT INTO your_table (column1, column2) VALUES ('" . $data['value1'] . "', '" . $data['value2'] . "')";
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
