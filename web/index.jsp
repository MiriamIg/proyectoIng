<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page  import="javax.servlet.http.HttpSession"%>

<%	
	/*String ip = request.getRemoteAddr().toString().trim();
	if( !ip.equals("192.10.1.198")      //Local
	    && !ip.equals("192.10.1.141")   //Saul
	    && !ip.equals("192.10.1.70")    //Carlos
	    && !ip.equals("192.10.1.147")   //Enrique
	    && !ip.equals("192.10.5.118")   //Merino
	    && !ip.equals("192.10.1.53")	//Direccion 
	    && !ip.equals("192.10.7.143")	//TemporalCarmen
	)
	    response.sendRedirect("http://192.10.1.213:8080/Logistica");*/

	HttpSession sesion = request.getSession();
    if(sesion.getAttribute("usuario") != null){
    	response.sendRedirect("menu.jsp");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administracion Autobuses</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        
        

        <style>body {padding-top: 70px;}</style>
        
        <script type="text/javascript">
        $(document).keypress(function(e) {
	            if (e.keyCode == 13) {
	            	login();
	            }
        });
		
        function login(){
        	var usuario	= $("#usuario").val();
        	var password= $("#password").val();
        	var exito="";
        	if(usuario != "" && password != ""){
	        	var params = "usuario="+usuario+"&password="+password;
	        	console.log("usuario"+usuario);
                        console.log("pass"+password);
	        	$.ajax({
	                url: "ServletLogin",
	                data: params,
	                type: 'post',
	                beforeSend: function(){
	                	$("#btnLogin").button('loading');
	                },
	                success: function(dataResponse){
	                	$("#btnLogin").button('reset')
                                   if(usuario=="software"){
                                    if(password=="123"){
                                     exito="true";
                                    }else{exito="false";}
                                }else{exito="false"}
	                	if(exito == "false"){
	    	        		$("#alerta").show(0);
	    	        		$("#alerta").html("<div class='alert alert-danger' role='alert'>Usuario Invalido</div>").delay(2000).hide(0);
	                	}
	                	else{
	                		$("#login").submit();
                                    }
	                
                            },
	                error: function(XMLHttpRequest, textStatus, errorThrown){
	                	$("#alerta").show(0);
		        		$("#alerta").html(
	       					"<div class='alert alert-danger' role='alert'>status:" + XMLHttpRequest.status + ","+ 
	       					"status text: " + XMLHttpRequest.statusText+"</div>").delay(4000).hide(0);
		        		$("#btnLogin").button('reset')
	                }
	            });
        	}
        	else
        		$("#alerta").show(0).html("<div class='alert alert-warning' role='alert'>Introduzca todos los campos</div>").delay(2000).hide(0);
        }
        </script>
        
    </head>

    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <!--  <a class="navbar-brand"><img src="img/logodcm2014.jpg" height="32" width="100" alt="DCM" class="img-rounded"></a>-->
                    <center><a class="navbar-brand">SOFTWARE AUTOBUSES</a></center>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    </ul>
                </div>
            </div>
        </nav>
		
		<div class="row">
		  <div class="col-md-5"></div>
		  <div class="col-md-4">
		  	<i class="fa fa-archive fa-5x"></i>
		  	<i class="fa fa-gears fa-5x"></i>
		  	<i class="fa fa-wrench fa-5x"></i>
	  	</div>
		  <div class="col-md-3"></div>
		</div>
		
        <div id="banner">
            <div class="container col-lg-12 text-center" >
                <div class="title"><h2 id>Iniciar Sesión</h2></div>
                <form class="form-inline" role="form" id="login" method="post" action="menu.html">
                    <div class="form-group">
                        <label class="sr-only">Usuario SIGA</label>
                        <input type="text" class="form-control" placeholder="Usuario" name="usuario" id="usuario" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Contrase&ntilde;a" autocomplete="off"/>
                        <input type="hidden" class="form-control" name="accion" value="redirect"/>
                    </div>
                    <button type="button" class="btn btn-info" id="btnLogin" onclick="login();"><i class="fa fa-sign-in"></i> &nbsp;Ingresar</button>

                </form>
                <div class="row">
				  	<div class="col-md-3"></div>
				  	<div class="col-md-6"><br>
				  		<div id="alerta"></div>
				  	</div>
			  		<div class="col-md-3"></div>
				</div>
                
            </div>
        </div>
        <br><br>
        <div class="row">
		  <div class="col-md-4"> &nbsp</div>
		   <!--  <div class="col-md-4"> <img alt="" src="enero.gif"></div> --> 
		  <div class="col-md-4">&nbsp </div>
		  
		</div>
    </body>
</html>