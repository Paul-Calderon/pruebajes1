<?php 
require "../config/Conexion.php";

Class Usuario
{
	//implementar nuestro constructor
	public function __construct()
	{

	}

	//Insertar registros
	public function insertar ($nombre, $direccion, $telefono, $email, $cargo, $login, $clave, $imagen, $idsucursaldet, $permiso)
	{
		$sqlrepet="SELECT * FROM usuario u where u.estado=1";
		$rspta=ejecutarConsulta($sqlrepet);
		$repetidos=0;

		while ($reg=$rspta->fetch_object())
		{
 			if($reg->nombre==$nombre || $reg->login==$login)
 			{
 				$repetidos=$repetidos+1;
 			}
 		}

 		if($imagen=="")
 		{
 			$imagen="1543363254.jpg";
 		}

 		if ($repetidos==0)
 		{
 				$sql="INSERT INTO `usuario`(`nombre`, direccion, telefono, email, `cargo`, `login`, `clave`, `imagen`, idsucursal, `estado`) VALUES ('$nombre', '$direccion', '$telefono', '$email', '$cargo', '$login', '$clave', '$imagen', '$idsucursaldet', '1')";
				$idusuarionew=ejecutarConsulta_retornarID($sql);
				$num_elementos=0;
				$sw=true;
				while($num_elementos <count($permiso))
				{
					$sql_detalle="INSERT INTO `usuario_permiso`(`idusuario`, `idpermiso`) VALUES ('$idusuarionew','$permiso[$num_elementos]')";
					ejecutarConsulta($sql_detalle) or $sw=false;
					$num_elementos=$num_elementos+1;
				}	
 				
		}
		else
		{
			$sw="Nombre o Login ya existe";
		}	
		//return ejecutarConsulta($sql2);
		return $sw;
		
	}

	//Editar registros
	public function editar ($idusuario, $nombre, $direccion, $telefono, $email, $cargo, $login, $clave, $imagen, $idsucursaldet, $permiso)
	{
		if($imagen=="")
		{
			$sql="UPDATE `usuario` SET  nombre='$nombre', direccion='$direccion', telefono='$telefono', email='$email', `cargo`='$cargo', `login`='$login', `clave`='$clave', idsucursal='$idsucursaldet' WHERE `idusuario`='$idusuario'";
		}
		else
		{
			$sql="UPDATE `usuario` SET nombre='$nombre', direccion='$direccion', telefono='$telefono', email='$email', `cargo`='$cargo', `login`='$login', `clave`='$clave', `imagen`='$imagen', idsucursal='$idsucursaldet' WHERE `idusuario`='$idusuario'";
		}
		ejecutarConsulta($sql);
		
		//Eliminar tados de los permisos
		$sqldel="DELETE from usuario_permiso where idusuario='$idusuario'";
		ejecutarConsulta($sqldel);

		$num_elementos=0;
		$sw=true;
		while($num_elementos <count($permiso))
		{
			$sql_detalle="INSERT INTO `usuario_permiso`(`idusuario`, `idpermiso`) VALUES ('$idusuario','$permiso[$num_elementos]')";
			ejecutarConsulta($sql_detalle) or $sw=false;
			$num_elementos=$num_elementos+1;
		}
		//return ejecutarConsulta($sql);
		return $sw;

	}

	//eleminar registros o desactivar
	public function desactivar($idusuario)
	{
		$sql2="UPDATE `usuario` SET `estado`='0' WHERE `idusuario`='$idusuario'";
		return ejecutarConsulta($sql2);
	}

	//activar registros
	public function activar($idusuario)
	{
		$sql="UPDATE `usuario` SET `estado`='1' WHERE `idusuario`='$idusuario'";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idusuario)
	{
		$sql="SELECT u.* FROM usuario u WHERE u.`idusuario`='$idusuario'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Implementar un método para listar los registros
	public function listar($sucursal)
	{
		if($sucursal==1)
		{
			$sql="SELECT u.*, s.sucursal  FROM usuario u Inner join sucursal s on s.idsucursal=u.idsucursal where u.estado=1 and u.nombre <> 'soporte'";
		}
		else
		{
			$sql="SELECT u.*, s.sucursal FROM usuario u Inner join sucursal s on s.idsucursal=u.idsucursal where u.estado=1 and u.nombre <> 'soporte' and u.idsucursal='$sucursal'";
		}
		return ejecutarConsulta($sql);		
	}

	public function listarmarcados($idusuario)
	{
		$sql="SELECT * FROM usuario_permiso where idusuario ='$idusuario'";
		return ejecutarConsulta($sql);		
	}

	// funcion de verificación del sistema
	public function verificar($login, $clave, $permisos)
	{
		
		$sql="SELECT * FROM usuario u WHERE u.login='$login' AND u.clave='$clave' And u.estado<>'0'";			
		return ejecutarConsulta($sql);		
	}	

	
}

?>