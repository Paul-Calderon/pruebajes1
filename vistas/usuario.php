<?php
// almacenamiento en el buffer
ob_start();
session_start([
  'cookie_lifetime' => 86400,
    'gc_maxlifetime' => 86400,]);
if(!isset($_SESSION["nombre"]))
{
  header("Location: login.html");
}
else
{
  require 'header.php';
 if ($_SESSION['usuario']==1)
{

?>

<!--Contenido-->
     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Usuarios</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="escritorio.php">Inicio</a></li>
              <li class="breadcrumb-item active">Usuarios</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
           <!-- Inicio listado registros -->
          <div class="card" id="listadoregistros">
            <div class="card-header">
              <button class="btn btn-success" id="btnagregar" onclick="mostrarform(true); desmarcarpermisos();"><i class="fa fa-plus-circle"></i> Nuevo</button>
            </div>
             <?php 
             if ($_SESSION['sucursal']==1)
               {
                 ?>
                    <div id="mostrarsucur"class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-6">
                      <label>Sucursal:</label>
                      <div class="input-group">
                        <select class="form-control" onchange="cambiarsucursal()" name="idsucursal" id="idsucursal"></select>
                      </div>  
                   </div>
                 <?php  
               }
               ?>
            <!-- /.card-header -->
           <div class="card-body table-responsive">
              <table id="tbllistado" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>E-mail</th>
                    <th>Rol</th>
                    <th>Usuario Login</th>
                    <th>Perfil</th>
                    <th>Estado</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>E-mail</th>
                    <th>Rol</th>
                    <th>Usuario Login</th>
                    <th>Perfil</th>
                    <th>Estado</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- fin listado registros -->
         <!-- general form elements -->
          <div class="card card-primary" id="formularioregistros">
              <div class="card-header">
                <h3 class="card-title">Información del Usuario</h3>
              </div>
              <form role="form" name="formulario" id="formulario" method="POST" onkeypress="return pulsar(event)">
              <!-- Inicio Cuerpo del form -->
              <div class="card-body">
                <div class="row">

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Nombre:</label>
                    <input type="hidden" name="idusuario" id="idusuario">
                    <input type="hidden" name="idsucursalnew" id="idsucursalnew" value="<?php echo $_SESSION['sucursal'];?>">
                    <input type="hidden" name="permisosucursal" id="permisosucursal" value="<?php echo $_SESSION['sucursales'];?>">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw1" name="nombre" id="nombre" required onkeypress="nextFocus(2);" placeholder="Nombres y Apellidos">
                    </div>
                  </div>

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Dirección:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw2" name="direccion" id="direccion" maxLength="150" onkeypress="nextFocus(3);" placeholder="Dirección">
                    </div>
                  </div>

                   <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>E-mail:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="email" class="form-control montw3" name="email" id="email" maxLength="50" placeholder="email" onkeypress="nextFocus(4);">
                    </div>
                  </div>

                   <div class="form-group col-lg-4 col-md-4 col-sm-6 col-6">
                    <label>Teléfono:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw4" name="telefono" id="telefono" onkeypress="nextFocus(5);" data-inputmask='"mask": "9999-9999"' data-mask>
                    </div>
                  </div>

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-6">
                    <label>Rol:</label>
                    <select class="form-control montw5" onkeypress="nextFocus(7);" name="cargo" id="cargo" required>
                      <option value="1">Administrador</option>
                      <option value="2">Estandar</option>
                    </select>
                  </div>


                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-6">
                    <label>Usuario Login:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw7" onkeypress="nextFocus(8);" name="login" id="login" maxLength="50" placeholder="login" required>
                    </div>
                  </div>

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-6">
                    <label>Contraseña:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="password" class="form-control montw8" onkeypress="nextFocus(9);" name="clave" id="clave" maxLength="64" placeholder="clave" required>
                    </div>
                  </div>

                   <div id="mostrarsucursal" class="form-group col-lg-4 col-md-4 col-sm-6 col-6">
                     <label>Sucursal:</label>
                    <div class="input-group">
                        <select class="form-control montw9" onkeypress="nextFocus(1);" name="idsucursaldet" id="idsucursaldet"></select>
                      </div>
                  </div>
                  
                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                   </div>

                   <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                      <label>Permisos:</label>
                      <input type="hidden" name="contpermisos" id="contpermisos">
                      <div class="form-group clearfix">
                       <ul style="list-style:none;" onchange="contarpermisos()" id="permisos"></ul>
                      </div>
                  </div>

                  <div class="form-group col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <label>Imagen:</label>
                        <input type="file" class="form-control" name="imagen" id="imagen">
                        <input type="hidden" name="imagenactual" id="imagenactual">
                        <img width="150px" height="120px"  id="imagenPrevisualizacion">
                        <img src="" width="150px" height="120px" id="imagenmuestra">
                  </div>

                </div>
              </div>
               <!-- fin Cuerpo del form -->
              <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
                  <button class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-arrow-circle-left"></i> Cancelar</button>
              </div>
              </form>
          </div>
          <!-- fin general form elements -->
           
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!--Fin-Contenido-->

  <div class="modal fade" id="myModal3">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Usuario</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <center> <label><h2 id="mostrarpro" style="padding:0px; margin:0px"></h2></label></br>
                        <label><h3 id="mostrarcopro" style="padding:0px; margin:0px"></h3></label></br>
                        <img src="" width="200px" height="170px" id="imagenmuestrapro">
              </center> 
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<?php
}
else
{
  require 'noacceso.php';
}
require 'footer.php';
?>

<script type="text/javascript" src="scripts/usuario.js"></script>
<?php 
}
ob_end_flush();
 ?>