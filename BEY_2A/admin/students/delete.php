<?php
session_start();
include "../../config/database.php";
// only admin and access this page.
if (!isset($_SESSION["role"]) || $_SESSION["role"] != "admin" ){
header("Location: ../../index.php");
exit;
}
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
// delete sql
mysqli_query($conn, "DELETE FROM users WHERE id=$id and role = 'student'");
header('location: index.php');
exit;
?>