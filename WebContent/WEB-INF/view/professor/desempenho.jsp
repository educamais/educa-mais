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
    <nav class="navbar bg-white border">
		<div class="container">

			<a class="logo" href="/educa-mais/usuario">
				<img class="logo" src="<%=request.getContextPath()%>/resources/img/logo3.png"/>
			</a>

			<div class="row font-3">
			
				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> ${usuario.nome} </a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<a class="dropdown-item d-sm-none font-1" href="#">Ranking</a>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#codigoTurma">Código</a>
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
	
		<div class="container border shadow">
		  
			<div class="capsula mb-5 p-5">
				<div class="card">
				
					<div class="card-header" data-toggle="collapse" data-target="#desempenhoGeral" aria-expanded="true">
						<h5 class="mb-0">
							<button class="btn btn-link">Desempenho Individual</button>
						</h5>
					</div>
					<div id="desempenhoGeral" class="collapse">
						<div class="card-body">
				
							<div class="d-flex justify-content-center mx-auto mb-3">
								<div class="col-9">
									<input type="text" id="pesquisarNome" class="form-control form-control-lg text-center" placeholder="Pesquisar..." required>
								</div>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Nome &nbsp;<i class="fas fa-sort"></i></th>
										<th scope="col">Nota &nbsp;<i class="fas fa-sort"></i></th>
									</tr>
								</thead>
								<tbody id="desempenhoGeralTBody">
									<c:forEach var="alunoNota" items="${listaAlunoNota}">
										<tr>
											<td>${alunoNota[0].nome.toUpperCase()}</td>
											<td>${alunoNota[1]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col">
									<h5>Média da turma: &nbsp;<span id="desempenhoGeralMedia"></span></h5>
								</div>
								<div class="col">
									<h5>Total da turma: &nbsp;<span id="desempenhoGeralTotal"></span></h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="card">
				
					<div class="card-header" data-toggle="collapse" data-target="#desempenhoAtividade" aria-expanded="true">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button">
								Desempenho por Atividade
							</button>
						</h5>
					</div>
					<div id="desempenhoAtividade" class="collapse">
						<div class="card-body">
				
							<c:forEach var="atividade" items="${listaAtividade}">
								<div class="card" onclick="verAtividade(${atividade.idAtividade})">
									<div class="card-header" data-toggle="collapse" data-target="#atividade_${atividade.idAtividade}" aria-expanded="true">
										<h5 class="mb-0">
											<button class="btn btn-link" type="button">
												${atividade.nomeAtividade}
											</button>
										</h5>
									</div>
									
									<div  id="atividade_${atividade.idAtividade}" class="collapse">
										<table class="table table-striped">
											<thead>
												<tr>
													<th scope="col" colspan="2">Nome &nbsp;<i class="fas fa-sort"></i></th>
													<th scope="col">Nota &nbsp;<i class="fas fa-sort"></i></th>
												</tr>
											</thead>
											<tbody id="tr_${atividade.idAtividade}">
												
											</tbody>
										</table>
										<div class="row">
											<div class="col">
												<h5>Média da atividade: &nbsp;<span id="desempenhoAtividadeMedia"></span></h5>
											</div>
											<div class="col">
												<h5>Total da atividade: &nbsp;<span id="desempenhoAtividadeTotal"></span></h5>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
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
	<script src="<%=request.getContextPath()%>/resources/js/filtrarTabelaRanking.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/veAtividade.js"></script>
	
    <script>
	    function verAtividade(idAtividade) {
	    	veAtividade(idAtividade);
	    }
    
		$(document).ready(function(){
			
			
			var arrayNota = $("#desempenhoGeralTBody tr td:last-child").text().split(".");
			var soma = 0;
				
			arrayNota.forEach(function(index){
				soma += parseInt(index);
			});
			
			$("#desempenhoGeralTotal").text(soma.toFixed(1));
			$("#desempenhoGeralMedia").text(soma/arrayNota.length);
			
    		$("#pesquisarNome").keyup(function() {
    			filtrarTabelaRanking();
    		});
    		
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