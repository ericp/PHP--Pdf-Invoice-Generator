<?php

require('fpdf.php');

$pdf = new FPDF();
$pdf->AddPage();

function utf8_to_iso8859_1(string $string): string {
    $s = (string) $string;
    $len = \strlen($s);

    for ($i = 0, $j = 0; $i < $len; ++$i, ++$j) {
        switch ($s[$i] & "\xF0") {
            case "\xC0":
            case "\xD0":
                $c = (\ord($s[$i] & "\x1F") << 6) | \ord($s[++$i] & "\x3F");
                $s[$j] = $c < 256 ? \chr($c) : '?';
                break;

            case "\xF0":
                ++$i;
                // no break

            case "\xE0":
                $s[$j] = '?';
                $i += 2;
                break;

            default:
                $s[$j] = $s[$i];
        }
    }

    return substr($s, 0, $j);
}

//Titulo
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40,10,"Factura",0,1);

//Datos de la empresa
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40,10,"EMPRESA",0,1);
$pdf->SetFont('Arial', 'B', 12);
$pdf->MultiCell(100,10,"Wanderlust INC\nCalle Wisonsing, 20, Navacerrada\n28650 Madrid\nCIF: 678567876B",1);
$pdf->Ln(5);


//Datos del cliente
$codigo= $_POST["codigo"];
$miconexion = mysqli_connect("localhost", "root", "root", "SG");
//(cambiar manualmente en cada caso):
$consulta="select distinct * from Factura WHERE numero_factura =  ' $codigo ' ";
$resultado=mysqli_query($miconexion,$consulta);

$pdf->SetFont('Arial', 'B', 12);


while(($row = $resultado->fetch_assoc())!=null){
    $pdf->Cell(100,10,"Cliente",0,1);
$pdf->Cell(30,10,$row["nombre_cliente"],1,0,'L');
$pdf->Cell(90,10,$row["direccion"],1,0,'L');
$pdf->Cell(30,10,$row["telefono"],1,0,'L');
$pdf->Cell(30,10,$row["CIF/NIF"],1,1,'L');
$pdf->ln(10);
$pdf->Cell(60,10,utf8_to_iso8859_1("Lineas de la factura"),0,1);
$pdf->Cell(30,10,$row["numero_factura"],1,0,'L');
$pdf->Cell(30,10,$row["fecha_factura"],1,0,'L');
$pdf->Cell(30,10,$row["forma_pago"],1,0,'L');
$pdf->Cell(30,10,$row["plazo_pago"]." dias",1,1,'L');
$pdf->ln(10);
}

$resultado->free();

//mostrar la tabla de lineas de la factura
$consulta="select * from Factura WHERE numero_factura = ' $codigo '";
$resultado=mysqli_query($miconexion,$consulta);

$baseimponible=0;
$totalapagar=0;
$ivatotal=0;
$obervaciones="";


$pdf->Cell(30,10,"Nombre",1,0,'L');
$pdf->Cell(30,10,"Precio",1,0,'L');
$pdf->Cell(30,10,"Cantidad",1,0,'L');
$pdf->Cell(30,10,"iva",1,0,'L');
$pdf->Cell(30,10,"Importe",1,0,'L');
$pdf->Cell(30,10,"Total",1,1,'L');

while(($row = $resultado->fetch_assoc())!=null){
        $importe=$row["precio_producto"] * $row["cantidad"];
        $total= $importe + $importe*($row["iva_producto"]/100);
        $pdf->Cell(30,10,$row["nombre_producto"],1,0,'L');
        $pdf->Cell(30,10,$row["precio_producto"].chr(128),1,0,'L');
        $pdf->Cell(30,10,$row["cantidad"],1,0,'L');
        $pdf->Cell(30,10,$row["iva_producto"],1,0,'L');
        $pdf->Cell(30,10,$importe.chr(128),1,0,'L');
        $pdf->Cell(30,10,$total.chr(128),1,1,'L');
        $baseimponible += $importe;
        $totalapagar+=$total;
        $ivatotal+=$importe*($row["iva_producto"]/100);
        $obervaciones=$row["estructura"];
}
$pdf->setFont('Arial','', 12);
$pdf->ln(20);
$pdf->Cell(60,10,"BASE IMPONIBLE",1,0,'L');
$pdf->Cell(40,10,"IVA",1,0,'L');
$pdf->Cell(60,10,"TOTAL A PAGAR",1,1,'L');

$pdf->Cell(60,10,$baseimponible.chr(128),1,0,'L');
$pdf->Cell(40,10,$ivatotal.chr(128),1,0,'L');
$pdf->Cell(60,10,$totalapagar.chr(128),1,1,'L');

$pdf->ln(20);
$pdf->Cell(60,10,"OBSERVACIONES",1,1,'L');
$pdf->Cell(60,10,$obervaciones,1,1,'L');
$pdf->ln(20);
$pdf->Cell(40,10,"ANEXO",1,1,'L');
$pdf->Cell(40,10,"Clausula de RGPD",1,1,'L');
$pdf->ln(20);
$resultado->free();
$pdf->Output();
mysql_close($miconexion);


?>