<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
			
			<div class="row">
            <div class="col-auto d-none d-sm-block">
                <a class="nav-link text-white p-0 font-2" href="#" data-toggle="modal" data-target="#criarTurma">Criar Turma</a>
            </div>
            
            <div class="col-auto d-none d-sm-block ">
                <a class="nav-link text-white p-0 font-2" href="#" data-toggle="modal" data-target="#participar">Participar</a>
            </div>

            <div class="col-auto">
                <!-- Dropdown-->
                <div class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle text-white p-0 font-2" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						${usuario.nome}
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>                 
                    	<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
                        <a class="dropdown-item d-sm-none" href="#criarTurma">Criar Turma</a>
                        <a class="dropdown-item d-sm-none" href="#participar">Participar</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
                        <a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item font-1" href="/educa-mais/logout">Sair</a>

                    </div>
                </div>
            </div>
        </div>
		</div>
	</nav>

	<div class="container-fluid">
	
	    <!-- CONTEÚDO -->
		<div class="container pt-5 ">
			<div class="row">
				<div class="col-12">
				<h1>Professor</h1>
				</div>
				
				<c:forEach var="turma" items="${turmasProfessor}">
					
					<div class="col-md-4" onclick="window.location.replace('/educa-mais/professor/mural?id=${turma.idTurma }')">
						
						<div class="card border-secondary mb-3">
							<div class="card-body bg-transparent border-muted text-center p-2" id="idB_${turma.idTurma}">

								${ turma.nomeTurma }

								<div class="dropdown float-right">
									<div class="nav-item dropdown">
										<a class="nav-link dropdown-toggle text-roxo p-0 pl-2 pr-2" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="/educa-mais/turma/remover?id=${turma.idTurma}">Excluir</a>
										</div>
									</div>
								</div>
							</div>

							<div class="card-footer" id="idF_${turma.idTurma}">
								<div class="text-center d-flex justify-content-around">
									<a href="/educa-mais/professor/mural?id=${turma.idTurma }">Entrar</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
			<div class="row">
				<!-- ALUNOS -->
				<div class="col-12">
				<h1>Aluno</h1>
				</div>
				
				<c:forEach var="turma" items="${turmasAluno}">

					<div class="col-md-4" onclick="window.location.replace('/educa-mais/aluno/mural?id=${turma.idTurma }')">
	
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted text-center p-2">
								${ turma.nomeTurma }</div>
							<div class="card-footer">
								<div class="text-center d-flex justify-content-around">
									<a class="" href="/educa-mais/aluno/mural?id=${turma.idTurma }">Entrar</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
	
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/view/modais/participarTurma.jsp"/>
	<c:import url="/WEB-INF/view/modais/criarTurma.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarNomeTurma.jsp"/>

	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/additional-methods.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormTelaUsuario.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAlterarUsuario.js"></script>
	
	<script>
		$(document).ready(function(){
			
			$("#btn_criarTurma").click(function(){
				$("#formCriarSala").submit();
			});
			
			$("#btn_participar").click(function(){
				$("#formParticipar").submit();
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