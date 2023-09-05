<!DOCTYPE html>
<html lang="esS">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
    />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrapValidator.css" />
    <title>Ejemplos de CIBERTEC - Jorge Jacinto</title>
  </head>
   <body>
	<header>
			<div id="contenedor-nav">		
				<ul style="">
					<li style="display: inline;"><a href=""${pageContext.request.contextPath}/verAlumno">Registrar Alumno</a></li>
					<li style="display: inline;"><a
						href="${pageContext.request.contextPath}/verConcurso">Registrar Concurso</a></li>
					<li style="display: inline;"><a href="contact.asp">Registrar Jugador</a></li>
					<li style="display: inline;"><a href="about.asp">About</a></li>
				</ul>
			</div>
	</header>
   	 <div class="container">
     	 <h1 class="text-center">Registra Jugador</h1>
     	 <hr>
     	 <form class="" id="id_form" style>
     	   	 <div class="row" style="margin-top:5%">
	     	 	<div class="form-group col-sm-6">
	     	 		<div class="col-sm-3">
	     	 			<label class="control-label" for="id_nombre">Nombre</label>
	     	 		</div>
	     	 		<div class="col-sm-6">
	     	 			<input class="form-control" type="text" id="id_nombre"
	     	 			name="nombre" placeholder="Ingrese el nombre" maxlength="40"/>
	     	 		</div>
	     	 	</div>
	     	 	
   	 			<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<label class="control-label" for="id_dni">DNI</label>
					</div>

					<div class="col-sm-6">
						<input class="form-control" type="text" id="id_alias" name="dni"
							placeholder="Ingrese el dni" maxlength="8" />
					</div>
				</div>
	     	 </div>
	     	 <div class="row" style="margin-top: 2%">
				<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<label class="control-label" for="id_pais">País</label>
					</div>

					<div class="col-sm-6">
						<input class="form-control" type="text" id="id_correo"
							name="pais" placeholder="Ingrese el país" maxlength="50" />
					</div>
				</div>

				<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<label class="control-label" for="id_juego">Juego
							</label>
					</div>

					<div class="col-sm-6">
						<input class="form-control" type="text" id="id_juego"
							name="juego" placeholder="Ingrese juego en el que compite"
							maxlength="100" />
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-top: 2%">
				<div class="form-group col-sm-6">
					<div class="col-sm-3">
						<label class="control-label" for="id_experiencia">Experiencia
							</label>
					</div>

					<div class="col-sm-6">
						<input class="form-control" type="text" id="id_experiencia"
							name="experiencia" placeholder="Ingrese tiempo de experiencia"
							maxlength="10" min="1" max="50" />
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 5%">
				<button id="id_registrar" type="button" class="btn btn-primary">
					Crear Jugador</button>
			</div>
	     	 
     	 </form>
			
      
   		</div> 
   		
   		<script type="text/javascript">
   			$("#id_registrar").click(function(){
   				var validator=$('#id_form').data('bootstrapValidator');
   				validator.validate();
   				
   				if(validator.isValid){
   					$.ajax({
   						type:"POST",
   	   					url:"registraJugador",
   	   					data:$('#id_form').serializa(),
   	   					success:function(data){
   	   						mostrarMensaje(data.MENSAJE);
   	   						limpiar();
   	   					},
   	   					error:function(){
   	   						mostrarMensaje(data.MSG_ERROR);
   	   					}
   	   					
   					});	
   				}
   			});
   			
   			function limpiar(){
   				$("id_nombre").val("");
   				$("id_alias").val("");
   				$("id_pais").val("");
   				$("id_juego").val("");
   				$("id_experiencia").val("");
   			}
   			
   			$(document).ready(function(){
   				$("#id_form").bootstrapValidator({
   					message:"This value is not valid",
   					feedbackIcons:{
   						valid : "glyphicon glyphicon-ok",
   						invalid : "glyphicon glyphicon-remove",
   						validating : "glyphicon glyphicon-refresh",
   					},
   					fields : {
   						nombre : {
   							selector : "#id_nombre",
   							validators : {
   								notEmpty : {
   									message : "El nombre es obligatorio",
   								},
   								stringLength : {
   									min : 3,
   									max : 40,
   									message : "El nombre es de 3 a 40 caracteres",
   								},
   							},
   						},
   						alias : {
   							selector : "#id_alias",
   							validators : {
   								notEmpty : {
   									message : "El alias es obligatorio",
   								},
   							
   							},
   						},
   						pais : {
   							selector : "#id_pais",
   							validators : {
   								notEmpty : {
   									message : "El pais es obligatorio",
   								},
   							
   							},
   						},
   						pais : {juego
   							selector : "#id_juego",
   							validators : {
   								notEmpty : {
   									message : "El juego es obligatorio",
   								},
   							
   							},
   						},
   						experiencia : {
   							selector : "#id_experiencia",
   							validators : {
   								notEmpty : {
   									message : "La experiencia es obligatoria",
   								},
   								regexp : {
   									regexp : /^[0-9]$/,
   									message : "el tiempo de experiencia es obligatorio",
   								},
   							},
   						},
   				});
   			});
   		
   		
   		</script>
   		<style>
		header{width:100%;background-color:black;
		
		}
		
		#contenedor-nav{
		background-color:red;
		}
		ul {
			width:100%;
			list-style-type: none;
			margin: auto;
			padding: 1.5%;
			overflow: hidden;
		}
		
		li {
			float: left;
			font-size:25px;
		}
		
		li a {
			display: block;
			padding: 8px;
			background-color: #dddddd;
		}
</style>
  	</body>
</html>
