

function guardarconfiguser() { 
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
    var clavenew= document.getElementById("clavenew").value;
    var claveconfirm = document.getElementById("claveconfirm").value;
    if(clavenew==claveconfirm && clavenew!="")
    {
    	var formData = new FormData($("#formulariowww")[0]);
		$.ajax({
			url: "../ajax/escritorio.php?op=guardaryeditarusers",
		    type: "POST",
		    data: formData,
		    contentType: false,
		    processData: false,

		    success: function(datos)
		    {     

		    	 if(datos==1)
		         {

		          	limpiarusers();
				//	window.location="login.html";
		          	toastr.success('Configuración Realizada');

				}
		        else
		        {
		         	toastr.error('Configuración No Realizada');

		        } 
		    }

		});
    }
    else
    {
    	toastr.error("Las Contraseñas no coinciden");
    }

}

function guardarconfiguser2() { 
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
    
    var formData = new FormData($("#formulariowww2")[0]);
		$.ajax({
			url: "../ajax/escritorio.php?op=guardaryeditarusers2",
		    type: "POST",
		    data: formData,
		    contentType: false,
		    processData: false,

		    success: function(datos)
		    {     
		    	
		    	 if(datos==1)
		         {

		          	limpiarusers();
					toastr.success('Configuración Realizada');
					window.location="login.html";
				}
		        else
		        {
		         	toastr.error('Configuración No Realizada');

		        } 
		    }

		});
    

}

function limpiarusers()
{
	$("#claveusers").val("");
	$("#clavenew").val("");
	$("#claveconfirm").val("");
	$("#imagenactualusers").val("");
	$("#imagenusers").val("");
	$("#imagenPrevisualizacionusers").hide();
	$("#imagenmuestrausers").show();
	var x = document.getElementById("clavenew");
  	var y = document.getElementById("claveconfirm");
  	x.type = "password";
    y.type = "password";
    $('.fa-eye-slash').removeClass("fa-eye-slash").addClass("fa-eye");
    setTimeout(function(){$(".usersig1").focus(); }, 500);
}

function nextFocususer(num) {
	var next=num;
      if (event.keyCode == 13) {
		
       $(".usersig"+next).focus();
    }
}

calcularnotificaciones();

function calcularnotificaciones() 
{
  $(".filas2").remove();            //listardetcursos
  $.post('../ajax/escritorio.php?op=listarcantnoti',function(r){
         setTimeout(function(){$("#notificacionescant").html(r);}, 300); 
  });
}

function totaldetnoti(total)
{
  $("#cantnotifac").html(new Intl.NumberFormat("en-US", {minimumFractionDigits: 0}).format(total));
  $("#alertcantnotifac").html(new Intl.NumberFormat("en-US", {minimumFractionDigits: 0}).format(total)+" Notificaciones");
  $("#cantnotifac2").html(new Intl.NumberFormat("en-US", {minimumFractionDigits: 0}).format(total));
}


function mostrarpaswword() 
{
  var x = document.getElementById("clavenew");
  var y = document.getElementById("claveconfirm");
  if (x.type === "password") {
    x.type = "text";
    y.type = "text";
    $('.fa-eye').removeClass("fa-eye").addClass("fa-eye-slash");

  } else {
    x.type = "password";
    y.type = "password";
    $('.fa-eye-slash').removeClass("fa-eye-slash").addClass("fa-eye");
  }

  
}

buscardatosdetw();
function buscardatosdetw()
{
    $.post('../ajax/escritorio.php?op=buscardatosdetw',function(r){
      r=r.split("|");
      if(parseFloat(r[0])<=4 && parseFloat(r[0])>=1)
      {
        $('#myModal333').modal('show');
        $("#fechacad333").html(r[1]);
      }
      else if (parseFloat(r[0])<0)
      {
        $('#myModal334').modal('show');
      }
      else
      {
        
      }

    });
}

$("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });


//inicio para mostrar imagenes cuando se suben
const $seleccionArchivos34 = document.querySelector("#imagenusers"),
  $imagenPrevisualizacion34 = document.querySelector("#imagenPrevisualizacionusers");

// Escuchar cuando cambie
$seleccionArchivos34.addEventListener("change", () => {
	$("#imagenPrevisualizacionusers").show();
	$("#imagenmuestrausers").hide();
  // Los archivos seleccionados, pueden ser muchos o uno
  const archivos34 = $seleccionArchivos34.files;
  // Si no hay archivos salimos de la función y quitamos la imagen
  if (!archivos34 || !archivos34.length) {
    $imagenPrevisualizacion34.src = "";
    return;
  }
  // Ahora tomamos el primer archivo, el cual vamos a previsualizar
  const primerArchivo34 = archivos34[0];
  // Lo convertimos a un objeto de tipo objectURL
  const objectURL34 = URL.createObjectURL(primerArchivo34);
  // Y a la fuente de la imagen le ponemos el objectURL
  $imagenPrevisualizacion34.src = objectURL34;
});

//final para mostrar imagenes cuando se suben

