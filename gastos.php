<?php 
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}
    
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	    <!-- Template Main Stylesheets -->
	    <link rel="stylesheet" href="css/contact-form.css" type="text/css">	
        <!--SWEET ALERT-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.all.min.js"></script>	
        <!--SWEET ALERT-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                                <a href="inicio.php">
                                    <button class="btn info"><i class="fa1 fa fa-arrow-left"></i></button>
                                </a>
                                <!--CONTENEDOR DE BOTONES AQUÍ-->
                                <h1 style="text-align: center;"><b>Contabilidad - Gastos</b></h1>
                                <br>
                                <hr>
                                <br>

                                <div class="container">

    <table class="table table-bordered" id="gastos-table">
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Descripción</th>
                <th>Habitación</th>
                <th>Departamento</th>
                <th>Costo</th>
                <th>Facturado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí se llenarán las filas con PHP -->
            <?php
            include("conexion.php");
            $con = conectar();

            $sql = "SELECT * FROM gastos";
            $query = mysqli_query($con, $sql);

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
        </tbody>
    </table>
    <button class="btn btn-primary" id="add-row-btn">Agregar Fila</button>
</div>

    <script>
         $(document).ready(function () {
        // Código de JavaScript para agregar, guardar y eliminar filas

        // Actualizar facturado al marcar/desmarcar el checkbox
        $(document).on('change', '.facturado-checkbox', function () {
            var cod_incidencia = $(this).data('id');
            var facturado = $(this).is(':checked') ? 'SI' : 'NO';

            $.ajax({
                url: 'actualizar_facturado.php',
                type: 'POST',
                data: {
                    cod_incidencia: cod_incidencia,
                    facturado: facturado
                },
                success: function (response) {
                    console.log('Registro actualizado correctamente.');
                }
            });
        });
    });

        $(document).ready(function () {
            // Agregar una nueva fila al hacer clic en el botón "Agregar Fila"
            $('#add-row-btn').click(function () {
                $('#gastos-table tbody').append(`
                    <tr>
                        <td><input type="date" class="form-control" name="fecha"></td>
                        <td><input type="text" class="form-control" name="descripcion" placeholder="Descripción"></td>
                        <td>
                            <select class="form-control" name="habitacion">
                                <option value="#">Habitación</option>
                                <option value="Cuna de Moisés">Cuna de Moisés</option>
                                <option value="Dalia">Dalia</option>
                                <option value="Bugambilia">Bugambilia</option>
                                <option value="Tulipan">Tulipan</option>
                                <option value="Jazmín">Jazmín</option>
                                <option value="Violeta">Violeta</option>
                                <option value="Lily">Lily</option>
                                <option value="Girasol">Girasol</option>
                                <option value="Margarita">Margarita</option>
                                <option value="Nochebuena">Nochebuena</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control" name="area">
                                <option value="#">Área</option>
                                <option value="Amenidades">Amenidades</option>
                                <option value="Artículos de Limpieza">Artículos de Limpieza</option>
                                <option value="Blancos">Blancos</option>
                                <option value="Cocina">Cocina</option>
                                <option value="Construcción">Construcción</option>
                                <option value="Eléctrico">Eléctrico</option>
                                <option value="Gas">Gas</option>
                                <option value="Grifería">Grifería</option>
                                <option value="Habitación">Habitación</option>
                                <option value="Herramienta">Herramienta</option>
                                <option value="Mobiliario">Mobiliario</option>
                                <option value="Plomeria">Plomeria</option>
                            </select>
                        </td>
                        
                        <td><input type="int" class="form-control" name="costo" placeholder="Costo"></td>
                        <!-- Campo oculto para el valor por defecto "NO" de la columna facturado -->
                        <input type="hidden" name="facturado" value="NO">
                        <td><button class="btn btn-success btn-sm save-btn">Guardar</button></td>
                    </tr>
                `);
            });

            // Guardar una nueva fila al hacer clic en el botón "Guardar"
            // Guardar una nueva fila al hacer clic en el botón "Guardar"
$(document).on('click', '.save-btn', function () {
    var row = $(this).closest('tr');
    var fecha = row.find('input[name="fecha"]').val();
    var habitacion = row.find('select[name="habitacion"]').val(); // Cambiado a 'select'
    var area = row.find('select[name="area"]').val();             // Cambiado a 'select'
    var descripcion = row.find('input[name="descripcion"]').val();
    var costo = row.find('input[name="costo"]').val();
    var facturado = row.find('input[name="facturado"]').val();

    // Validar que los campos no estén vacíos
    if (fecha && habitacion && area && descripcion && costo && facturado) {
        $.ajax({
            url: 'guardar_gasto.php',
            type: 'POST',
            data: {
                fecha: fecha,
                habitacion: habitacion,
                area: area,
                descripcion: descripcion,
                costo: costo,
                facturado: facturado
            },
            success: function (response) {
                // Reemplazar los inputs con texto una vez que se guarden los datos
                row.html(`
                    <td>${fecha}</td>
                    <td>${descripcion}</td>
                    <td>${habitacion}</td>
                    <td>${area}</td>
                    <td>${costo}</td>
                    <td>${facturado}</td>
                    <td><button class="btn btn-danger btn-sm delete-btn">Eliminar</button></td>
                `);
            }
        });
    } else {
        alert('Por favor, complete todos los campos.');
    }
});



            // Eliminar una fila (puedes añadir la lógica para eliminarla también de la base de datos)
            $(document).on('click', '.delete-btn', function () {
                var row = $(this).closest('tr');
                var fecha = row.find('td').eq(0).text();

                if (confirm('¿Seguro que deseas eliminar este registro?')) {
                    // Aquí podrías agregar una llamada AJAX para eliminar el registro de la base de datos

                    row.remove(); // Eliminar la fila de la tabla en el frontend
                }
            });
        });
    </script>

                                
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