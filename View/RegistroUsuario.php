<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>IRE MOTOS</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="../Assets/Css/RegistroUsuario.css">
</head>
<body>

	<div class="container">

		<div class="d-flex justify-content-center h-100">

			<div class="card">

						<div>
							<img class="logo_formulario" src="../Assets/Image/irelogo.png"></img>
						</div>

						<!--<div class="MensajeRegistro">
							Conocerte hace que podamos trabajar mejor.<br> Estamos felices de que seas un usuario más de IRE Motos. Llena tus datos. <br>Tenemos agradables sorpresas para ti.</br>
						</div>-->


						<div class="FormularioRegistro">

							<form action="registration.php" method="post">
															
									<div class="row">
										<div class="col-md-7">

											<label for="Nombres"><b>Nombres *</b></label>
												<input onblur="envio_nombre()" id="Nombres" class="form-control" id="Nombres" type="text" name="Nombres" required>

											<label for="Apellidos"><b>Apellidos *</b></label>
												<input class="form-control" id="Apellidos"  type="text" name="Apellidos" required>

											<label for="email"><b>Tipo de Documento *</b></label>
												<input class="form-control selected-option" id="TipoDocumento"  type="che" name="TipoDocumento" required>

											<label for="NumeroDocumento"><b>Número de Documento</b></label>
												<input class="form-control" id="NumeroDocumento"  type="text" name="NumeroDocumento" required>


											<label for="Direccion"><b>Dirección</b></label>
												<input class="form-control" id="Direccion"  type="text" name="Direccion" >

											<label for="Telefono"><b>Télefono</b></label>
												<input class="form-control" id="Telefono"  type="text" name="Telefono" required>

											<label for="Correo"><b>Correo Eléctronico *</b></label>
												<input class="form-control" id="Correo"  type="email" name="Correo" required>

											<label for="Contrasena"><b>Contraseña *</b></label>
												<input class="form-control" id="Contrasena"  type="text" name="Contrasena" required>

										</div>
									</div>
							</form> 

						</div>
						<div class="form-footer">
				                 <button type="submit" class="btn btn-outline-warning">
				                 	<span class="glyphicon glyphicon-log-in"></span> REGISTRARME
				                 </button>
           					</div>
					</div>
			</div>
		</div>
	</div>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

</body>
</html>