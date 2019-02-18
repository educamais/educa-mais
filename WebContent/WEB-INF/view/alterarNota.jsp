<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Educa+</title>
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fontawesome/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
</head>
<body>
    
    <!-- MENU PRINCIPAL -->
    <nav class="navbar bg-white border">
		<div class="container">

			<a class="logo" href="/educa-mais/usuario">
				<img class="rounded mx-auto d-block logo" src="<%=request.getContextPath()%>/resources/img/logo3.png"/>
			</a>

			<div class="row font-3">

				<a class="nav-link d-none d-sm-block text-roxo" href="#">1926 pts</a>

				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> ${usuario.nome} </a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<a class="dropdown-item d-sm-none font-1" href="#">Ranking</a>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#codigoTurma">Código</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#">Alterar Nome</a>
						<a class="dropdown-item font-1" href="#">Alterar Senha</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#">Sair</a>
					</div>

				</div>
			</div>
		</div>
	</nav>
	
    <div class="container my-5">

		<!-- CORPO DO SITE -->
		<div class="tab-content bg-white">
			<div class="container border shadow p-4" id="atividades">
				<div class="capsula mb-5">
					
					<!-- FORMULÁRIO -->
					<form action="atividade/save">

						<input type="hidden" id="idTurma" name="id" value="${turma.idTurma}">

						<div class="d-flex justify-content-center mx-5 mb-3">
							<div class="col-9">
								<input type="text" id="pesquisarAluno" name="pesquisarAluno" class="form-input form-control form-control-lg text-center" placeholder="Pesquisar aluno..." required>
							</div>
						</div>

						<table class="table table-hover">
						
							<thead class="thead-rosa">
								<tr>
									<th scope="col">Nome &nbsp; <i class="fas fa-sort"></i>
									</th>
									<th scope="col">Porcentagem Conluída &nbsp; <i
										class="fas fa-sort"></i>
									</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="aluno" items="${ listaAluno }">
									<tr>
										<input type="hidden" name="idAluno" value="${aluno.idUsuario}">
										<td>${ aluno.nome.toUpperCase() }</td>
										<td><input type="text" name="notaAluno"
											class="form-input form-control  text-center"
											style="width: 20%;"></td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>

						<button id="btnCadastrar" class="btn btn-primary my-2"
							type="submit">Cadastrar</button>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- Modal Participar Turma -->
	<c:import url="/WEB-INF/view/modais/codigoTurma.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/tabPane.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/dataConverter.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/carregarTabelaJSon.js"></script>
    
    <script>
    	$(document).ready(function() {
    		$("#pesquisarAtividade").keyup(function() {
    			carregaTabelaJSon();
    		});
    	});
    </script>
    <script>
    	alert($("input[name=]").val())
    </script>
</body>
</html>