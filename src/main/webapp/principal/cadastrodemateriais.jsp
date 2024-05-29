<%@page import="dao.DAOVideos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelVideos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  	


<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">

													<div class="card-block">
														<h6 class="sub-title" style="color: blue;">Cadastro de Materiais</h6>
															
															 <form class="form-material"  action="<%= request.getContextPath() %>/SertvletCadastroMateriais" method="post" id="formVideos" >

														
															
														
														                      <div class="form-group form-default form-static-label">
                                                             
                                                             
                                                           
												        <input readonly="readonly"  value="${usuarioid}" type="text" name="idusuariologado" id="idusuariologado" class="form-control" required="required"  >
				
                                                              
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Id do Usuario Logado</label>
                                                            </div>
                                                           
														
														
														
                                                             
                                                            
                                                            
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="fabricante" id="fabricante" class="form-control" required="required" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Nome do Material/Fabricante:</label>
                                                            </div>
                                                           
                                                              
                                                              
                                                           
                                                            
                                                            
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="diametro" id="diametro" class="form-control" required="required" onchange="calcularResultado()" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Di�metro [mm]:</label>
                                                            </div>
                                                            
                                                            
                                                              
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="precorolo" id="precorolo" class="form-control" required="required" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Pre�o do Rolo(R$):</label>
                                                                
                                                            </div>
                                                            
                                                            
                                                              
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="tamanhorolo" id="tamanhorolo" class="form-control" required="required" onchange="calcularResultado()" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Tamanho do Rolo [KG]:</label>
                                                                
                                                            </div>
                                                            
                                                                
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="densidade" id="densidade" class="form-control" required="required" onchange="calcularResultado()" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Densidade[g/cm�]:</label>
                                                                
                                                            </div>
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="temperaturanozzle" id="temperaturanozzle" class="form-control" required="required" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Temperatura do Nozzle [�C]:</label>
                                                                
                                                            </div>
                                                            
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="temperaturamesa" id="temperaturamesa" class="form-control" required="required" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Temperatura da Mesa [�C]:</label>
                                                                
                                                            </div>
                                                            
                                                            
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="comprimentorolo" id="comprimentorolo" class="form-control" required="required"  readonly="readonly">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Comprimento do Rolo [M]:</label>
                                                                
                                                            </div>
                                                            
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="preco" id="preco" class="form-control" required="required"  readonly="readonly">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Pre�o [R$/KG]:</label>
                                                                
                                                            </div>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            <button  class="btn btn-success waves-effect waves-light">Salvar</button>
                                                            <br></br>
                                                                 
												               <a href="<%=request.getContextPath() %>/SertvletCadastroImpressoras?acao=listarcadastroimpressoras"  class="btn btn-primary waves-effect waves-light" >Impressoras</a>
												           <a  href="<%=request.getContextPath() %>/SertvletCadastroMateriais?acao=listarmateriais" class="btn btn-info waves-effect waves-light" >Materiais</a>
												          
												               <a  href="<%=request.getContextPath() %>/SertvletCadastroGeral?acao=listargeral" class="btn btn-secondary"  >Geral</a>
												        
												              
												          
												             
															

														</form>
													</div>

												</div>
											</div>
										</div>
										
										
										 <span id="msg">${msg}</span>
										 
																	
														
													<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
												<thead>
													<tr>
															<th scope="col">ID</th>
															<th scope="col">ID Usuario Logado:</th>
									<th scope="col">Material/Fabricante:</th>
									<th scope="col">Di�metro[mm]</th>
									<th scope="col">Pre�o do Rolo[R$]</th>
									<th scope="col">Tamanho do Rolo[KG]</th>
									<th scope="col">Densidade[g/cm�]</th>
									<th scope="col">Temperatura do Nozzle [�C]</th>
									<th scope="col">Temperatura da Mesa [�C]</th>
								    <th scope="col">Comprimento do Rolo [M]</th>
									<th scope="col">Pre�o [R$/KG]</th>
									
									
									
													</tr>
												</thead>
												<tbody>
												
													<c:forEach items='${cadastroMateriais}' var='ml'>
													<c:if test="${ml.idusuariologado == usuarioid}">
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.idusuariologado}"></c:out></td>
															<td><c:out value="${ml.fabricante}"></c:out></td>
															<td><c:out value="${ml.diametro}"></c:out></td>
															<td><c:out value="${ml.precorolo}"></c:out></td>
															<td><c:out value="${ml.tamanhorolo}"></c:out></td>
														    <td><c:out value="${ml.densidade}"></c:out></td>
														    <td><c:out value="${ml.temperaturanozzle}"></c:out></td>
														    <td><c:out value="${ml.temperaturamesa}"></c:out></td>
														    <td><c:out value="${ml.comprimentorolo}"></c:out></td>
														    <td><c:out value="${ml.preco}"></c:out></td>
														
														  
															<td><a class="btn btn-success"
																href="<%= request.getContextPath() %>/SertvletCadastroMateriais?acao=excluir&id=${ml.id}">Excluir</a></td>
														
														
													
														
														</tr>
														</c:if>
													</c:forEach>
													
													
													
													
												</tbody>
											</table>
										</div>


								</div>
														
										

								</div>
								<!-- Page-body end -->
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascripfile.jsp"></jsp:include>
	
	
<script type="text/javascript">




$("#tamanhorolo").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });

$("#precorolo").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });

$("#diametro").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });

$("#preco").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });

$("#comprimentorolo").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });
$("#temperaturamesa").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });
$("#temperaturanozzle").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });
 
$("#densidade").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });



function calcularResultado() {
    
    const tamanhorolo = parseFloat(document.getElementById('tamanhorolo').value.replace(',', '.'));

    const densidade = parseFloat(document.getElementById('densidade').value.replace(',', '.'));

    const diametro = parseFloat(document.getElementById('diametro').value.replace(',', '.'));

    const precorolo = parseFloat(document.getElementById('precorolo').value.replace(',', '.'));

    if (isNaN(tamanhorolo)) {
	tamanhorolo = 0; // Atribuir 0 se o valor n�o for num�rico
	    }
    
    if (isNaN(densidade)) {
	densidade = 0; // Atribuir 0 se o valor n�o for num�rico
	    }
    
    if (isNaN(diametro)) {
	diametro = 0; // Atribuir 0 se o valor n�o for num�rico
	    }
    
    if (isNaN(precorolo)) {
	precorolo = 0; // Atribuir 0 se o valor n�o for num�rico
	    }
    
    
    
    

    const pi = Math.PI;
    const resultado = tamanhorolo / densidade * 4 / (pi * Math.pow(diametro / 100, 2)) / 10;
    
    const resultadosoma = precorolo / tamanhorolo ;
    
    const resultadoArredondado2 = Math.ceil(resultadosoma);
   
    const resultadoArredondado = Math.ceil(resultado);

    document.getElementById('comprimentorolo').value = resultadoArredondado;
    document.getElementById('preco').value = resultadoArredondado2;
  }

  

</script>	
</body>

</html>