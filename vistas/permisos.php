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
            <h1>Permisos</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="escritorio.php">Inicio</a></li>
              <li class="breadcrumb-item active">Permisos</li>
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
             </div>
          
            <!-- /.card-header -->
           <div class="card-body table-responsive">
              <table id="tbllistado" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Nombre</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                     <th>Nombre</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- fin listado registros -->
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

<script type="text/javascript" src="scripts/permisos.js"></script>
<?php 
}
ob_end_flush();
 ?>