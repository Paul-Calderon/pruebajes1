<?php 
session_start();
require_once "../modelos/Institucion.php";

$institu=new Institucion();

$idinstitucion=isset($_POST["idinstitucion"])?limpiarCadena($_POST["idinstitucion"]):"";
$nombres=isset($_POST["nombres"])?limpiarCadena($_POST["nombres"]):"";
$direccion=isset($_POST["direccion"])?limpiarCadena($_POST["direccion"]):"";
$telefonoper=isset($_POST["telefonoper"])?limpiarCadena($_POST["telefonoper"]):"";
$descripcion=isset($_POST["descripcion"])?limpiarCadena($_POST["descripcion"]):"";

switch ($_GET["op"]) {
	case 'listar':
		$rspta=$institu->listar();
			//Vamos a declarar un array
 		$data= array();
 		
 		while ($reg=$rspta->fetch_object()){
 			$data[]=array(
 				"0"=>($reg->estado)?'<button title="Editar" class="btn btn-warning" onclick="mostrar('.$reg->idinstitucion.')"><i class="fa fa-pen"></i></button>'.
 					' <button class="btn btn-danger" title="Eliminar" onclick="desactivar('.$reg->idinstitucion.')"><i class="fa fa-trash-alt"></i></button>':
 					' <button class="btn btn-success" title="Activar" onclick="activar('.$reg->idinstitucion.')"><i class="fa fa-history"></i></button>',
 				"1"=>$reg->nombre,
 				"2"=>$reg->descripcion,
 				"3"=>$reg->direccion,
 				"4"=>$reg->telefono,
 				"5"=>($reg->estado)?'<span class="badge bg-success">Activo</span>': '<span class="badge bg-danger">Anulado</span>'
 				);
 		}
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);

 		echo json_encode($results);

	break;
	case 'desactivar':
		$rspta=$institu->desactivar($idinstitucion);
		echo $rspta;
	break;
	
	case 'mostrar':
		$rspta=$institu->mostrar($idinstitucion);
 		echo json_encode($rspta);
 	break;
	case 'guardaryeditar':
		if(empty($idinstitucion))
		{
			$rspta=$institu->insertar ($nombres, $direccion, $telefonoper, $descripcion);
			echo $rspta;
		}	
		else
		{
			$rspta=$institu->editar ($idinstitucion, $nombres, $direccion, $telefonoper, $descripcion);
			echo $rspta;
		}

	

	break;
	
	

}
?>
