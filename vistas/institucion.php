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
 if ($_SESSION['instituciones']==1)
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
            <h1>Institución</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="escritorio.php">Inicio</a></li>
              <li class="breadcrumb-item active">Institución</li>
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
              <button class="btn btn-success" id="btnagregar" onclick="mostrarform(true);"><i class="fa fa-plus-circle"></i> Nuevo</button>
            </div>
          
            <!-- /.card-header -->
           <div class="card-body table-responsive">
              <table id="tbllistado" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Dirección </th>
                    <th>Telefono</th>
                    <th>Estado</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                    <th>Opciones</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Dirección </th>
                    <th>Telefono</th>
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
                <h3 class="card-title">Información de la Institución</h3>
              </div>
              <form role="form" name="formulario" id="formulario" method="POST" onkeypress="return pulsar(event)">
              <!-- Inicio Cuerpo del form -->
              <div class="card-body">
                <div class="row">

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Nombre:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="hidden" name="idinstitucion" id="idinstitucion">
                      <input type="text" class="form-control montw1" onkeypress="nextFocus(2);" name="nombres" id="nombres" required placeholder="Nombre institución">
                    </div>
                  </div>

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Descripción:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw2"  onkeypress="nextFocus(3);" name="descripcion" id="descripcion" maxLength="150"  placeholder="Detalle de la Institución">
                    </div>
                  </div>
                  
                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Dirección:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw3"  onkeypress="nextFocus(4);" name="direccion" id="direccion" maxLength="150"  placeholder="Dirección">
                    </div>
                  </div>

                  <div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-6">
                    <label>Teléfono:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="text" class="form-control montw4" onkeypress="nextFocus(1);" name="telefonoper" id="telefonoper" data-inputmask='"mask": "9999-9999"' data-mask>
                    </div>
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

<?php
}
else
{
  require 'noacceso.php';
}
require 'footer.php';
?>

<script type="text/javascript" src="scripts/institucion.js"></script>
<?php 
}
ob_end_flush();
 ?>