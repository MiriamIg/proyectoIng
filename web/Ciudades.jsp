<%-- 
    Document   : Ciudades
    Created on : 27/11/2016, 02:20:08 PM
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
        
        
        
        <title>ciudades</title>
        <script>
         $(document).ready(function (e) {
            
            $("#guardaCiudades").click(function(){            
                console.log('Guardar Ciudad');
                $.ajax({
                        url: 'ServletGuardaCiudad',
                        type: 'post',
                        data: {
                            idCiudad:   $("#idCiudad").val(),
                            idRutaAsig: $("#idRutaAsig").val(),
                            ciudad:     $("#ciudad").val(),
                            tel:        $("#tel").val(),
                            delMuni:    $("#delMuni").val(),
                            cp:         $("#cp").val()
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
            $("#buscaCiudades").click(function(){
                console.log("busca Ciudades");
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        dataType: "json",  //va a recibir un formato json
                        url: "ServletBuscarCiudades",
                        success: function (datos) {  //datos ahi se deposita todo el json 
                            
                            $("#mis-ciudades").html("");   //length dice cuantos elemntos tiene
                            $.each(datos, function (key, val) {
                              $("#mis-ciudades").append("<tr class='info'>")
                              $("#mis-ciudades").append("<td>"+ val.idCiudad + "</td>"+
                                                     "<td>" +val.idRutaAsig+ "</td>"+
                                                     "<td>" +val.ciudad + "</td>"+
                                                     "<td>" +val.dir + "</td>"+
                                                      "<td>" +val.tel + "</td>"
                                                     )
                              $("#mis-ciudades").append("</tr>")
                            });
                            
                            
                        }
                    });
                });
                
            $("#accionAct").click(function(){
                    console.log('actualiza ciudad');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletActualizarCiudades",
                        data: {
                            idCdAct  : $("#idCdAct").val(),
                            telAct    : $("#telAct").val()
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
                    console.log('elimina ciudad');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletEliminarCiudades",
                        data: {
                         idCdElim   : $("#idCdElim").val()
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
                                            <li class="active"><a href="Ciudades.jsp"><span>Ciudades</span></a></li>
                                            <li><a href="Autobuses.jsp"><span>Autobuses</span></a></li>
                                            <li><a href="Conductores.jsp"><span>Condutores</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
        
        <div class="row">
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-sm-4"></div>
            <!-- Optional: clear the XS cols if their content doesn't match in height -->
            <div class="clearfix visible-xs-block"></div>
            <div class="col-xs-6 col-sm-4"><p class="text-right"><img src="imgs/ciudad.jpg"></p> </div>
        </div>
        
        <div class="col-md-offset-1">
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModalAct" >Actualizar</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModalElim">Eliminar</button>
        </div>
        <br>
            <div class="col-md-offset-1">
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Id Ciudad</label>
                <input type="text" id="idCiudad" class="form-control" >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Id Ruta Asignada</label>
                <input type="text" id="idRutaAsig" class="form-control" >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Ciudad</label>
                <select id="ciudad" class="form-control">
                    <option value="">--Seleccionar--</option>
                        <option>Aguascalientes-AGS</option>
                        <option>Ensenada-BC.</option>
                        <option>Mexicali-BC.</option>
                        <option>Tijuana-BC.</option>
                        <option>La Paz-BCS.</option>
                        <option>Los Cabos-BCS.</option>
                        <option>Campeche-CAMP.</option>
                        <option>Ciudad del Carmen-CAMP.</option>
                        <option>Saltillo-COAH.</option>
                        <option>Tecomán-COL.</option>
                        <option>Manzanillo-COL.</option>
                        <option>Tuxtla Gutiérrez-CHIAP.</option>
                        <option>Chihuahua-CHICH.</option>
                        <option>Juárez -CHIH.</option>
                        <option>Valle de México-CDMX.</option>
                        <option>Dgo-DGO.</option>
                        <option>Celaya-GTO.</option>
                        <option>Guanajuato-GTO.</option>
                        <option>Irapuato-GTO.</option>
                        <option>León-GTO.</option>
                        <option>Acapulco-GRO.</option>
                        <option>Chilpancingo -GRO.</option>
                        <option>Tula-HGO.</option>
                        <option>Tulancingo-HGO.</option>
                        <option>Pachuca-HGO.</option>
                        <option>Guadalajara-JAL.</option>
                        <option>Puerto Vallarta -JAL.</option>
                        <option>Toluca-MEX.</option>
                        <option>Morelia-MICH.</option>
                        <option>Cuernavaca-MOR.</option>
                        <option>Tepic-NAY</option>
                        <option>Monterrey-N.L</option>
                        <option> Oaxaca -OAX</option>
                </select>
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Telefono fijo</label>
                <input type="text" id="tel" class="form-control">
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Direccion</label>
                Delegacion/Municipio 
                <input type="text" id="delMuni" class="form-control" placeholder="Del. o Municipio">
                Cp 
                <input type="text" id="cp" class="form-control" placeholder="Cp">
                </div>
                
             </div>
        
        <br><br><br><br><br><br><br>
        <div  class="col-md-12">
            <center>  <input type="button" id="guardaCiudades" class="btn btn-primary btn-lg"  value="Guardar"/>
                      <input type="button" id="buscaCiudades" class="btn btn-primary btn-lg" value="Buscar"/>
            </center>
        </div>
        <div id="resultado"></div>

        <br><br><br>
<!--TABLA VISUALIZA CIUDADES-->        
<div class="col-md-10 col-md-offset-1">
<table class="table">
    <thead>
        <tr class="info">
            <th>Id Ciudad</th>
            <th>Ruta Asignada</th>
            <th>Nombre</th>
            <th>Direccion</th>
            <th>Telefono</th>
        </tr>
    </thead>
    <tbody id="mis-ciudades">    
    </tbody>
    
    
</table>
</div>
 <!--MODALS-->

  <!-- Modal actualizar-->
<div class="modal fade" id="myModalAct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><label><center>Actualizar Telefono</center></label>
      </div>
      <div class="modal-body" id="modalBodyAct">
          <label>Id ciudad :  </label><input type="text" id="idCdAct" class="form-control" placeholder="id ciudad">
          <label>Actualizar tel. :    </label><input type="text" id="telAct" class="form-control" placeholder="(55)">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="accionAct" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 

    <!-- Modal eliminar-->
<div class="modal fade" id="myModalElim" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><label><center>Eliminar Ciudad</center></label>
      </div>
      <div class="modal-body" id="modalBodyElim">
          <label>Id ciudad :    </label><input type="text" id="idCdElim" class="form-control" placeholder="id ciudad">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="accionElim" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 
        
        
    </body>
</html>
