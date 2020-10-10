<?php 
require "../config/Conexion.php";

Class Institucion
{
	//implementar nuestro constructor
	public function __construct()
	{

	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT * FROM institucion where estado=1 order by nombre asc";
		return ejecutarConsulta($sql);		
		
	}

	
	//eleminar registros o desactivar
	public function desactivar($idinstitucion)
	{
		
		$sql="UPDATE `institucion` SET  `estado`='0' WHERE `idinstitucion`='$idinstitucion'";
		return ejecutarConsulta($sql);
	}

	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idinstitucion)
	{
		$sql="SELECT * FROM institucion  WHERE idinstitucion='$idinstitucion'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Insertar registros
	public function insertar ($nombres, $direccion, $telefonoper, $descripcion)
	{
		$sql="INSERT INTO `institucion`(`descripcion`, `nombre`, `direccion`, `telefono`, `estado`) VALUES ('$descripcion', '$nombres', '$direccion', '$telefonoper', 1)";
		return ejecutarConsulta($sql);
		

	}

	//Editar registros
	public function editar ($idinstitucion, $nombres, $direccion, $telefonoper, $descripcion)
	{
		$sql="UPDATE `institucion` SET `nombre`='$nombres',`direccion`='$direccion',`telefono`='$telefonoper', descripcion='$descripcion' WHERE `idinstitucion`='$idinstitucion'";
		return ejecutarConsulta($sql);
	}
	

	

	
}

?>