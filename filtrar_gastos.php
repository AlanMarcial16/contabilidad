<?php
include("conexion.php");
$con = conectar();

// Obtener el filtro seleccionado
$filter = isset($_POST['filter']) ? $_POST['filter'] : 'todos';

$sql = "SELECT * FROM gastos";

// Modificar la consulta SQL según el filtro
if ($filter === 'hoy') {
    $sql .= " WHERE DATE(fecha) = CURDATE()";
} elseif ($filter === 'semana') {
    $sql .= " WHERE YEARWEEK(fecha, 1) = YEARWEEK(CURDATE(), 1)";
} elseif ($filter === 'mes') {
    $sql .= " WHERE MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE())";
}

$query = mysqli_query($con, $sql);

// Generar las filas de la tabla
while ($row = mysqli_fetch_assoc($query)) {
    $facturadoChecked = $row['facturado'] === 'SI' ? 'checked' : '';
    echo "<tr>
            <td>{$row['fecha']}</td>
            <td>{$row['descripcion']}</td>
            <td>{$row['habitacion']}</td>
            <td>{$row['area']}</td>
            <td>{$row['costo']}</td>
            <td><input type='checkbox' class='facturado-checkbox' data-id='{$row['cod_incidencia']}' $facturadoChecked></td>
            <td><button class='btn btn-danger btn-sm delete-btn'>Eliminar</button></td>
          </tr>";
}
?>
