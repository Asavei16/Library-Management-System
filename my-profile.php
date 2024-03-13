<?php
session_start();
include('includes/config.php');
error_reporting(0);
if (strlen($_SESSION['login']) == 0) {
    header('location: index.php');
} else {
    // Modificare cont
    if (isset($_POST['update'])) {
        $sid = $_SESSION['stdid'];
        $fname = $_POST['fullname'];
        $mobileno = $_POST['mobileno'];

        $sql = "UPDATE tblstudents set FullName=:fname, MobileNumber=:mobileno where StudentId=:sid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':sid', $sid, PDO::PARAM_STR);
        $query->bindParam(':fname', $fname, PDO::PARAM_STR);
        $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
        $query->execute();

        echo '<script> alert("Profilul a fost actualizat")</script>';
    }

    //Modificare parola
    if (isset($_POST['change'])) {
        $password = md5($_POST['password']);
        $newpassword = md5($_POST['newpassword']);
        $email = $_SESSION['login'];
        $sql = "SELECT Password FROM tblstudents WHERE EmailId=:email and Password=:password";
        $query = $dbh->prepare($sql);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->bindParam(':password', $password, PDO::PARAM_STR);
        $query->execute();
        $results = $query->fetchAll(PDO::FETCH_OBJ);
        if ($query->rowCount() > 0) {
            $con = "update tblstudents set Password=:newpassword where EmailId=:email";
            $chngpwd1 = $dbh->prepare($con);
            $chngpwd1->bindParam(':email', $email, PDO::PARAM_STR);
            $chngpwd1->bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
            $chngpwd1->execute();
            $msg = "Parola a fost schimbata cu succes!";
        } else {
            $error = "Parola curenta este gresita";
        }
    }

?>

    <style>
        <?php include 'assets/css/my-profile.css'; ?>
    </style>

    <script>
        function valid() {
            if (document.chngpwd.newpassword.value != document.chngpwd.confirmpassword.value) {
                alert("Parola Noua si Confirmare Parola nu coincid !!");
                document.chngpwd.confirmpassword.focus();
                return false;
            }
            return true;
        }
    </script>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Biblioteca Autonom</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>

    <body>
        <?php include('includes/header.php'); ?>

        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Profilul meu</h4>

                    </div>

                </div>
                <div class="row">

                    <div class="col-md-9 col-md-offset-1">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                Profilul meu
                            </div>
                            <div class="panel-body">
                                <form name="signup" method="post">
                                    <?php
                                    $sid = $_SESSION['stdid'];
                                    $sql = "SELECT StudentId,FullName,EmailId,MobileNumber,RegDate,UpdationDate,Status from  tblstudents  where StudentId=:sid ";
                                    $query = $dbh->prepare($sql);
                                    $query->bindParam(':sid', $sid, PDO::PARAM_STR);
                                    $query->execute();
                                    $results = $query->fetchAll(PDO::FETCH_OBJ);
                                    $cnt = 1;
                                    if ($query->rowCount() > 0) {
                                        foreach ($results as $result) {               ?>

                                            <div class="form-group">
                                                <label>Student ID : </label>
                                                <?php echo htmlentities($result->StudentId); ?>
                                            </div>

                                            <div class="form-group">
                                                <label>Reg Date : </label>
                                                <?php echo htmlentities($result->RegDate); ?>
                                            </div>
                                            <?php if ($result->UpdationDate != "") { ?>
                                                <div class="form-group">
                                                    <label>Last Updation Date : </label>
                                                    <?php echo htmlentities($result->UpdationDate); ?>
                                                </div>
                                            <?php } ?>


                                            <div class="form-group">
                                                <label>Profile Status : </label>
                                                <?php if ($result->Status == 1) { ?>
                                                    <span style="color: green">Activ</span>
                                                <?php } else { ?>
                                                    <span style="color: red">Blocat</span>
                                                <?php } ?>
                                            </div>


                                            <div class="form-group">
                                                <label>Enter Full Name</label>
                                                <input class="form-control" type="text" name="fullname" value="<?php echo htmlentities($result->FullName); ?>" autocomplete="off" required />
                                            </div>


                                            <div class="form-group">
                                                <label>Numar telefon :</label>
                                                <input class="form-control" type="text" name="mobileno" maxlength="10" value="<?php echo htmlentities($result->MobileNumber); ?>" autocomplete="off" required />
                                            </div>

                                            <div class="form-group">
                                                <label>Enter Email</label>
                                                <input class="form-control" type="email" name="email" id="emailid" value="<?php echo htmlentities($result->EmailId); ?>" autocomplete="off" required readonly />
                                            </div>
                                    <?php }
                                    } ?>

                                    <button type="submit" name="update" class="btn btn-primary" id="submit">Update Now </button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">User Change Password</h4>
                    </div>
                </div>
                <?php if ($error) { ?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } else if ($msg) { ?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php } ?>
                <!--LOGIN PANEL START-->
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Change Password
                            </div>
                            <div class="panel-body">
                                <form role="form" method="post" onSubmit="return valid();" name="chngpwd">

                                    <div class="form-group">
                                        <label>Current Password</label>
                                        <input class="form-control" type="password" name="password" autocomplete="off" required />
                                    </div>

                                    <div class="form-group">
                                        <label>Enter Password</label>
                                        <input class="form-control" type="password" name="newpassword" autocomplete="off" required />
                                    </div>

                                    <div class="form-group">
                                        <label>Confirm Password </label>
                                        <input class="form-control" type="password" name="confirmpassword" autocomplete="off" required />
                                    </div>

                                    <button type="submit" name="change" class="btn btn-info">Change </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!---LOGIN PABNEL END-->


            </div>
        </div>

        <?php include('includes/footer.php'); ?>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>

    </html>


<?php }  ?>