<?php
//Datos a mostrar
$miconexion = mysqli_connect("localhost", "root", "root", "SG");
//(cambiar manualmente en cada caso):
$consulta="select * from Factura";
$resultado=mysqli_query($miconexion,$consulta);

$html = null;


?>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>Buscador</title>
</head>
<body>

<h1>LISTADO DE FACTURAS</h1>

<table>
    <tr>
        <th>Numero Factura  </th>
        <th>Fecha de Facturacion  </th>
        <th>Nombre de Cliente  </th>
        <th>CIF/NIF  </th>
    </tr>
    <?php
    while(($row = $resultado->fetch_assoc())!=null) {

        $html="<tr> <td>".$row["id_factura"]."</td>
        <td>".$row["fecha_factura"]."</td>
        <td>".$row["nombre_cliente"]."</td>
        <td>".$row["CIF/NIF"]."</td>";
        "<br>
        </tr>";

        echo $html;
    }
    ?>


</table>
    <form action="lafactura.php" method="post">
        <input type="text" name="codigo" method="aqui" placeholder="Ingrese codigo de la factura">
        <input type="submit" method="yaqui" name="buscar" value="IR">
    </form>
</body>
</html>