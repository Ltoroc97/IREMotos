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
	<link rel="stylesheet" type="text/css" href="../Assets/Css/RecuperarContrasena.css">
</head>

<style type="text/css">
	

html,body{
background-image: url('../Assets/Image/background_moto.jpeg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

</style>

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

							<div class="form-group ">
								<input type="submit" value="Recuperar Contraseña" class="btn login_btn boton_formulario_ingreso">
							</div>
						</form>

						<br>

											
							<div class="d-flex justify-content-center links">
								<a href="../View/InicioSesion.php">
									<p class="btn-group-lg">Cancelar</p>
								</a>
							</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>