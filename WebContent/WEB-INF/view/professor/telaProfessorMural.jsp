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
				<img class="rounded mx-auto d-block logo" src="<%=request.getContextPath()%>/resources/img/logo3.png"/>
			</a>

			<div class="row font-3">

				<a class="nav-link d-none d-sm-block text-roxo" href="#">Código da Turma: ${turma.codigoTurma.toUpperCase()}</a>

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
        
        <!-- MENU SECUNDÁRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link active border text-roxo font-weight-bold" style="font-family:Gravity;" href="mural?id=${turma.idTurma}">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border bg-roxo text-white font-weight-bold" id="participanteTab" style="font-family:Gravity;" href="atividade?id=${turma.idTurma}">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border bg-roxo text-white font-weight-bold" style="font-family:Gravity;" href="participantes?id=${turma.idTurma}">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">

            <!-- ****************************** MURAL ************************* -->
            <div class="tab-pane active container border shadow p-4" id="mural">
                
                <div class="capsula border mb-5">
                    
                    <!-- CADASTRO DE MATERIAIS -->
                    <form class="p-2" action="/educa-mais/postagem/save" method="post" enctype="multipart/form-data">
                    	
                    	<input type="hidden" value="${turma.idTurma}" name="id"/>
                    
                        <div class="row mb-2">
                            <div class="form-group col-sm-8">
                                <input type="text" name="tituloPostagem" class="form-control" placeholder="T I T U L O">
                            </div>
                            <div class="col-sm-4">
                            
                            	<!-- Button trigger modal -->
								<button type="button" class="btn btn-rosa btn-block" data-toggle="modal" data-target="#alunos">Lista de alunos</button>
									
								<!-- Participantes Modal -->
								<div class="modal fade" id="alunos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">

											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Alunos</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<div class="modal-body">
												<c:forEach var="aluno" items="${ listaAluno }">
													<input id="${ aluno.idUsuario }" type="checkbox" name="aluno" value="${aluno.idUsuario}" checked>
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
                        <!-- DescriÃ§Ã£o -->
                        <div class="form-group">
							<textarea style="resize:none;" class="form-control" name="descricaoPostagem" rows=5></textarea>
                        </div>

						<div class="input-group mb-3">
							<div class="custom-file">
								<input type="file" name="file" class="custom-file-input" id="inputGroupFile01" multiple>
								<label class="custom-file-label" for="inputGroupFile01">Selecionar arquivo</label>
							</div>
						</div>

						<div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-rosa btn-block">Publicar</button>
                        </div>
                    </form>
                </div>
                
                
                
                <!-- FEED -->
                
                
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
	                        
	                        <div class="card-header">
	                            <div class="col d-flex justify-content-end">
	                                <div class="btn-group">
	                                    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                        <i class="fa fa-ellipsis-h"></i>
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <button class="btn btn-link dropdown-item" type="button" onclick="alterarPostagem(${postagem.idPostagem})">Editar</button>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="/educa-mais/postagem/remove?id=${postagem.idPostagem}">Excluir</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
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
	                        <div class="card-footer bg-transparent">
	                        	<button class="btn btn-azulc float-right">Ler mais-></button>
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
	<c:import url="/WEB-INF/view/modais/codigoTurma.jsp"/>
	
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
    
    <script>
    
    function cancelar(idPostagem) {
    	$("#id_"+idPostagem).load(" #id_"+idPostagem);
    }
    
    $("#btnAlterarMaterial").click(function() {
    	alert("ols");
    });

    
	    function alterarPostagem(idPostagem) {
	    	
	    	
	    	var content = $("#id_"+idPostagem).html();
	    	$("#id_"+idPostagem).html("<form action='/educa-mais/postagem/alterar'>"+content+"</form>");
	    	
	    	var titulo = $("#id_"+idPostagem+" #titulo_postagem").text();
	    	$("#id_"+idPostagem+" #titulo_postagem").html("<input type='text' class='form-control'  name='tituloPostagem' value='"+titulo.trim()+"'>");
	    	
	    	var descricao = $("#id_"+idPostagem+" #descricao_postagem").text();
	    	var linhas = "";
	    	
	    	linhas += '<input type="hidden" name="idPostagem" value="'+idPostagem+'">';
	    	linhas += '<input type="hidden" name="idTurma" value="${turma.idTurma}">';
	    	linhas += '<input type="hidden" name="professor" value="${usuario.idUsuario}">';
	    	
	    	linhas += "<textarea style='resize:none; width:100%;' name='descricaoPostagem' rows='5'>"+descricao.trim()+"</textarea>";
	    	linhas += '<div class="input-group my-3">';
	    	linhas += '<div class="custom-file">';
	    	linhas += '<input type="file" name="file" class="custom-file-input" id="inputGroupFile01" multiple>';
	    	linhas += '<label class="custom-file-label" for="inputGroupFile01">Selecionar arquivo</label>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	
	    	$("#id_"+idPostagem+" #descricao_postagem").html(linhas);
	    	
	    	
	    	linhas = "";
	    	
	    	linhas += '<button type="button" class="btn btn-rosa btn-block" data-toggle="modal" data-target="#alterarAlunos">Lista de alunos</button>';
	    	linhas += '<div class="modal fade" id="alterarAlunos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
	    	linhas += '<div class="modal-dialog" role="document">';
	    	linhas += '<div class="modal-content">';

	    	linhas += '<div class="modal-header">';
	    	linhas += '<h5 class="modal-title" id="exampleModalLabel">Alunos</h5>';
	    	linhas += '<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">';
	    	linhas += '<span aria-hidden="true">&times;</span>';
	    	linhas += '</button>';
	    	linhas += '</div>';
	    	linhas += '<div class="modal-body">';
	    	linhas += '<c:forEach var="aluno" items="${ listaAluno }">';
	    	linhas += '<input id="aluno_${ aluno.idUsuario }" type="checkbox" name="alunos" value="${aluno.idUsuario}" checked>';
	    	linhas += '<label for="aluno_${ aluno.idUsuario }">${ aluno.nome }</label><br>';
	    	linhas += '</c:forEach>';
	    	linhas += '</div>';
					
	    	linhas += '<div class="modal-footer">';
	    	linhas += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	
	    	
	    	$("#id_"+idPostagem+" .card-header").html('<div class="col-lx-6">'+linhas+'</div>');
	    	
	    	linhas = "<div class='row'>";
	    	linhas += "<div class='col-6'>";
	    	linhas += '<button id="btnCancelar" type="button" class="btn btn-block" onclick="cancelar('+idPostagem+')">Cancelar</button>';
	    	linhas += "</div>";
	    	linhas += "<div class='col-6'>";
	    	linhas += '<button id="btnAlterarMaterial" type="submit" class="btn btn-rosa btn-block">Publicar</button>';
	    	linhas += "</div>";
	    	linhas += "</div>";
	    	$("#id_"+idPostagem+" .card-footer").html(linhas);
	    	
	    	
	    }
	    
	    
    </script>
    
</body>
</html>