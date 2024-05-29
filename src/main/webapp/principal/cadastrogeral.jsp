<%@page import="model.ModelCadastroGeral"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAOCadastroGeral"%>
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
														<h6 class="sub-title" style="color: blue;">Cadastro Geral</h6>
															
															 <form class="form-material"  action="<%= request.getContextPath() %>/SertvletCadastroGeral?id=${usuarioid}" method="post" id="formVideos" >

														
															
													
															
															
															
															
															
															
															
															
															
														         
														
                                                             <div class="form-group form-default form-static-label">
                                                             
                                                             
                                                           
												        <input readonly="readonly"  value="${usuarioid}" type="text" name="idusuariologado" id="idusuariologado" class="form-control" required="required"  >
				
                                                              
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Id do Usuario Logado</label>
                                                            </div>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                                                           
														
                                                             
                                                            
                                                            
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="custoenergia" id="custoenergia" class="form-control" required="required"  onchange="somatotal()">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Custo de Energia[R$/KWh]:</label>
                                                            </div>
                                                           
                                                              
                                                              
                                                           
                                                            
                                                            
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="custodetrabalho" id="custodetrabalho" class="form-control" required="required" onchange="somatotal()">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Custo de Trabalho [R$/h]:</label>
                                                            </div>
                                                           
                                                             <div class="form-group form-default form-static-label">
                                                                <input  type="text" name="taxadeperdas" id="taxadeperdas" class="form-control" required="required" onchange="somatotal()">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Taxa de Perdas[%]:</label>
                                                                
                                                            </div>
                                                           
                                                              
                                                             <div class="form-group form-default form-static-label">
                                                                <input  value="R$" readonly="readonly" type="text" name="unidademonetaria" id="unidademonetaria" class="form-control" required="required" >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Unidade Monet�ria [R$]:</label>
                                                                
                                                            </div>
                                                            
                                                                
                                                            
                                                               <div class="form-group form-default form-static-label">
                                                                <input   readonly="readonly" type="text" name="totalgeral" id="totalgeral" class="form-control" required="required"  onchange="verificarInput();">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label" style="color: black">Total Geral[R$]:</label>
                                                                
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
									<th scope="col">Custo de Energia[R$/Kwh]:</th>
									<th scope="col">Custo de Trabalho[R$/h]</th>
									<th scope="col">Taxa de Perdas[%]</th>
									<th scope="col">Unidade Monet�ria[R$]</th>
									<th scope="col">Total</th>
									<th scope="col">Id Usuario Logado</th>
									
									
									
													</tr>
												</thead>
												<tbody>
												
												
												<c:forEach items="${geral}" var="ml">
  <c:if test="${ml.idusuariologado == usuarioid}">
    <tr>
      <td><c:out value="${ml.id}"></c:out></td>
      <td><c:out value="${ml.custoenergia}"></c:out></td>
      <td><c:out value="${ml.custodetrabalho}"></c:out></td>
      <td><c:out value="${ml.taxadeperdas}"></c:out></td>
      <td><c:out value="${ml.unidademonetaria}"></c:out></td>
      <td><c:out value="${ml.totalgeral}"></c:out></td>
      <td><c:out value="${ml.idusuariologado}"></c:out></td>
      
  
        <td><a class="btn btn-success"
          href="<%= request.getContextPath() %>/SertvletCadastroGeral?acao=excluir&id=${ml.id}">Excluir</a></td>
            
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



$("#custoenergia").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });
    
$("#custodetrabalho").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });
 
 
$("#taxadeperdas").keypress(function (event) {
    return /\d/.test(String.fromCharCode(event.keyCode)); 
 });

 
  
    










function somatotal(){
    
    const custoenergia = parseFloat(document.getElementById('custoenergia').value.replace(',', '.'));
    const custodetrabalho = parseFloat(document.getElementById('custodetrabalho').value.replace(',', '.'));
    const taxadeperdas = parseFloat(document.getElementById('taxadeperdas').value.replace(',', '.'));
   
    

    // Verificar se os campos cont�m valores num�ricos v�lidos
    if (isNaN(custoenergia)) {
	custoenergia = 0; // Atribuir 0 se o valor n�o for num�rico
    }
    if (isNaN(custodetrabalho)) {
	custodetrabalho = 0; // Atribuir 0 se o valor n�o for num�rico
    }
    if (isNaN(taxadeperdas)) {
	taxadeperdas = 0; // Atribuir 0 se o valor n�o for num�rico
    }
   
    if (isNaN(totalgeral)) {
	totalgeral = 0;
    }
   

    var soma = custoenergia + custodetrabalho + taxadeperdas;
    
    const resultadoArredondado = Math.ceil(soma);

    document.getElementById('totalgeral').value = resultadoArredondado;

    
}


</script>	
</body>

</html>