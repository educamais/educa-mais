<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Educa+</title>
	
	<style>
		textarea {
			resize:none;
		}
	</style>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fontawesome/css/all.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<!-- MENU PRINCIPAL -->
	<nav class="navbar border">
		<div class="container">

			<a class="navbar-brand p-0 font-weight-bold" href="<%=request.getContextPath()%>/usuario">EDUCA+</a>

			<div>
				<a class="nav-link d-none d-sm-block p-0 text-center" href="#">Código da Turma: ${turma.codigoTurma.toUpperCase()}</a>
			</div>
			
			<!-- Dropdown-->
			<div class="nav-item dropdown">
				<a class="nav-link dropdown-toggle p-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> ${usuario.nome} </a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="<%=request.getContextPath()%>/usuario">Home</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/turma/minhasturmas">Minhas Turmas</a>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/professor/desempenho?idTurma=${turma.idTurma}">Desempenho</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="<%=request.getContextPath()%>/logout">Sair</a>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="container my-5">
		
		<!-- MENU SECUNDÁRIO -->
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item" id="muralNav">
				<a class="nav-link active font-weight-bold" href="#">
					Mural
				</a>
			</li>
			<li class="nav-item" id="atividadesNav">
				<a class="nav-link border font-weight-bold" href="atividade?id=${turma.idTurma}">
					Atividades
				</a>
			</li>
			<li class="nav-item" id="participantesNav">
				<a class="nav-link border font-weight-bold" href="participantes?id=${turma.idTurma}">
					Participantes
				</a>
			</li>
		</ul>
		
		<!-- CORPO DO SITE -->
		<div class="tab-content bg-white">

			<div class="tab-pane active container border-right border-left shadow p-4">
				
				<div class="border mb-5">
					
					<!-- CADASTRO DE MATERIAIS -->
					<form id="formularioCadastroPostagem" class="p-2" action="<%=request.getContextPath()%>/postagem/save" method="post" enctype="multipart/form-data">
						
						<input type="hidden" value="${turma.idTurma}" id="idTurma" name="id"/>
					
						<div class="row mb-2">
							<div class="form-group col-sm-8">
								<input type="text" name="tituloPostagem" class="form-control" placeholder="T I T U L O">
							</div>
							<div class="col-sm-4">
							
								<!-- Button trigger modal -->
								<button type="button" class="btn  btn-block" data-toggle="modal" data-target="#alunos">Lista de alunos</button>
									
								<!-- Participantes Modal -->
								<div class="modal fade" id="alunos" tabindex="-1" role="dialog" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">

											<div class="modal-header">
												<h5 class="modal-title">Alunos</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<div class="modal-body">
												<c:forEach var="aluno" items="${ listaAluno }">
													<input id="${ aluno.idUsuario }" type="checkbox" class="checkbox" name="aluno" value="${aluno.idUsuario}" checked>
													<label for="${ aluno.idUsuario }">${ aluno.nome }</label><br>
												</c:forEach>
											</div>
											
											<div class="modal-footer">
												<button id="btnMaterial" type="submit" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						<!-- DESCRIÇÃO -->
						<div class="form-group">
							<textarea class="form-control" name="descricaoPostagem" rows="5" placeholder="D E S C R I Ç Ã O"></textarea>
						</div>

						<div class="input-group mb-3">
							<div class="custom-file">
								<input type="file" name="file" class="custom-file-input" id="arquivos" multiple>
								<label class="custom-file-label" for="arquivos">Selecionar arquivo</label>
							</div>
						</div>

						<div class="d-flex justify-content-end">
							<button id="btnPublicar" type="submit" class="btn btn-block">Publicar</button>
						</div>
					</form>
				</div>
				
				
				
				<!-- FEED -->
				
				<div id="feed">
				
					<c:forEach var="postagem" items="${listaPostagem}">
						<div class="mb-3 feed" id="postagem_${postagem.idPostagem}">
							
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link border font-weight-bold tituloPostagem" data-toggle="tab">
										${postagem.tituloPostagem}
									</a>
								</li>
							</ul>
							
							<div class="card">
								<div class="card-body descricaoPostagem">
							   		<div class="float-right">
										<button type="button" class="btn btn-link dropdown-toggle p-0 " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fa fa-ellipsis-h"></i>
										</button>
										<div class="dropdown-menu">
											<button class="btn btn-link dropdown-item" type="button" onclick="alterarPostagem(${postagem.idPostagem}, ${turma.idTurma}, ${usuario.idUsuario})">Editar</button>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="<%=request.getContextPath()%>/postagem/remove?id=${postagem.idPostagem}">Excluir</a>
										</div>
									</div>
									<div class="row">
										<div class="p-1">
											<p class="card-text">
												${ postagem.descricaoPostagem}
											</p>
										</div>
									</div>
									<div class="row">
									
										<c:if test="${not empty postagem.listaArquivo}">
											<c:forEach var="arquivo" items="${postagem.listaArquivo}">
										   		<div class="col-6 col-lg-2 mb-1">
													<c:choose>
														<c:when test="${arquivo.arquivo.endsWith('.png') || arquivo.arquivo.endsWith('.jpg') || arquivo.arquivo.endsWith('.jpeg')}">
															<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
																<img src="<%=request.getContextPath()%>/resources/img/image.png" class="img-fluid img-thumbnail">
															</a>
														</c:when>
														<c:when test="${arquivo.arquivo.endsWith('.pdf') || arquivo.arquivo.endsWith('.doc') || arquivo.arquivo.endsWith('.docx') || arquivo.arquivo.endsWith('.odt') || arquivo.arquivo.endsWith('.xlsx') || arquivo.arquivo.endsWith('.ods') || arquivo.arquivo.endsWith('.pptx') || arquivo.arquivo.endsWith('.ppt') || arquivo.arquivo.endsWith('.odp')}">
														   	<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
														   		<img src="<%=request.getContextPath()%>/resources/img/doc.png" class="img-fluid img-thumbnail">
														   	</a>
														</c:when>
														<c:otherwise>
														  	<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
														   		<img src="<%=request.getContextPath()%>/resources/img/docUnknow.png" class="img-fluid img-thumbnail">
														   	</a>
														</c:otherwise>
													</c:choose>
												</div>
											</c:forEach>
										</c:if>
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
	<c:import url="/WEB-INF/view/modais/avisoAlunoObrigatorio.jsp"/>
	
	<input type="hidden" id="idTurma" value="${turma.idTurma }">
	<input type="hidden" id="path" value="<%=request.getContextPath()%>">
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/util.js"></script>
	
	<script> 
		$('#btnPublicar').on('click', function(e) {
			e.preventDefault();
			if($('.checkbox:checked').length > 0) {
				$(this).parents('form').submit();
				return;
			}
			$("#alunoObrigatorioModal").modal("show");
			return false;
		});
	
		function validaAluno() {
			if($('#formAlterarPostagem .checkbox:checked').length > 0) {
				$("#formAlterarPostagem").submit();
			}else {
				$("#alunoObrigatorioModal").modal("show");	
			}
		}
		
		var page = 0;
		var idTurma = $("#idTurma").val();
		var path = $("#path").val();
		
		$(window).scroll(() => {
			
			if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
				
				carregarPostagens(idTurma, page, path)
				page += 5
			}
		});
	</script>
	
</body>
</html>
