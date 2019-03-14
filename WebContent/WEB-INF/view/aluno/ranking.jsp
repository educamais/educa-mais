<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<nav class="navbar bg-one border">
		<div class="container">

			<a class="navbar-brand p-0 font-2 font-weight-bold text-white" href="/educa-mais/usuario">EDUCA+</a>
			
			<a class="navbar-brand p-0 font-2 text-white" href="/educa-mais/usuario">${turma.nomeTurma }</a>

			<div class="font-2">
				<a class="nav-link d-none d-sm-block p-0 text-center text-white" href="/educa-mais/aluno/ranking?idTurma=${turma.idTurma}">Minha Pontuação: ${pontuacao.get(0)}</a>
			</div>

			<div class="row font-2">

				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle text-white" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						 ${usuario.nome}
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="/educa-mais/logout">Sair</a>
					</div>

				</div>
			</div>
		</div>
	</nav>

	<div class="container my-5">
	
		<!-- MENU SECUNDÁRIO -->
		<ul class="nav nav-tabs nav-justified" id="lista-menu">
			<li class="nav-item">
				<a class="nav-link bg-one text-white border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/mural?id=${turma.idTurma}">
					Mural
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link bg-one text-white border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/atividades?id=${turma.idTurma}">
					Atividades
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-one border font-weight-bold" style="font-family: Gravity;" href="#">
					Ranking
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link bg-one text-white border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/participantes?id=${turma.idTurma}">
					Participantes
				</a>
			</li>
		</ul>
	
		<div class="container border shadow">

			<div class="capsula mb-5 p-5">

				<table class="table table-striped">
					<thead class="bg-two text-white">
						<tr>
							<th scope="col">Nome &nbsp;<i class="fas fa-sort"></i></th>
							<th scope="col">Nota &nbsp;<i class="fas fa-sort"></i></th>
						</tr>
					</thead>
					<tbody  id="ranking">
						<c:forEach var="alunoNota" items="${listaAlunoNota}">
							<tr>
								<td>${alunoNota[0].nome.toUpperCase()}</td>
								<td>${alunoNota[1]}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<input type="hidden" value="${turma.idTurma}" id="idTurma">
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAlterarUsuario.js"></script>
	
    <script>
		$(document).ready(function(){
			
    		$("#btn_alterarNome").click(function() {
    			$("#alterarNomeForm").submit();
    		});
    		
    		$("#btn_alterarSenha").click(function() {
    			$("#alterarSenhaForm").submit();
    		});
    	});
    </script>
</body>
</html>