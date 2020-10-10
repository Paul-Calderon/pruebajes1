<?php 
require "../config/Conexion.php";

Class Permiso
{
	//implementar nuestro constructor
	public function __construct()
	{

	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT * FROM permiso where estado=1";
		return ejecutarConsulta($sql);		
	}
	

}

?>