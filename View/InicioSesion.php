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
	<link rel="stylesheet" type="text/css" href="../Assets/Css/InicioSesion.css">
</head>


<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">

		<div class="card">
			
			<div>
				<img class="logo_formulario" src="../Assets/Image/irelogo.png"></img>
			</div>
			<div class="card-body card_formulario">
				<form>

					<div class="input-group form-group">
						<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="Número de Documento">
					</div>

					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="Contraseña">
					</div>
					
					<div class="form-group ">
						<input type="submit" value="Ingresar" class="btn login_btn boton_formulario_ingreso">
					</div>
				</form>
			</div>

			<div class="card-footer">
				<a href="../View/RegistroUsuario.php">
					<div class="d-flex justify-content-center links">
						<p><u>REGISTRARME</u></p>
					</div>
				</a>


			<div class="p">
				<div class="d-flex justify-content-center">
					<a href="../View/RecuperarContrasena.php">
						<p>¿Olvidaste tu contraseña?</p>
					</a>
				</div>
			</div>

			</div>
		</div>
	</div>
</div>
</body>
</html>