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
				<li style="display: inline;"><a href="${pageContext.request.contextPath}/verAlumno">Registrar Alumno</a></li>
				<li style="display: inline;"><a
					href="${pageContext.request.contextPath}/verConcurso">Registrar Concurso</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath}/verJugador">Registrar Jugador</a></li>
				<li style="display: inline;"><a href="about.asp">About</a></li>
			</ul>
		</div>
	</header>
    <div class="container">
      <h1>Registra Concurso</h1>

      <form id="id_form">
        <div class="row" style="margin-top: 5%">
          <div class="form-group col-sm-6">
            <div class="col-sm-3" style="margin-top: 2%">
              <label class="control-label" for="id_nombre">Nombre</label>
            </div>

            <div class="col-sm-6">
              <input
                class="form-control"
                type="text"
                id="id_nombre"
                name="nombre"
                placeholder="Ingrese el nombre"
                maxlength="40"
              />
            </div>
          </div>

          <div class="form-group col-sm-6">
            <div class="col-sm-4" style="margin-top: 2%">
              <label for="id_fechainicio" class="control-label">Fecha de Inicio</label>
            </div>
            
            <div class="col-sm-6">
	            <input
	              type="date"
	              class="form-control"
	              id="id_fechainicio"
	              name="fechaInicio"
	              placeholder="Ingrese la fecha de Inicio"
	            />
            </div>
          </div>
	</div>
	
          <!--FECHA FIN-->
       	<div class="row" style="margin-top: 2%">
	          <div class="form-group col-sm-6"  style="margin-top: 3%">
		            <div class="col-sm-3" style="margin-top: 2%">
		              <label  class="control-label" for="id_fechafin">Fecha Fin</label>
		            </div>
		             <div class="col-sm-6">
			            <input
			              type="date"
			              class="form-control"
			              id="id_fechafin"
			              name="fechaFin"
			              placeholder="Ingrese la fecha de Fin"
			            />
		            </div>
	          </div>
           </div>	
          <div class="row" style="margin-top:5%">
            <button id="id_registrar" type="button" class="btn btn-primary">Crear Concurso</button>
          </div>
       
      </form>
    </div>
    
        <script type="text/javascript">
        $("#id_registrar").click(function (){ 

        	//Lanza la validacion
        	var validator = $('#id_form').data('bootstrapValidator');
            validator.validate();
            
            //Pregunta si es valido el formulario(Si no tiene errores)
        	if (validator.isValid()){
        		$.ajax({
            		type: "POST",
                    url: "registraConcurso", 
                    data: $('#id_form').serialize(),
                    success: function(data){
                    	mostrarMensaje(data.MENSAJE);
                    },
                    error: function(){
                    	mostrarMensaje(data.MSG_ERROR);
                    }
            	});
        	}   
            	
        	
        });

          function limpiar() {
            $("#id_nombre").val("");
            $("#id_fechainicio").val("");
            $("#id_fechafin").val("");
          
          }

          $(document).ready(function () {
            $("#id_form").bootstrapValidator({
              message: "This value is not valid",
              feedbackIcons: {
                valid: "glyphicon glyphicon-ok",
                invalid: "glyphicon glyphicon-remove",
                validating: "glyphicon glyphicon-refresh",
              },
              fields: {
                nombre: {
                  selector: "#id_nombre",
                  validators: {
                    notEmpty: {
                      message: "El nombre es obligatorio",
                    },
                    stringLength: {
                      min: 3,
                      max: 40,
                      message: "El nombre es de 3 a 40 caracteres",
                    },
                  },
                },
                fechaInicio: {
                  selector: "#id_fechainicio",
                  validators: {
                    notEmpty: {
                      message: "La fecha de inicio es obligatorio",
                    },
                  },
                },
                fechaFin: {
                    selector: "#id_fechafin",
                    validators: {
                      notEmpty: {
                        message: "La fecha de Fin es obligatorio",
                      },
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
