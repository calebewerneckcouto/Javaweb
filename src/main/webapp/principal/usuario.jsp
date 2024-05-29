<%@page import="model.ModelLogin"%>
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
														<h4 class="sub-title">Cad. Usu�rio</h4>

														<form class="form-material" enctype="multipart/form-data"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															
														
															method="post" id="formUser">

															<input type="hidden" name="acao" id="acao" value="">
															
															
														

															<div class="form-group form-default form-static-label">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modolLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID:</label>
															</div>



															<div class="form-group form-default input-group mb-4">
																<div class="input-group-prepend">
																	<c:if test="${modolLogin.fotouser != '' && modolLogin.fotouser !=null}">
																		<img alt="Imagem User" id="fotoembase64"
																			src="${modolLogin.fotouser }" width=70px;>
																	</c:if>
																	<c:if test="${modolLogin.fotouser == '' ||  modolLogin.fotouser == null}">

																		<img alt="Imagem User"
																			src="assets\images\usuario.png"
																			width=70px;>
																	</c:if>





																</div>
																<input type="file" accept="image/" name="fileFoto"
																	id="fileFoto"
																	onchange="visualizarImg('fotoembase64','fileFoto')"
																	class="form-control-file"
																	style="margin-top: 15px; margin-left: 5px;">

															</div>







															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modolLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>


                                                              
															<div class="form-group form-default form-static-label">
															
																<select class="form-control"
																	aria-label="Default select example" name="permissao" >
																	<option disabled="disabled" >[Selecione o
																		Perfil]</option>

																	<option value="usuario"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPermissao().equals("usuario")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Usuario</option>

																	<option value="admin"
																		<%modelLogin = (ModelLogin) request.getAttribute("modolLogin");

if (modelLogin != null && modelLogin.getPermissao().equals("admin")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");

}%>>Admin</option>


																</select> <span class="form-bar"></span> <label
																	class="float-label">Permiss�o:</label>
															</div>
															
															

															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha</label>
															</div>

															






															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm();">Novo</button>
															<button class="btn btn-success waves-effect waves-light">Salvar</button>
															<button type="button"
																class="btn btn-info waves-effect waves-light"
																onclick="criarDelete();">Excluir</button>
																 
												             <c:if test="${modolLogin.id > 0}"> 
												               <a href="<%= request.getContextPath() %>/SertvletTelefone?iduser=${modolLogin.id}" class="btn btn-primary waves-effect waves-light" >Telefone</a>
												             </c:if>
												             
															<br></br>
															
															<button  style="padding:10px 10px 10px 10px" type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#exampleModalUsuario">Pesquisar</button>
																
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
									<th scope="col">Nome</th>
									<th scope="col">Email</th>
									<th scope="col">Login</th>
									<th scope="col">Senha</th>
									<th scope="col">Permiss�o</th>									
									<th scope="col">Ver</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items='${modelLogins}' var='ml'>
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><c:out value="${ml.email}"></c:out></td>
															<td><c:out value="${ml.login}"></c:out></td>
															<td><c:out value="${ml.senha}"></c:out></td>
															<td><c:out value="${ml.permissao}"></c:out></td>
															<td><a class="btn btn-success"
																href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>


                                     
										<nav aria-label="Page navigation example">
											<ul class="pagination">
											
											   <%
											     int totalPagina = (int) request.getAttribute("totalPagina");
											   
											    for (int p = 0; p < totalPagina; p++){
											    	String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);  
											    	out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+ url +"\">"+(p + 1)+"</a></li>");
											    }
											   
											   %>
											
												
											</ul>
										</nav>












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
	</div>

	<jsp:include page="javascripfile.jsp"></jsp:include>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						usu�rio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="nome" id="nomeBusca" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>

					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaresultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Email</th>
									<th scope="col">Login</th>
									<th scope="col">Senha</th>
									<th scope="col">Permiss�o</th>									
									<th scope="col">Ver</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	function visualizarImg(fotoembase64, filefoto) {

	    var preview = document.getElementById(fotoembase64); //campo img html
	    var fileUser = document.getElementById(filefoto).files[0];
	    var reader = new FileReader();

	    reader.onloadend = function() {
		preview.src = reader.result;//carrega a foto na tela

	    };

	    if (fileUser) {
		reader.readAsDataURL(fileUser);//Preview da Imagem
	    } else {
		preview.src = '';
	    }

	}

	function verEditar(id) {

	    var urlAction = document.getElementById('formUser').action;

	    window.location.href = urlAction + '?acao=buscarEditar&id=' + id;

	}

	function buscarUsuario() {

	    var nomeBusca = document.getElementById('nomeBusca').value;

	    if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

		var urlAction = document.getElementById('formUser').action;

		$
			.ajax(
				{

				    method : "get",
				    url : urlAction,
				    data : "nomeBusca=" + nomeBusca
					    + '&acao=buscarUserAjax',
				    success : function(response) {

					var json = JSON.parse(response);

					$('#tabelaresultados > tbody > tr')
						.remove();

					for (var p = 0; p < json.length; p++) {
					    $('#tabelaresultados > tbody')
						    .append(
							    '<tr> <td>'
								    + json[p].id
								    + '</td> <td> '
								    + json[p].nome
								    + '</td> <td> '
								    + json[p].email
								    + '</td><td> '
								    + json[p].login
								    + '</td><td> '
								    + json[p].senha
								    + '</td><td> '
								    + json[p].permissao
								    + '</td><td><button onclick="verEditar('
								    + json[p].id
								    + ')" type="button" class="btn btn-info">Ver</button></td></tr>');
					}

					document
						.getElementById('totalResultados').textContent = 'Resultados: '
						+ json.length;

				    }

				}).fail(
				function(xhr, status, errorThrown) {
				    alert('Erro ao buscar usu�rio por nome: '
					    + xhr.responseText);
				});

	    }

	}

	function criarDeleteComAjax() {

	    if (confirm('Deseja realmente excluir os dados?')) {

		var urlAction = document.getElementById('formUser').action;
		var idUser = document.getElementById('id').value;

		$.ajax({

		    method : "get",
		    url : urlAction,
		    data : "id=" + idUser + '&acao=deletarajax',
		    success : function(response) {

			limparForm();
			document.getElementById('msg').textContent = response;
		    }

		}).fail(
			function(xhr, status, errorThrown) {
			    alert('Erro ao deletar usu�rio por id: '
				    + xhr.responseText);
			});

	    }

	}

	function criarDelete() {

	    if (confirm('Deseja realmente excluir os dados?')) {

		document.getElementById("formUser").method = 'get';
		document.getElementById("acao").value = 'deletar';
		document.getElementById("formUser").submit();

	    }

	}

	function limparForm() {

	    var elementos = document.getElementById("formUser").elements; /*Retorna os elementos html dentro do form*/

	    for (p = 0; p < elementos.length; p++) {
		elementos[p].value = '';
	    }
	}
    </script>



</body>
</html>
