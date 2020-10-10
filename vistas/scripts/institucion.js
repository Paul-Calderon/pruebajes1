var tabla;
// para activar el menu
$('.institucion1').removeClass("institucion1").addClass("active");

 
//inicio de la mascara del input
$('[data-mask]').inputmask();

//inicio del tiempo de la alerta
 const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
 // fin del tiempo de la alerta

  //Initialize Select2 Elements
    $('.select2').select2()

//funcion de inicio
function init()
{
	mostrarform(false);
	listar();

	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);	
	})
}

//funcion limpiar
function limpiar()
{
	$("#idinstitucion").val("");
	$("#nombres").val("");
	$("#direccion").val("");
	$("#telefonoper").val("");
	$("#descripcion").val("");
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
function listar()
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
					url: '../ajax/institucion.php?op=listar',
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 10,//Paginación
	    "order": [[ 0, "asc" ]]//Ordenar (columna,orden)
	}).DataTable();
}
	
//funcion para guardar y editar
function guardaryeditar(e)
{
	e.preventDefault(); //No se activará la acción predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
	var formData = new FormData($("#formulario")[0]);
	$.ajax({
		url: "../ajax/institucion.php?op=guardaryeditar",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {     
	    	
	    	 if(datos==1)
	         {

		          toastr.success('Registrado con éxito');
		          mostrarform(false);
		          tabla.ajax.reload();
				  limpiar();
				  $("#btnGuardar").prop("disabled",true);
	         }
	         else
	         {
	         	$("#btnGuardar").prop("disabled",false);
	         	toastr.error('No Registrado');

	         }
	    }

	});

}

function mostrar(idinstitucion)
{
	
	$.post("../ajax/institucion.php?op=mostrar",{idinstitucion : idinstitucion}, function(data, status)
	{
		
		data = JSON.parse(data);		
		mostrarform(true);
		$("#idinstitucion").val(data.idinstitucion);
		$("#nombres").val(data.nombre);
		$("#direccion").val(data.direccion);
		$("#telefonoper").val(data.telefono);
		$("#descripcion").val(data.descripcion);
		
 	});

 
}



//Función para desactivar registros
function desactivar(idinstitucion)
{
	    swal.fire({
            title: '¿Seguro que desea eliminar la institución?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: '¡Si, eliminar!'
        }).then((result) => {
        if (result.value) {
            $.post("../ajax/institucion.php?op=desactivar", {idinstitucion : idinstitucion}, function(e){
            	e? toastr.success("Registro Eliminado"): toastr.error("Registro No Eliminado");
            	tabla.ajax.reload();
        	});
        }
    });
}


function pulsar(e) { 
    
        tecla = (document.all) ? e.keyCode :e.which; 
        return (tecla!=13); 
}


function nextFocus(num) {
	var next=num;
      if (event.keyCode == 13) {
		
       $(".montw"+next).focus();
    }
}





init();