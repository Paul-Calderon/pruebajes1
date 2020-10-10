<?php 
require "../config/Conexion.php";

Class Escritorio
{
	//implementar nuestro constructor
	public function __construct()
	{

	}

	
	//Editar registros
	public function editar ($idusuario, $loginusers, $claveusers, $clavenew)
	{

		$sqlrepet="SELECT u.idusuario FROM usuario u where `idusuario`='$idusuario' and login='$loginusers' and clave='$claveusers'";
		$rspta=ejecutarConsulta($sqlrepet);
		$idusuario=0;

		while ($reg=$rspta->fetch_object())
		{
 			$idusuario=$reg->idusuario;
 		}

 		if($idusuario!=0)
 		{
			$sql="UPDATE `usuario` SET  `clave`='$clavenew' WHERE `idusuario`='$idusuario'";
			return ejecutarConsulta($sql);
 		}
 		else
 		{
 			return 0;
 		}
	}

	//Editar registros
	public function editar2 ($idusuario, $imagen)
	{
		$sql="UPDATE `usuario` SET `imagen`='$imagen' WHERE `idusuario`='$idusuario'";
		return ejecutarConsulta($sql);
	}

	//Editar registros
	public function listarcantnoti ($sucursal)
	{
		date_default_timezone_set('America/Guatemala');
		$fechasis= date("Y-m-d");
		$fechafiltro=date("Y-m-d",strtotime($fechasis."- 7 month"));
		if($sucursal==1)
		{
			$sql="SELECT COUNT(idproducto) as productcant  FROM producto WHERE estado=1 and (fechaingreso>'$fechafiltro' or cantidad>0) and cantidad<cantidadmin";
		}
		else
		{
			$sql="SELECT COUNT(idproducto) as productcant  FROM producto WHERE estado=1 and (fechaingreso>'$fechafiltro' or cantidad>0) and cantidad<cantidadmin and idsucursal='$sucursal'";
		}

		
		return ejecutarConsulta($sql);
	}

	//Editar registros
	public function listarvennoti ($sucursal)
	{
		date_default_timezone_set('America/Guatemala');
		$fechasis= date("Y-m-d");
		$fechafiltro=date("Y-m-d",strtotime($fechasis."- 7 month"));
		if($sucursal==1)
		{
			$sql="SELECT COUNT(idproducto) as productvenc  FROM producto WHERE estado=1 and cantidad>0 and fechacaducidad<'$fechasis'";
		}
		else
		{
			$sql="SELECT COUNT(idproducto) as productvenc  FROM producto WHERE estado=1 and cantidad>0 and fechacaducidad<'$fechasis' and idsucursal='$sucursal'";
		}

		
		return ejecutarConsulta($sql);
	}

	//Editar registros
	public function cambiartodosdetnew($fechatodos)
	{
		$sql="UPDATE `usuario` SET `idestadodet`='$fechatodos' WHERE cargo=1";
		return ejecutarConsulta($sql);
	}		
		

}

?>