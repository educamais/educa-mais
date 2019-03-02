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
				<span class="text-roxo">
					<img alt="" class="rounded mx-auto d-block logo" src="<%=request.getContextPath()%>/resources/img/logo3.png"/>
				</span>
			</a>


			<div class="d-flex  d-block">
				<img alt="" class="rounded mx-auto d-block" src="<%=request.getContextPath()%>/resources/img/trophy_gold.png" width="50" height="50" />
				<span class="badge badge-white py-3">9</span>
				<img alt="" class="rounded mx-auto d-block" src="<%=request.getContextPath()%>/resources/img/trophy_silver.png" width="50" height="50" />
				<span class="badge badge-white py-3">8</span>
				<img alt="" class="rounded mx-auto d-block" src="<%=request.getContextPath()%>/resources/img/trophy_bronze.png" width="50" height="50" />
				<span class="badge badge-white py-3">7</span>
			</div>
			<div class="row font-3">

				<a class="nav-link d-none d-sm-block text-roxo" href="#">1926 pts</a>

				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						 ${usuario.nome}
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<a class="dropdown-item d-sm-none font-1" href="#">Ranking</a>
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
				<a class="nav-link text-roxo border font-weight-bold" style="font-family: Gravity;" href="#">
					Mural
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link bg-roxo text-white border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/atividades?id=${turma.idTurma}">
					Atividades
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link bg-roxo text-white border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/participantes?id=${turma.idTurma}">
					Participantes
				</a>
			</li>
		</ul>

		<!-- CORPO DO SITE -->
		<div class="tab-content bg-white">

			<div class="tab-pane  container active border shadow p-4" id="mural">

				<!-- FEED 3 -->
				<div class="capsula">
                <c:forEach var="postagem" items="${listaPostagem}">
	                <div class="mb-3" id="id_${postagem.idPostagem}">
	                    
	                    <ul class="nav nav-tabs">
	                        <li class="nav-item">
	                            <a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab" id="titulo_postagem">
	                                ${postagem.tituloPostagem}
	                            </a>
	                        </li>
	                    </ul>
	                    
	                    <div class="card gedf-card">
	                        
	                        <div class="card-body"  id="descricao_postagem">
	                            <div class="row">
	                            	<c:if test="${not empty postagem.listaArquivo}">
		                                <div class="col-4">
		                                    <div class="row mb-2">
		                                    	<c:forEach var="arquivo" items="${postagem.listaArquivo}">
			                                        <div class="col-6">
			                                            <img src="<%=request.getContextPath()%>/resources/img/upload/arquivo" class="img-fluid img-thumbnail">
			                                        </div>
		                                        </c:forEach>
		                                    </div>
		                                </div>
	                                </c:if>
	                                <div class="p-1">
	                                    <p class="card-text">
	                                        ${postagem.descricaoPostagem}
	                                    </p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAlterarUsuario.js"></script>
</body>
</html>