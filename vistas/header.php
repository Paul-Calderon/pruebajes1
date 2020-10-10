<?php 
 if(strlen(session_id())<1)
  session_start([
  'cookie_lifetime' => 86400,
    'gc_maxlifetime' => 86400,]);
 ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DAWE SYSTEMS</title>
  <link rel="shortcut icon" href="../public/images/ico/Dawe.ico">
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../public/fontawesome-free/css/all.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="../public/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../public/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../public/jqvmap/jqvmap.min.css">
   <!-- DataTables -->
  <link rel="stylesheet" href="../public/datatables-bs4/css/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="../public/datatables-buttons/css/buttons.dataTables.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../public/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../public/select2/css/select2.min.css"> 
  <link rel="stylesheet" href="../public/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../public/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../public/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../public/daterangepicker/daterangepicker.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../public/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../public/summernote/summernote-bs4.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="../public/toastr/toastr.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="../public/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
 

 </head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
     <li class="nav-item dropdown">
          <a class="nav-link" href="../ajax/usuario.php?op=salir"><i class="fas fa-key"></i> Cerrar Sesión</a>
     </li>
    
    
      <li class="nav-item">
        <a class="nav-link" onclick="limpiarusers()" data-toggle="modal" href="#myModalw"><i class="fas fa-user-cog"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <center>
      <span class="brand-text font-weight-light">JES</span>
    </center>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image" data-toggle="modal" href="#myModalw2">
          <img src="../files/usuario/<?php echo $_SESSION['imagen']; ?>" style="cursor:pointer;" title="Editar Imagen"class="img-circle elevation-2" onclick="limpiarusers()" alt="User Image">
        </div>
        <div class="info" data-toggle="modal" href="#myModalw2" onclick="limpiarusers()">
          <a href="#" class="d-block"><?php echo $_SESSION['nombre']; ?></a>
        </div>
      </div>
     

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <?php 

          if($_SESSION['instituciones']==1)
            {
                echo '<li class="nav-item">
                        <a href="institucion.php" class="nav-link institucion1">
                          <i class="nav-icon fas fa-braille"></i>
                          <p>Institución</p>
                        </a>
                    </li>';
            }
            ?>

             <?php 
          //aceso en Ajax es usuario.php linea 153  
           

              if($_SESSION['usuario']==1)
                {


                  echo '<li class="nav-item has-treeview">
                          <a href="#" class="nav-link usuario1">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                              Usuarios
                              <i class="right fas fa-angle-left "></i>
                            </p>
                          </a>
                          <ul class="nav nav-treeview">
                            <li class="nav-item">
                              <a href="usuario.php" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Usuarios</p>
                              </a>
                            </li>
                              </ul>
                        </li>';
                }

          
             ?>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
 </aside>

         <!-- Inicio modal -->
      <div class="modal fade" id="myModalw">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Configuración de Usuario</h4>
              <button type="button" class="close" data-dismiss="modal" onclick="limpiarusers()" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <!-- Inicio cuerpo modal -->
            <form role="form" name="formulariowww" id="formulariowww" method="POST">
            <div class="modal-body">
              <div class="row">
                   <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <label>Usuario Login:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input readonly type="text" class="form-control" name="loginusers" id="loginusers" value="<?php echo $_SESSION['login']; ?>">
                    </div>
                  </div>

                  <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <label>Contraseña Actual:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-edit"></i></span>
                      </div>
                      <input type="password" class="form-control usersig1" onkeypress="nextFocususer(2);" name="claveusers" id="claveusers" maxLength="64" placeholder="clave" required>
                    </div>
                  </div>

                  <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <label>Nueva Contraseña:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <button type="button" class="btn btn-default" onclick="mostrarpaswword()"><i class="fas fa-eye"></i></button>
                      </div>
                      <input type="password" class="form-control usersig2"  onkeypress="nextFocususer(3);" name="clavenew" id="clavenew" maxLength="64" placeholder="clave" required>
                    </div>
                  </div>

                  <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <label>Confirmar Contraseña:</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <button type="button" class="btn btn-default" onclick="mostrarpaswword()"><i class="fas fa-eye"></i></button>
                      </div>
                      <input type="password" class="form-control usersig3" onkeypress="nextFocususer(1);" name="claveconfirm" id="claveconfirm" maxLength="64" placeholder="clave" required>
                    </div>
                  </div>

              </div>  
            </div>
            </form>
             <!-- fin cuerpo modal -->
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" onclick="limpiarusers()" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="guardarconfiguser()" id="btnGuardardetcurso"><i class="fa fa-save"></i> Guardar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- fin modal -->

              <!-- Inicio modal -->
      <div class="modal fade" id="myModalw2">
        <div class="modal-dialog modal-lg" >
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar Imagen</h4>
              <button type="button" class="close" data-dismiss="modal" onclick="limpiarusers()" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <!-- Inicio cuerpo modal -->
            <form role="form" name="formulariowww2" id="formulariowww2" method="POST">
            <div class="modal-body">
              <div class="row">
                   

                   <div class="form-group col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <label>Imagen:</label>
                        <input type="file" class="form-control" name="imagenusers" id="imagenusers">
                        <input type="hidden" name="imagenactualusers" id="imagenactualusers">
                        <img width="150px" height="120px"  id="imagenPrevisualizacionusers">
                        <img src="../files/usuario/<?php echo $_SESSION['imagen']; ?>" width="150px" height="120px" id="imagenmuestrausers">
                  </div>

                  
              </div>  
            </div>
            </form>
             <!-- fin cuerpo modal -->
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" onclick="limpiarusers()" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="guardarconfiguser2()" id="btnGuardardetcurso"><i class="fa fa-save"></i> Guardar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- fin modal -->


              <!-- inicio modal --> 
  <div class="modal fade" id="myModal333">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-danger">
              <h4 class="modal-title bg-danger">Alerta de Cobro</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <center> <label><h3 id="mostrarpro333" style="padding:0px; margin:0px">Estimado Usurio:</h3></label></br>
                        <img src="../public/images/Dawelogo.png" width="200px" height="170px" id="imagenmuestrapro333"></br>
                        <label>Este es un recordatorio que el host del sistema vencerá el <label id="fechacad333"></label>, por lo cual deberá cancelar antes de la fecha indicada, comuníquese con el proveedor del sistema.</label>
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


             <!-- inicio modal --> 
  <div class="modal fade" id="myModal334">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-danger">
              <h4 class="modal-title bg-danger">Alerta de Cobro</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <center> <label><h3 id="mostrarpro334" style="padding:0px; margin:0px">Estimado Usurio:</h3></label></br>
                        <img src="../public/images/Dawelogo.png" width="200px" height="170px" id="imagenmuestrapro334"></br>
                        <label>El host del sistema ha vencido porfavor comuniquese con su proveedor del sistema.</label>
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