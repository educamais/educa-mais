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
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#">Sair</a>
					</div>

				</div>
			</div>
		</div>
	</nav>
	
    <div class="container my-5">
        
        <!-- MENU SECUNDÁRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#mural">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#atividades">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#participantes">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">
            
            <!-- ****************************** MURAL ************************* -->
            <div class="tab-pane fade container border shadow p-4" id="mural">
                
                <div class="capsula border mb-5">
                    
                    <!-- CADASTRO DE MATERIAIS -->
                    <form class="p-2" action="postagem/save" method="post" enctype="multipart/form-data">
                    	
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
												<h5 class="modal-title" id="exampleModalLabel">Código da Turma</h5>
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
                        <!-- Descrição -->
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
                <c:forEach var="postagem" items="${listaPostagem}">
	                <div class="capsula mb-3">
	                    
	                    <ul class="nav nav-tabs">
	                        <li class="nav-item">
	                            <a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab">
	                                ${postagem.tituloPostagem}
	                            </a>
	                        </li>
	                    </ul>
	                    
	                    <div class="card gedf-card">
	                        
	                        <div class="row">
	                            <div class="col d-flex justify-content-end">
	                                <div class="btn-group">
	                                    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                        <i class="fa fa-ellipsis-h"></i>
	                                    </button>
	                                    <div class="dropdown-menu">
	                                        <a class="dropdown-item" href="#">Editar</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="/educa-mais/postagem/remove?id=${postagem.idPostagem}">Excluir</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="card-body">
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
	                                <div class="col-8">
	                                    <p class="card-text">
	                                        ${postagem.descricaoPostagem}
	                                    </p>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="row">
	                            <div class="col d-flex justify-content-end">
	                                <button class="btn btn-azulc">Ler mais-></button>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
                </c:forEach>
            </div>
            
 			<!-- ************************** ATIVIDADES ************************ -->
			<div class="tab-pane active container border shadow p-4" id="atividades">
				<div class="capsula mb-5">

					<div class="d-flex alterarNota justify-content-end">
						<button class="btn btn-rosa my-2 mb-4" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multi-collapse">
							Nova Atividade
						</button>
					</div>

					<!--*************** COLLAPSE DO ATIVIDADE ****************** -->
					<div class="collapse multi-collapse border p-4">
						
						<form action="atividade/save">

							<!-- FORMULÁRIO -->
							<input type="hidden" id="idTurma" name="id" value="${turma.idTurma}">

							<div class="d-flex justify-content-center mx-5 mb-3">
								<div class="col-9">
									<input type="text" id="nomeAtividade" name="nomeAtividade" class="form-input form-control form-control-lg text-center" placeholder="Nome da Atividade" required>
								</div>
							</div>

							<table class="table table-hover">
								<thead class="thead-rosa">
									<tr>
										<th scope="col">
											Nome &nbsp; <i class="fas fa-sort"></i>
										</th>
										<th scope="col">
											Nota &nbsp; <i class="fas fa-sort"></i>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="aluno" items="${ listaAluno }">
										<tr>
											<input type="hidden" name="idAluno" value="${aluno.idUsuario}">
											<td>${ aluno.nome.toUpperCase() }</td>
											<td>
												<input type="text" name="notaAluno" class="form-input form-control  text-center" style="width:20%;">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<button id="btnCadastrar" class="btn btn-primary my-2" type="submit">
								Cadastrar
							</button>
						</form>
					</div>

					<!--*************** COLLAPSE DO CADASTRO DE ATIVIDADE ************* -->
					<div class="collapse multi-collapse show border p-4">
						
						<div class="d-flex justify-content-center mx-5 mb-3">
							<div class="col-9">
								<input type="text" id="pesquisarAtividade" class="form-input form-control form-control-lg text-center" placeholder="Pesquisar atividade..." required>
							</div>
						</div>
						
						<table class="table table-striped">
							<thead class="thead-rosa">
								<tr>
									<th scope="col">Nome &nbsp;<i class="fas fa-sort"></i></th>
									<th scope="col">Data &nbsp;<i class="fas fa-sort"></i></th>
									<th scope="col" style="vertical-align: middle; text-align: center;">Operação</th>
								</tr>
							</thead>
							<tbody id="tabelaAtividade">
								<c:forEach var="atividade" items="${listaAtividade}">
									<tr>
										<td style='vertical-align: middle; text-align: center;'>${atividade.nomeAtividade}</td>
										<td style='vertical-align: middle; text-align: center;'><fmt:formatDate value="${atividade.dataAtividade}" pattern="dd/MM/yyyy" /></td>
										<td style="vertical-align: middle; text-align: center;">
											<a id="alterarNota">Alterar</a>
											<br>
											<a href="atividade/remove?id=${turma.idTurma}&idAtividade=${atividade.idAtividade}">Remover</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!--****************COLLAPSE DO ALTERAR DE NOTA ******************* -->
					<div class="border p-4">
						
						<div class="d-flex justify-content-center mx-5 mb-3">
							<div class="col-9">
								<input type="text" id="pesquisarAtividade" class="form-input form-control form-control-lg text-center" placeholder="Pesquisar atividade..." required>
							</div>
						</div>
						
						<table class="table table-striped">
							<thead class="thead-rosa">
								<tr>
									<th scope="col">Nome &nbsp;<i class="fas fa-sort"></i></th>
									<th scope="col">Data &nbsp;<i class="fas fa-sort"></i></th>
									<th scope="col" style="vertical-align: middle; text-align: center;">Operação</th>
								</tr>
							</thead>
							<tbody id="tabelaAtividade">
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
			
			<!-- ************************* PARTICIPANTES ********************** -->
            <div class="tab-pane container fade border shadow p-4" id="participantes">
                <div class="capsula mb-5">
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-6">
                            
                            <!-- TABELA PROFESSORES -->
                            <table class="table table-striped">
                                
                                <thead class="thead-rosa">
                                    <tr>
                                        <th scope="col">
                                            PROFESSOR
                                        </th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                        <td>${ turma.professor.nome.toUpperCase() }</td>
                                    </tr>
                                </tbody>

                            </table>

                       	 	<!-- TABELA ALUNOS -->
							<table class="table table-striped">
                                
                                <thead class="thead-rosa">
                                    <tr>
                                        <th scope="col">
                                            ALUNOS
                                        </th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <c:forEach var="aluno" items="${ listaAluno }">
										<tr>
											<td>${ aluno.nome.toUpperCase() }</td>
										</tr>
									</c:forEach>
                                </tbody>
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    
    <!-- Modal Participar Turma -->
	<c:import url="/WEB-INF/view/modais/codigoTurma.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/tabPane.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/dataConverter.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/carregarTabelaJSon.js"></script>
    
    <script>
	
		$(document).ready(function(){
			
			$("#alterarSenhaForm").validate({
		        rules : {
		        	senhaAtual : {
		        		required: true,
		                minlength: 8,
		                maxlength: 16
		            },
		            senhaNova : {
		                required: true,
		                minlength: 8,
		                maxlength: 16
		            },
		            redigiteSenha : {
		            	required: true,
		                minlength: 8,
		                maxlength: 16,
		            	equalTo: "#senhaNova"
		            }
		        }
		    });
			
    		$("#pesquisarAtividade").keyup(function() {
    			carregaTabelaJSon();
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