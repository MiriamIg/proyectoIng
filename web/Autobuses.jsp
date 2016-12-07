<%-- 
    Document   : Autobuses
    Created on : 25/11/2016, 12:41:48 AM
    Author     : Miriam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet"  href="css/mio.css"/>
        
         <!--ESTILO -->
          <link rel="stylesheet" href="plantilla/css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="plantilla/css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="plantilla/css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="plantilla/js/jquery-1.6.js" ></script>
		<script type="text/javascript" src="plantilla/js/cufon-yui.js"></script>
		<script type="text/javascript" src="plantilla/js/cufon-replace.js"></script>  
		<script type="text/javascript" src="plantilla/js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="plantilla/js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="plantilla/js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="plantilla/js/tms-0.3.js"></script>
		<script type="text/javascript" src="plantilla/js/tms_presets.js"></script>
		<script type="text/javascript" src="plantilla/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="plantilla/js/atooltip.jquery.js"></script>
        
        
        
        <title>Admin Rutas</title>
        
        <script>
        $(document).ready(function (e) {
            
            $("#guardaBuses").click(function(){            
                console.log('GuardarBus');
                $.ajax({
                        url: 'ServletGuardaBus',  
                        type: 'post',
                        data: {
                            matriculaBus:$("#matriculaBus").val(),
                            idConductor:$("#idConductor").val(),
                            modelo:     $("#modelo").val(),
                            capacidad:  $("#capacidad").val()
                        },
                        success: function (datos) {
                            $("#resultado").html(datos);
                            alert(datos);
                        },
                        failure: function () {
                            alert("algo muy malo paso");
                        }

                    });
            });
            $("#buscaBuses").click(function(){
                console.log("buscaBuses");
                    $.ajax({   
                        dataType: "json",  
                        url: "ServletBuscarBuses",
                        success: function (datos) {  //datos ahi se deposita todo el json 
                            
                            $("#mis-buses").html("");   //length dice cuantos elemntos tiene
                            $.each(datos, function (key, val) {
                              $("#mis-buses").append("<tr class='info'>")
                              $("#mis-buses").append("<td>"+ val.matriculaBus + "</td>"+
                                                     "<td>" +val.idConductor+ "</td>"+
                                                     "<td>" +val.modelo + "</td>"+
                                                     "<td>" +val.capacidad + "</td>"
                                                     )
                              $("#mis-buses").append("</tr>")
                            });
                            
                            
                        }
                    });
                });
                
                $("#accionAct").click(function(){
                    console.log('actualiza bus');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type:"post",
                        url: "ServletActualizarBuses",
                        data: {
                            matricula     : $("#matricula").val(),
                            modeloAct     : $("#modeloAct").val()   
                        },
                        success: function (datos) {
                            $("#resultado").html(datos);
                            alert(datos);
                        },
                        failure: function () {
                            alert("algo muy malo paso");
                        }
                    });
                });
                
                $("#accionElim").click(function(){
                    console.log('elimina bus');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletEliminarBuses",
                        data: {
                            idBusElim: $("#idBusElim").val()
                        },
                        success: function (datos) {
                            $("#resultado").html(datos);
                            alert(datos);
                        },
                        failure: function () {
                            alert("algo muy malo paso");
                        }
                    });
                });
  
     });
       
        </script>
            
        
    </head>

    <body>
                   <!--header -->
			<header>
				<div class="wrapper">
					<h1><a href="index.html" id="logo">Superior.com</a></h1>
					<form id="search" method="post">
						<fieldset>
							<div class="bg"><input class="input" type="text" value="Search"  onblur="if(this.value=='') this.value='Search'" onFocus="if(this.value =='Search' ) this.value=''" ></div>
						</fieldset>
					</form>
				</div>
				<nav>
					<ul id="menu">
                                            <li ><a href="index.html"><span>Principal</span></a></li>
                                            <li ><a href="Rutas.jsp"><span>Rutas</span></a></li>
                                            <li ><a href="Ciudades.jsp"><span>Ciudades</span></a></li>
                                            <li class="active"><a href="Autobuses.jsp"><span>Autobuses</span></a></li>
                                            <li ><a href="Conductores.jsp"><span>Condutores</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->

        <div class="row">
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-sm-4"></div>
            <!-- Optional: clear the XS cols if their content doesn't match in height -->
            <div class="clearfix visible-xs-block"></div>
            <div class="col-xs-6 col-sm-4"><img src="imgs/bus.jpg"> </div>
        </div>
       
        
        
        <div class="col-md-offset-1">
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModalAct" >Actualizar</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModalElim">Eliminar</button>
        </div>
        <br>
            <div class="col-md-offset-1">
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Matricula</label>
                <input type="text" id="matriculaBus" class="form-control" >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Id conductor</label>
                <input type="text" id="idConductor" class="form-control" >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Modelo</label>
                <input type="text" id="modelo" class="form-control">
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Capacidad</label>
                <input type="text" id="capacidad" class="form-control">
                </div>
                
             </div>
        
        <br><br><br><br>
        <div  class="col-md-12">
            <center>  <input type="button" id="guardaBuses" class="btn btn-primary btn-lg"  value="Guardar"/>
                      <input type="button" id="buscaBuses" class="btn btn-primary btn-lg" value="Buscar"/>
            </center>
        </div>
        <div id="resultado"></div>
        <br><br><br>
        
<!--TABLA VISUALIZA AUTOBUSES-->        
<div class="col-md-10 col-md-offset-1">
<table class="table">
    <thead>
        <tr class="info">
            <th>Matricula</th>
            <th>Conductor</th>
            <th>Modelo</th>
            <th>Capacidad</th>
        </tr>
    </thead>
    <tbody id="mis-buses">    
    </tbody>
    
    
</table>
    </div>
 <!--MODALS-->

  <!-- Modal actualizar-->
<div class="modal fade" id="myModalAct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><center><label>Actualizar Id Conductor</label></center>
      </div>
      <div class="modal-body" id="modalBodyAct">
          <label>Matricula Autobus: </label><input type="text" id="matricula" class="form-control" placeholder="matricula">
          <label>Actualizar modelo:</label><input type="text" id="modeloAct" class="form-control" placeholder="id conductor">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="accionAct" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 

    <!-- Modal eliminar-->
<div class="modal fade" id="myModalElim" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><center><label>Eliminar Autobus</label></center>
      </div>
      <div class="modal-body" id="modalBodyElim">
          <label>Matricula :    </label><input type="text" id="idBusElim" class="form-control" placeholder="matricula"/>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="accionElim" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 
</body>
</html>
