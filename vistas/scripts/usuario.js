var tabla;
// para activar el menu
$('.usuario1').removeClass("usuario1").addClass("active");
//inicio de la mascara del input
$('[data-mask]').inputmask();
// fin de la mascara
//inicio del tiempo de la alerta
 const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
 // fin del tiempo de la alerta
//funcion de inicio
function init()
{
	mostrarform(false);
	listar("a");
	selectiposursal();
	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);	
	})

	
	//mostrar los permisos
	$.post("../ajax/usuario.php?op=permisos&id=", function(r){
			$("#permisos").html(r);
	});
}




function cambiarsucursal()
{
	var idsucursal=document.getElementById("idsucursal").value;
	listar(idsucursal);
}

function selectiposursal()
{
                  //selectjornada
    $.post("../ajax/sucursalselect.php?op=selectiposursal", function(r){
                $("#idsucursal").html(r);
                $("#idsucursaldet").html(r);

    });
}

//funcion limpiar
function limpiar()
{
	$("#idusuario").val("");
	$("#nombre").val("");
	$("#direccion").val("");
	$("#telefono").val("");
	$("#email").val("");
	$("#cargo").val("");
	$("#login").val("");
	$("#clave").val("");
	$("#contpermisos").val("");
	$("#imagenmuestra").attr("src","");
	$("#imagenactual").val("");
	$("#imagen").val("");
	$('#permisos').prop('checked', false);
	$("#imagenPrevisualizacion").hide();
	$("#imagenmuestra").hide();
	var idsucursalnew=document.getElementById("idsucursalnew").value;
    setTimeout(function(){$("#idsucursaldet").val(idsucursalnew); }, 500);
	var permisosucursal=document.getElementById("permisosucursal").value;
    if(permisosucursal==1)
    {
    	$("#mostrarsucursal").show();
    }
    else
    {
    	$("#mostrarsucursal").hide();
    }
}


function desmarcarpermisos()
{
	for (i=0;i<document.formulario.elements.length;i++)
      if(document.formulario.elements[i].type == "checkbox")
         document.formulario.elements[i].checked=0
}

//funcion para validar que haya permisos
function contarpermisos()
{
var contpermisos=document.getElementById("contpermisos").value;
contpermisos=parseFloat(contpermisos+1);
$("#contpermisos").val(contpermisos);
}	

// funcion mostrar formulario
function mostrarform(flag)
{
	

	limpiar();
	if(flag)
	{
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		$("#btnGuardar").prop("disabled", false);
		setTimeout(function(){$(".montw1").focus(); }, 500);
	}
	else
	{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		
	}
}

// funcion cancelar form
function cancelarform()
{
	limpiar();
	mostrarform(false);
}

//funcion listar
function listar(idsucursal)
{

	tabla=$('#tbllistado').dataTable(
	{
		
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	   // dom: 'Bfrtpl',//Definimos los elementos del control de tabla
	   	dom:'Bfrtpl',
	    buttons: [		          
		            'excelHtml5',
		            'csvHtml5',
		            'pdf'

		        ],
		"ajax":
				{
					url: '../ajax/usuario.php?op=listar&idsucursal='+idsucursal,
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 10,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();

	
}

	
//funcion para guardar y editar
function guardaryeditar(e)
{
	e.preventDefault(); //No se activará la acción predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
	var formData = new FormData($("#formulario")[0]);
	$.ajax({
		url: "../ajax/usuario.php?op=guardaryeditar",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {     
	    	
	         if(datos==1)
	         {

	          toastr.success('Usuario Registrado');
	          mostrarform(false);
	          tabla.ajax.reload();
			  limpiar();
			$("#btnGuardar").prop("disabled",true);
	         }
	         else
	         {
	         	$("#btnGuardar").prop("disabled",false);
	         	toastr.error(datos);

	         } 
	    }

	});

}

function mostrar(idusuario)
{
	
	$.post("../ajax/usuario.php?op=mostrar",{idusuario : idusuario}, function(data, status)
	{
		
		data = JSON.parse(data);		
		mostrarform(true);
		$("#nombre").val(data.nombre);
		$("#direccion").val(data.direccion);
		$("#telefono").val(data.telefono);
		$("#email").val(data.email);
		$("#login").val(data.login);
		$("#clave").val(data.clave);
		$("#imagenmuestra").show();
		$("#imagenmuestra").attr("src","../files/usuario/"+data.imagen);
		$("#imagenactual").val(data.imagen);
		$("#idusuario").val(data.idusuario);
		$("#cargo").val(data.cargo);
		$("#idsucursaldet").val(data.idsucursal);
		


 	});

 	$.post("../ajax/usuario.php?op=permisos&id="+idusuario, function(r){
			$("#permisos").html(r);
	});
}

function amplearima(idusuario)
{
	
	$.post("../ajax/usuario.php?op=mostrar",{idusuario : idusuario}, function(data, status)
	{
		$("#mostrarpro").html("");
		$("#mostrarcopro").html("");
		$('#myModal3').modal('show');
		data = JSON.parse(data);
		$("#mostrarpro").html(data.nombre);
		$("#mostrarcopro").html(data.login);
		$("#imagenmuestrapro").attr("src","../files/usuario/"+data.imagen);
 	})
}


//Función para desactivar registros
function desactivar(idusuario)
{
	    swal.fire({
            title: '¿Seguro que desea eliminar el registro?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: '¡Si, eliminar!'
        }).then((result) => {
        if (result.value) {
            $.post("../ajax/usuario.php?op=desactivar", {idusuario : idusuario}, function(e){
        		toastr.success(e);
	            tabla.ajax.reload();
        	});
        }
    });
}

//Función para activar registros
function activar(idusuario)
{
	bootbox.confirm("¿Está Seguro de activar  el usuario?", function(result){
		if(result)
        {
        	$.post("../ajax/usuario.php?op=activar", {idusuario : idusuario}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});	
        }
	})
}

function nextFocus(num) {
	var next=num;
      if (event.keyCode == 13) {
		
       $(".montw"+next).focus();
    }
}

function pulsar(e) { 
    
        tecla = (document.all) ? e.keyCode :e.which; 
        return (tecla!=13); 
}

//inicio para mostrar imagenes cuando se suben
const $seleccionArchivos = document.querySelector("#imagen"),
  $imagenPrevisualizacion = document.querySelector("#imagenPrevisualizacion");

// Escuchar cuando cambie
$seleccionArchivos.addEventListener("change", () => {
	$("#imagenPrevisualizacion").show();
	$("#imagenmuestra").hide();
  // Los archivos seleccionados, pueden ser muchos o uno
  const archivos = $seleccionArchivos.files;
  // Si no hay archivos salimos de la función y quitamos la imagen
  if (!archivos || !archivos.length) {
    $imagenPrevisualizacion.src = "";
    return;
  }
  // Ahora tomamos el primer archivo, el cual vamos a previsualizar
  const primerArchivo = archivos[0];
  // Lo convertimos a un objeto de tipo objectURL
  const objectURL = URL.createObjectURL(primerArchivo);
  // Y a la fuente de la imagen le ponemos el objectURL
  $imagenPrevisualizacion.src = objectURL;
});

//final para mostrar imagenes cuando se suben

init();