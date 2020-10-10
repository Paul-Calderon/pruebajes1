<?php 
if (strlen(session_id()) < 1) 
  session_start();

require_once "../modelos/Usuario.php";

$usuario=new Usuario();

$idusuario=isset($_POST["idusuario"])?limpiarCadena($_POST["idusuario"]):"";
$nombre=isset($_POST["nombre"])?limpiarCadena($_POST["nombre"]):"";
$direccion=isset($_POST["direccion"])?limpiarCadena($_POST["direccion"]):"";
$telefono=isset($_POST["telefono"])?limpiarCadena($_POST["telefono"]):"";
$email=isset($_POST["email"])?limpiarCadena($_POST["email"]):"";
$cargo=isset($_POST["cargo"])?limpiarCadena($_POST["cargo"]):"";
$login=isset($_POST["login"])?limpiarCadena($_POST["login"]):"";
$clave=isset($_POST["clave"])?limpiarCadena($_POST["clave"]):"";
$imagen=isset($_POST["imagen"])?limpiarCadena($_POST["imagen"]):"";
$contpermisos=isset($_POST["contpermisos"])?limpiarCadena($_POST["contpermisos"]):"";
$idsucursaldet=isset($_POST["idsucursaldet"])?limpiarCadena($_POST["idsucursaldet"]):"";

switch ($_GET["op"]) {
	case 'guardaryeditar':
		if (!file_exists($_FILES['imagen']['tmp_name']) || !is_uploaded_file($_FILES['imagen']['tmp_name']))
		{
			$imagen=$_POST["imagenactual"];
		}
		else 
		{
			$ext = explode(".", $_FILES["imagen"]["name"]);
			if ($_FILES['imagen']['type'] == "image/jpg" || $_FILES['imagen']['type'] == "image/jpeg" || $_FILES['imagen']['type'] == "image/png")
			{
				$imagen = round(microtime(true)) . '.' . end($ext);
				move_uploaded_file($_FILES["imagen"]["tmp_name"], "../files/usuario/" . $imagen);
			}
		}


		// hash encriptacion de contraseña
		//$clavehash=hash("SHA256",$clave);

		if(empty($idusuario))
		{
			
			if($contpermisos=="")
			{
				echo "Debe ingresar almenos un permiso";
			}
			else
			{
				$rspta=$usuario->insertar ($nombre, $direccion, $telefono, $email, $cargo, $login, $clave, $imagen, $idsucursaldet, $_POST['permiso']);
				echo $rspta;
				
			}
			
		}	
		else
		{
			
			$rspta=$usuario->editar ($idusuario, $nombre, $direccion, $telefono, $email, $cargo, $login, $clave, $imagen, $idsucursaldet, $_POST['permiso']);
			echo $rspta;
			
		}
	break;

	case 'desactivar':

		$rspta=$usuario->desactivar($idusuario);
		echo $rspta ? "Usuario Eliminado" : "Usuario no Eliminado";
	break;

	case 'activar':
		$rspta=$usuario->activar($idusuario);
		echo $rspta ? "Usuario Activado" : "Usuario no Activado";		
	break;
	case 'mostrar':
		$rspta=$usuario->mostrar($idusuario);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);
 		break;
	
	case 'listar':
	$sucursal=$_SESSION['sucursal'];
	
		$idsucursal=$_GET['idsucursal'];
		if($idsucursal=="a")
		{
			$idsucursal=$sucursal;
		}
		$rspta=$usuario->listar($idsucursal);
 		//Vamos a declarar un array
 		$data= array();

 		while ($reg=$rspta->fetch_object()){
 			($idsucursal==1)?$comentario=" / ".$reg->sucursal:$comentario='';
 			$data[]=array(
 				"0"=>($reg->cargo<>3)?'<button title="Editar" class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><i class="fa fa-pen"></i></button>'.
 					' <button class="btn btn-danger" title="Eliminar" onclick="desactivar('.$reg->idusuario.')"><i class="fa fa-trash-alt"></i></button>':
 					'<button title="Editar" class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><i class="fa fa-pen"></i></button>',
 				"1"=>$reg->nombre,
 				"3"=>$reg->telefono,
 				"2"=>$reg->direccion,
 				"4"=>$reg->email,
 				"5"=>($reg->cargo==1)?'Administración':'Estándar',
 				"6"=>$reg->login,
 				"7"=>"<button class='btn btn-default' type='button' title='Amplear Imagen' onclick='amplearima(".$reg->idusuario.")'><img src='../files/usuario/".$reg->imagen."' height='50px' width='50px' ></button>",
 				"8"=>($reg->estado)?'<span class="badge bg-success">Activo </span>'.$comentario: '<span class="badge bg-success">Anulado </span>'.$comentario
 				);
 		}
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);

 		echo json_encode($results);

	break;
	case 'permisos':
		require_once "../modelos/Permisos.php";
		$permiso= New Permiso();
		$rspta=$permiso->listar();

		//obtener los permisos asignados al usuario
		$id=$_GET['id'];
		$marcados=$usuario->listarmarcados($id);
		$valores=array();

		// almacenar los permisos asignados al usuario
		while ($per=$marcados->fetch_object())
		{
			array_push($valores, $per->idpermiso);
		}
		//mostrar la lista de permisos
		while ($reg =$rspta->fetch_object())
		{
			$sw=in_array($reg->idpermiso, $valores)?'checked':'';
			echo '<li><div class="icheck-primary d-inline" ><input type="checkbox" '.$sw.' name="permiso[]" id="permisos'.$reg->idpermiso.'" value="'.$reg->idpermiso.'"><label for="permisos'.$reg->idpermiso.'">'.$reg->nombre.'</label></div></li>';
			//echo '<li> <input type="checkbox" '.$sw.' name="permiso[]" value="'.$reg->idpermiso.'">'.$reg->nombre.'</li>';
			
		}
	break;

	case 'verificar':
		$logina=$_POST['logina'];
	    $clavea=$_POST['clavea'];
	    $permisos=$_POST['permisos'];
	    //Hash SHA256 en la contraseña
		//$clavehash=hash("SHA256",$clavea);

		$rspta=$usuario->verificar($logina, $clavea, $permisos);

		$fetch=$rspta->fetch_object();
		
		if (isset($fetch))
	    {
	    	
	        //Declaramos las variables de sesión
	       	$_SESSION['idusuario']=$fetch->idusuario;
	        $_SESSION['nombre']=$fetch->nombre;
	        $_SESSION['imagen']=$fetch->imagen;
	        $_SESSION['email']=$fetch->email;
	        $_SESSION['cargo']=$fetch->cargo;
	        $_SESSION['login']=$fetch->login;
	        $_SESSION['idestadodet']=$fetch->idestadodet;

	        //Obtenemos los permisos del usuario
	    	$marcados = $usuario->listarmarcados($fetch->idusuario);

	    	//Declaramos el array para almacenar todos los permisos marcados
			$valores=array();

			//Almacenamos los permisos marcados en el array
			while ($per = $marcados->fetch_object())
				{
					array_push($valores, $per->idpermiso);
				}

			//Determinamos los accesos del usuario
			in_array(1,$valores)?$_SESSION['usuario']=1:$_SESSION['usuario']=0;
			in_array(2,$valores)?$_SESSION['instituciones']=1:$_SESSION['instituciones']=0;
			
	    }
	    echo json_encode($fetch);
	break;

	case 'salir':
		//Limpiamos las variables de sesión   
        session_unset();
        //Destruìmos la sesión
        session_destroy();
        //Redireccionamos al login
        header("Location: ../index.php");

	break;

}
?>
