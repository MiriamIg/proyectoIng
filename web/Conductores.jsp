<%-- 
    Document   : conductor
    Created on : 25/11/2016, 01:08:00 AM
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
        <title>Admin Rutas</title>
        
        <script>
        $(document).ready(function (e) {    
            $("#guardaConductores").click(function(){            
                console.log('Guardar Conductor');
                $.ajax({
                        url: 'ServletGuardaConductor',
                        type: 'post',
                        data: {
                            idConductor:   $("#idConductor").val(),
                            nombreConduct: $("#nombre").val(),
                            aPaterno:      $("#aPaterno").val(),
                            aMaterno:      $("#aMaterno").val(),
                            calle:         $("#calle").val(),
                            cpConduct:     $("#cpConduct").val(),
                            delMuniConduct:$("#delMuniConduct").val(),
                            telConduct:    $("#telConduct").val(),
                            experiencia:   $("#experiencia").val(),
                            salud:         $("#salud").val()
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
            $("#buscaConductores").click(function(){
                console.log("busca Conductores");
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        dataType: "json",  //va a recibir un formato json
                        url: "ServletBuscarConductores",
                        success: function (datos) {  //datos ahi se deposita todo el json 
                            
                            $("#mis-conductores").html("");   //length dice cuantos elemntos tiene
                            $.each(datos, function (key, val) {
                              $("#mis-conductores").append("<tr class='info'>")
                              $("#mis-conductores").append("<td>"+ val.idConductor   + "</td>"+
                                                     "<td>" +val.nombreConduct+ "</td>"+
                                                     "<td>" +val.dir + "</td>"+
                                                     "<td>" +val.telConduct + "</td>"+
                                                     "<td>" +val.experiencia + "</td>"+
                                                     "<td>" +val.salud + "</td>"
                                                     )
                              $("#mis-conductores").append("</tr>")
                            });
                            
                            
                        }
                    });
                });
                
             $("#accionAct").click(function(){
                    console.log('actualiza el conductor');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletActualizarConductores",
                        data: {
                            idConduct: $("#idConduct").val(),
                            idExpAct : $("#idExpAct").val() 
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
                    console.log('elimina conductor');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",
                        url: "ServletEliminarConductores",
                        data: {
                            idRutaElim: $("#idRutaElim").val()
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
        <h1><center>Conductor</center></h1>
        <div class="col-md-offset-1">
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModalAct" >Actualizar</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModalElim">Eliminar</button>
        </div>
        <br>
        
        
        
        <div class="row">
            <div class="col-md-offset-1">  
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Id conductor</label>
                <input type="text"  id="idConductor" class="form-control" placeholder="id conductor">
                </div>
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Nombre</label>
                <input type="text"  id="nombre" class="form-control" placeholder="Nombres(s)">
                </div>
                
                <div class="col-md-2">
                <label for="exampleInputEmail1"></label>
                <input type="text"  id="aPaterno" class="form-control" placeholder="Apellido paterno">
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1"></label>
                <input type="text" id="aMaterno"  class="form-control" placeholder="Apellido materno">
                </div>
            </div>
        </div>
        <br><br>

        <div class="row">
            <div class="col-md-offset-1">
            
             <div class="col-md-2">    
                <label for="exampleInputEmail1">Calle y Numero</label>
                <input type="text" id="calle" class="form-control"  >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">CP</label>
                <input type="text" id="cpConduct" class="form-control"  >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Del/Municipio</label>
                <input type="text" id="delMuniConduct" class="form-control" >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Telefono</label>
                <input type="text"  id="telConduct" class="form-control" >
                </div>
                
            </div>
        </div>
        <br><br>       
        <div class="row">       
            <div class="col-md-offset-1">
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Experiencia</label>
                <input type="text"  id="experiencia" class="form-control" placeholder="años">
                </div>
               
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Salud</label>
                <input type="text" id="salud" class="form-control"  >
                </div>
            </div>    
        </div>
        
        <br><br>
        <div  class="col-md-12">
            <center>  <input type="button" id="guardaConductores" class="btn btn-primary btn-lg"  value="Guardar"/>
                      <input type="button" id="buscaConductores" class="btn btn-primary btn-lg" value="Buscar"/>
            </center>
        </div>
        
        
        <div id="resultado"></div>

        <br><br><br>
<!--TABLA VISUALIZA CIUDADES-->        
<table class="table">
    <thead>
        <tr class="info">
            <th>Id Conductor</th>
            <th>Nombre</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Experiencia</th>
            <th>Salud</th>
        </tr>
    </thead>
    <tbody id="mis-conductores">    
    </tbody>
    
    
</table>

 <!--MODALS-->

  <!-- Modal actualizar-->
<div class="modal fade" id="myModalAct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><center><label>Actualizar experiencia del conduct</label></center>
      </div>
      <div class="modal-body" id="modalBodyAct">
          <label>Id conductor: </label><input type="text" id="idConduct" class="form-control" placeholder="id conductor">
          <label>Actualizar experiencia:</label><input type="text" id="idExpAct" class="form-control" placeholder="años">
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
          <label>Id ciudad :    </label><input type="text" id="idConductElim" class="form-control" placeholder="id ciudad">
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
