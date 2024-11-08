<?php
include("conexion.php");
$con = conectar();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fecha = $_POST['fecha'];
    $habitacion = $_POST['habitacion'];
    $area = $_POST['area'];
    $descripcion = $_POST['descripcion'];
    $costo = $_POST['costo'];
    $facturado = $_POST['facturado']; // Recibir el valor de 'facturado'

    $sql = "INSERT INTO gastos (fecha, habitacion, area, descripcion, costo, facturado) 
            VALUES ('$fecha', '$habitacion', '$area', '$descripcion', $costo, '$facturado')";
    if (mysqli_query($con, $sql)) {
        echo "Registro guardado exitosamente";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
}
?>
