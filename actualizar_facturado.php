<?php
include("conexion.php");
$con = conectar();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cod_incidencia = $_POST['cod_incidencia'];
    $facturado = $_POST['facturado'];

    $sql = "UPDATE gastos SET facturado = '$facturado' WHERE cod_incidencia = $cod_incidencia";
    if (mysqli_query($con, $sql)) {
        echo "Registro actualizado correctamente.";
    } else {
        echo "Error al actualizar el registro: " . mysqli_error($con);
    }
}
?>
