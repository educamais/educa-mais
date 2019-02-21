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
        
        <!-- MENU SECUNDÁRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link active border active font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#mural">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#atividades">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#participantes">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">
            
            <!-- ******************************MURAL ********************************************************-->
            <div class="tab-pane active container border shadow p-4" id="mural">
                
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
								<button type="button" class="btn btn-azul btn-block" data-toggle="modal" data-target="#alunos">Lista de alunos</button>
									
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
                            <button type="submit" class="btn btn-azul btn-block">Publicar</button>
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
            
            
            
 			<!-- **************************ATIVIDADES ***************************************-->
			<div class="tab-pane fade container border shadow p-4" id="atividades">

				<div class="capsula mb-5">

					<div class="d-flex justify-content-end">
						<button class="btn btn-azul my-3 mb-5" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="cadAtividade">
							Cadastrar Atividade
						</button>
					</div>


					<!--***************COLLAPSE DA ATIVIDADE****************** -->

					<div class="collapse multi-collapse" id="cadAtividade" data-parent="#cadAtividade">
						<div class="card card-body ">

							<!-- FORMULÁRIO -->
							<form action="atividade/save">
							
								<div class="d-flex justify-content-center mx-5 mb-3">
									<div class="col-9">
										<input type="text" name="nomeAtividade" class="form-input form-control form-control-lg text-center" placeholder="Nome da Atividade" required>
									</div>
									
									<div class="col-3">
										<input type="text" name="nota" class="form-input form-control form-control-lg text-center" placeholder="Nota" required>
									</div>
								</div>
								
								<table class="table table-hover">
									<thead class="thead-azul">
										<tr>
											<th scope="col">Nome &nbsp; <i class="fas fa-sort"></i>
											</th>
											<th scope="col">Data &nbsp; <i class="fas fa-sort"></i>
											</th>
											<th scope="col">Nota &nbsp; <i class="fas fa-sort"></i>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="aluno" items="${ listaAluno }">
											<tr>
												<td>${ aluno.nome.toUpperCase() }</td>
												<td>21/07/2019</td>
												<td>
													<input type="text" name="notaAluno" class="form-input form-control  text-center " required="required" size="3">
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<button class="btn btn-primary my-2 mb-1 float-right" type="submit">Cadastrar</button>
								
							</form>
						</div>
					</div>

					<!--****************COLLAPSE DA Lista de atividade************** -->

					<div class="collapse multi-collapse show" id="listaAtividade">
						<div class="card card-body ">

							<table class="table table-striped">
								<thead class="thead-azul">
									<tr>
										<th scope="col">Nome &nbsp;<i class="fas fa-sort"></i></th>
										<th scope="col">Data &nbsp;<i class="fas fa-sort"></i></th>
										<th scope="col" style="vertical-align: middle; text-align: center;">Operação</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Atividade 1</td>
										<td>10/07/2018</td>
										<td style="vertical-align: middle; text-align: center;">
											<a href="edit?id=${produto.id}">Alterar</a>
											<br>
											<a href="delete?id=${produto.id}">Remover</a>
										</td>
									</tr>
									<tr>
										<td>Atividade 1</td>
										<td>10/07/2018</td>
										<td style="vertical-align: middle; text-align: center;">
											<a href="edit?id=${produto.id}">Alterar</a>
											<br>
											<a href="delete?id=${produto.id}">Remover</a>
										</td>
									</tr>
									<tr>
										<td>Atividade 1</td>
										<td>10/07/2018</td>
										<td style="vertical-align: middle; text-align: center;">
											<a href="edit?id=${produto.id}">Alterar</a>
											<br>
											<a href="delete?id=${produto.id}">Remover</a>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- **********PARTICIPANTES************ -->
            <div class="tab-pane container fade border shadow p-4" id="participantes">
                <div class="capsula mb-5">
                    <div class="row d-flex justify-content-center">
                        <div class="col-sm-6">
                            
                            <!-- TABELA PROFESSORES -->
                            <table class="table table-striped">
                                
                                <thead class="thead-azul">
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
                                
                                <thead class="thead-azul">
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
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/tabPane.js"></script>
</body>

</html>