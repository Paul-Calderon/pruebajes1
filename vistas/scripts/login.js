//Función que se ejecuta al inicio

//inicio del tiempo de la alerta
 const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
 // fin del tiempo de la alerta

function init(){
		
}

$("#frmAcceso").on('submit', function (e)
{
	e.preventDefault();
	logina=$("#logina").val();
	clavea=$("#clavea").val();
	permisos=2;

	if ($('#permisos').prop('checked') ) {
    permisos=1;
	}

	$.post("../ajax/usuario.php?op=verificar", {"logina":logina, "clavea":clavea, "permisos":permisos}, function(data)
	{
		if(data!="null")
		{
			$.post('../ajax/escritorio.php?op=buscardatosnewdet',function(r){
    			
    		});

			$(location).attr("href","institucion.php")
		}
		else
		{
			toastr.error("Datos incorrectos");
		}
	});
})


init();