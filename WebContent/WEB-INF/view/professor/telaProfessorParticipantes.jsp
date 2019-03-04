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
        
        <!-- MENU SECUNDÃRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link border bg-roxo text-white font-weight-bold" style="font-family:Gravity;" href="mural?id=${turma.idTurma}">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border bg-roxo text-white font-weight-bold" id="participanteTab" style="font-family:Gravity;" href="atividade?id=${turma.idTurma}">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-roxo border font-weight-bold" style="font-family:Gravity;" href="participantes?id=${turma.idTurma}">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">

            <div class="tab-pane container active border shadow p-4" id="participantes">
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
</body>
</html>