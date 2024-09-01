<?php 
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}
    include("conexion.php");
    $con=conectar();

    $sql="SELECT *  FROM reservaciones ORDER BY fecha DESC";
    $query=mysqli_query($con,$sql);

    $sql2="SELECT *  FROM entrec";
    $query2=mysqli_query($con,$sql2);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Administrador</title>
        <link rel="shortcut icon" href="https://static.wixstatic.com/media/9ed84f_b72e16d4242e4e97a54c4945ac674912~mv2.png/v1/fill/w_50,h_50,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/9ed84f_b72e16d4242e4e97a54c4945ac674912~mv2.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!-- Bootstrap Stylesheets -->
	    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/responsive.css?v=2">
	    <!-- Font Awesome Stylesheets -->
	    <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/design.css?v=2">
        <link rel="stylesheet" href="css/button1.css?v=2">
        <link rel="stylesheet" href="css/estilo4.css?v=2">
        <link rel="stylesheet" href="css/estilo8.css">
	    <!-- Template Main Stylesheets -->
	    <link rel="stylesheet" href="css/contact-form.css" type="text/css">	
        <!--SWEET ALERT-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.all.min.js"></script>	
        <!--SWEET ALERT-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.all.min.js"></script>
        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <!--SCRIPT PARA LLENADO AUTOMÁTICO DE SELECTS 2 -->
        <style>
            .custom-container {
                max-width: 1600px; /* Ajusta el valor según tus necesidades */
                margin: 0 auto; /* Centra el contenido horizontalmente */
            }
            .logo-img {
            max-width: 50px; /* Ajusta el valor según tus necesidades */
            }
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        table-layout:fixed;
        }

        td, th {
        border: 1px solid #dddddd;
        text-align: center;
        padding: 0.5% 0;
        overflow:hidden;
        width: 50;
        white-space:nowrap;
        }

        tr:nth-child(even) {
        background-color: #dddddd;
        }
        .thc{
            background-color: Red;
        }

        .btnch {
        background-color: DodgerBlue;
        border: none;
        color: white;
        padding: 12px 16px;
        font-size: 16px;
        cursor: pointer;
        }
        .btnp {
        background-color: Green;
        border: none;
        color: white;
        padding: 12px 16px;
        font-size: 16px;
        cursor: pointer;
        }

        .btnc {
        background-color: Red;
        border: none;
        color: white;
        padding: 12px 16px;
        font-size: 16px;
        cursor: pointer;
        }

        .btni {
        background-color: #669999;
        border: none;
        color: white;
        padding: 12px 16px;
        font-size: 16px;
        cursor: pointer;
        }
        /* Darker background on mouse-over */
        .btn:hover {
        background-color: Black;
        }
        /* Darker background on mouse-over */
        .btnp:hover {
        background-color: Black;
        }
        /* Darker background on mouse-over */
        .btnc:hover {
        background-color: Black;
        }
        .h1{
            text-align:center;
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px; /* Espaciado entre los botones */
            justify-content: center;
        }

        /* Estilos para los botones */
        .btn2 {
            font-size: 20px;
            border-radius: 15px; /* Mayor radio para hacerlos más cuadrados */
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 20px; /* Mayor relleno para hacerlos más cuadrados */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 100%;
        }
        </style>
        
    </head>
    <body>

            <div class="header">
                <a href="inicio.php" class="logo">
                    <img src="https://static.wixstatic.com/media/9ed84f_e9388ac15d374e77aa9c89cdb80e014a~mv2.png" alt="Logo" class="logo-img">
                    <?php echo htmlspecialchars($_SESSION["username"]); ?>
                </a>
                    <div class="header-right">
                        <!--<a href="ocupacion.php">Calendario</a>-->
                        <a onclick="salir()">Cerrar sesión</a>
                        <script>
                                function salir() {
                                    Swal.fire({
                                        title: '¿Está seguro?',
                                        text: "¿Desea salir?",
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Sí, salir',
                                        cancelButtonText: 'Cancelar'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            // Aquí puedes colocar el código para cerrar la ventana o redireccionar a otra página
                                            window.location.href = 'logout.php';
                                        }
                                    })
                                }
                        </script>
                    </div>
            </div>

            <div class="container mt-5 custom-container">
                    <div class="row"> 
                        <div>
                                <div style="text-align: right;">
                                <script>
                                    var options2 = {
                                        weekday: 'long',
                                        year: 'numeric',
                                        month: 'long',
                                        day: 'numeric'
                                    };

                                    var date = new Date().toLocaleDateString('es-ES', options2);
                                    var formattedDate = date.replace(/^\w/, (c) => c.toUpperCase());
                                    var styledDate = "<strong>" + formattedDate + "</strong>";
                                    
                                    document.write(styledDate);
                                </script>
                                </div>
                                <br>
                                <a href="flujoe.php">
                                    <button class="btn info"><i class="fa1 fa fa-arrow-left"></i></button>
                                </a>
                                <!--CONTENEDOR DE BOTONES AQUÍ-->
                                <?php
