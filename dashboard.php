<?php
session_start();
error_reporting(0);
include('includes/config.php');

if (strlen($_SESSION['login']) == 0) {
    header('location: index.php');
} else { ?>

    <style>
        <?php include 'assets/css/style.css'; ?>
    </style>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Biblioteca Autonom</title>
        <!-- <link href="assets/css/style.css" rel="stylesheet" /> -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
    </head>

    <body>
        <?php include('includes/header.php'); ?>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">User Dashboard</h4>
                    </div>
                </div>
                <div class="row">

                    <a href="listed-books.php">
                        <div class="col-md-4 col-sm-4 col-xs-6">
                            <div class="alert alert-heart back-widget-set text-center">
                                <i class="fa fa-heart fa-5x"></i>
                                <?php
                                $sql = "SELECT id from tblbooks ";
                                $query = $dbh->prepare($sql);
                                $query->execute();
                                $results = $query->fetchAll(PDO::FETCH_OBJ);
                                $listdbooks = $query->rowCount();
                                ?>
                                <h3><?php echo htmlentities($listdbooks); ?></h3>
                                Carti listate
                            </div>
                        </div>
                    </a>

                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-recycle fa-5x"></i>
                            <?php
                            $rsts = 0;
                            $sid = $_SESSION['stdid'];
                            $sql2 = "SELECT id from tblissuedbookdetails where StudentID=:sid and (RetrunStatus=:rsts || RetrunStatus is null || RetrunStatus='')";
                            $query2 = $dbh->prepare($sql2);
                            $query2->bindParam(':sid', $sid, PDO::PARAM_STR);
                            $query2->bindParam(':rsts', $rsts, PDO::PARAM_STR);
                            $query2->execute();
                            $results2 = $query2->fetchAll(PDO::FETCH_OBJ);
                            $returnedbooks = $query2->rowCount();
                            ?>

                            <h3><?php echo htmlentities($returnedbooks); ?></h3>
                            Carti nereturnate
                        </div>
                    </div>

                    <a href="issued-books.php">
                        <div class="col-md-4 col-sm-4 col-xs-6">
                            <div class="alert alert-success back-widget-set text-center">
                                <i class="fa fa-book fa-5x"></i>
                                <?php
                            $rsts = 0;
                            $sid = $_SESSION['stdid'];
                            $sql2 = "SELECT id from tblissuedbookdetails where StudentID=:sid and (RetrunStatus=:rsts || RetrunStatus is null || RetrunStatus='')";
                            $query2 = $dbh->prepare($sql2);
                            $query2->bindParam(':sid', $sid, PDO::PARAM_STR);
                            $query2->bindParam(':rsts', $rsts, PDO::PARAM_STR);
                            $query2->execute();
                            $results2 = $query2->fetchAll(PDO::FETCH_OBJ);
                            $returnedbooks = $query2->rowCount();
                            ?>

                            <h3><?php echo htmlentities($returnedbooks); ?></h3>
                                Carti imprumutate
                            </div>
                        </div>
                    </a>

                </div>
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

<?php } ?>

<!-- <style>
<?php include 'assets/css/font-awesome.css';
include 'assets/css/style.css'; ?>
</style> -->