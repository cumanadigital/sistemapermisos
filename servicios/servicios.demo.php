<?php include('../conf/config.php');?>
<?php include('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
echo "servicios.demo<br />";
print_r (DB_NAME."<br />");
print_r (DB_USER."<br />");
print_r (DB_PASSWORD."<br />");
print_r (DB_DRIVER."<br />");
//printf($_POST);
ver_arreglo($_POST);
?>