// Conexión a la base de datos
$host = 'localhost';
$dbname = 'prueba';
$username = 'root';
$password = '';

// Crear conexión
$conexion = mysqli_connect($host, $username, $password, $dbname);

// Verificar conexión
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Recuperar el ID desde la URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id > 0) {
    // Consulta para obtener la entrada específica por ID
    $sql = "SELECT * FROM flujoefectivo WHERE id = $id";
    $resultado = mysqli_query($conexion, $sql);

    if (mysqli_num_rows($resultado) > 0) {
        $fila = mysqli_fetch_assoc($resultado);
        $detalle_operacion = $fila['detalle_operacion'];
    } else {
        echo "<p>No se encontró la entrada especificada.</p>";
        exit;
    }
} else {
    echo "<p>ID no válido.</p>";
    exit;
}
?>

<h1 style="text-align: center;"><b>Contabilidad - Flujo de Efectivo</b></h1>
<br>
<hr>
<br>

<!-- Cabecera de la tabla con detalles generales -->
<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
    <thead>
        <tr>
            <th>Fecha Apertura de Caja</th>
            <th>Fecha Cierre de Caja</th>
            <th>Monto Inicial</th>
            <th>Total Entradas</th>
            <th>Total Salidas</th>
            <th>Gran Total</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><?php echo htmlspecialchars($fila['fecha']); ?></td>
            <td><?php echo htmlspecialchars($fila['fecha_hora_registro']); ?></td>
            <td><?php echo htmlspecialchars($fila['monto_inicial']); ?></td>
            <td><?php echo htmlspecialchars($fila['total_entradas']); ?></td>
            <td><?php echo htmlspecialchars($fila['total_salidas']); ?></td>
            <td><?php echo htmlspecialchars($fila['gran_total']); ?></td>
        </tr>
    </tbody>
</table>

<br><br>

<!-- Tabla para mostrar el detalle de operaciones -->
<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
    <thead>
        <tr>
            <th>Operación</th>
            <th>Descripción</th>
            <th>Entrada</th>
            <th>Salida</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Separar las operaciones de la columna detalle_operacion
        $operaciones = explode("\n", $detalle_operacion);

        foreach ($operaciones as $operacion) {
            $partes = explode(", ", $operacion);

            // Inicializar las variables
            $tipo_operacion = '';
            $descripcion = '';
            $entrada = '';
            $salida = '';

            // Asignar los valores de acuerdo a las partes
            foreach ($partes as $parte) {
                if (strpos($parte, 'Operacion:') !== false) {
                    $tipo_operacion = trim(explode(':', $parte)[1]);
                } elseif (strpos($parte, 'Descripción:') !== false) {
                    $descripcion = trim(explode(':', $parte)[1]);
                } elseif (strpos($parte, 'Entrada:') !== false) {
                    $entrada = trim(explode(':', $parte)[1]);
                } elseif (strpos($parte, 'Salida:') !== false) {
                    $salida = trim(explode(':', $parte)[1]);
                }
            }

            echo "<tr>";
            echo "<td>" . htmlspecialchars($tipo_operacion) . "</td>";
            echo "<td>" . htmlspecialchars($descripcion) . "</td>";
            echo "<td>" . htmlspecialchars($entrada) . "</td>";
            echo "<td>" . htmlspecialchars($salida) . "</td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>

<?php
// Cerrar la conexión
mysqli_close($conexion);
?>

                                

                                
                                <br><br>
                                <br><br>
                            </div>
                        </div>
                    </div>  
            </div>
            
    </body>
    <!--Fin de la página-->
    <br><br>
    <footer>
            <p>Hotel Casa Flora Atlixco, Todos los derechos reservados &copy; 2022</p>
    </footer>
</html>