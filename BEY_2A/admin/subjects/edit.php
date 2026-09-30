<?php
session_start();
include "../../config/database.php";
// only admin and access this page.
if(!isset($_SESSION["role"]) || $_SESSION["role"] != "admin"){
    header("Location: ../../index.php");
    exit;
}
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$result = mysqli_query($conn, "SELECT * FROM subjects WHERE id=$id");
$subjects = mysqli_fetch_assoc($result);

if(!$subjects){
    die("subject not found");
}
$message = "";
if (isset($_POST["update"])){
    $subject_code = $_POST['subject_code'];
    $subject_name = $_POST['subject_name'];
    $units = $_POST['units'];
    // if password is blank , keep old password
    if($_POST['password'] == ""){
        $sql = "UPDATE users SET
        subject_code='$subject_code', 
        subject_name='$subject_name',
        units='$units'
          WHERE id=$id AND role='subjects'
          ";
    }
    else{
        $new_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $sql = "UPDATE users SET
        subject_code='$subject_code',   
        subject_name='$subject_name',
        units='$units',
        password='$new_password'
        WHERE id=$id AND role='subjects'
        ";
    }
    if(mysqli_query($conn, $sql)){
        header("Location: index.php");
        exit;
    }
    else{
        $message = "Could not update";
    }
}    
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Subject</title>
    <link href="../../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5" style="max-width:700px">
    <div class="card border-0 shadow-sm">
        <div class="card-body p-4">
            <h2>Edit Subject Account</h2>
             <?php if($message != ""){?>
                <div class = "alert alert-danger"><?php echo $message;?> </div>
                <?php }?>
                        <form method="POST">
                <div class="mb-3">
                    <label class="form-label">subject code</label>
                    <input type="text" name="student_no" class="form-control" value="<?php echo htmlspecialchars($subjects['subject_code']);?>"required>
                </div>
                <div class="mb-3">
                    <label class="form-label">subject name</label>
                    <input type="text" name="full_name" class="form-control" value="<?php echo htmlspecialchars($subjects['subject_name']);?>"required>
                </div>
                <div class="mb-3">
                    <label class="form-label">units</label>
                    <input type="text" name="username" class="form-control" value="<?php echo htmlspecialchars($subjects['units']);?>"required>
                </div>
                <div class="mb-3">
                    <label class="form-label">New Password <span class="text-muted">(leave blank to keep old password)</span></label>
                    <input type="password" name="password" class="form-control">
                </div>
                <button type="submit" name="update" class="btn btn-primary">Update Subject</button>
                <a href="index.php" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
