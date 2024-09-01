<?php
include("conexion.php");
$con = conectar();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fecha = $_POST['fecha'];
    $habitacion = $_POST['habitacion'];
    $area = $_POST['area'];
    $descripcion = $_POST['descripcion'];
    $costo = $_POST['costo'];

    $sql = "INSERT INTO gastos (fecha, habitacion, area, descripcion, costo) VALUES ('$fecha', '$habitacion', '$area', '$descripcion', $costo)";
    if (mysqli_query($con, $sql)) {
        echo "Registro guardado exitosamente";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
}
?>
