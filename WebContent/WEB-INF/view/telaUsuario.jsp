<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Educa+</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
</head>
<body>

	<!-- MENU PRINCIPAL -->
    <nav class="navbar border">
        <a class="nav-brand" href="/educa-mais/usuario">
            Educa+
        </a>
        <div class="row">
            <div class="col-auto d-none d-sm-block">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#criarTurma">Criar Turma</a>
            </div>
            
            <div class="col-auto d-none d-sm-block ">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#participar">Participar</a>
            </div>

            <div class="col-auto">
                <!-- Dropdown-->
                <div class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">

                        ${usuario.nome}
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="/educa-mais/usuario">Home</a>                 
                    	<a class="dropdown-item" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
                        <a class="dropdown-item d-sm-none" href="#criarTurma">Criar Turma</a>
                        <a class="dropdown-item d-sm-none" href="#participar">Participar</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
                        <a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/educa-mais/logout">Sair</a>

                    </div>
                </div>
            </div>
        </div>
	</nav>

	<div class="container-fluid">
	
	    <!-- CONTEÚDO -->
		<div class="container mt-5 pt-5 ">
			<div class="row">
				
				<c:forEach var="turma" items="${turmasProfessor}">
					<div class="col-md-4">
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted">
								${ turma.nomeTurma }
								<div class="dropdown float-right">
									<div class="nav-item dropdown">
										<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="#">Editar</a>
											<a class="dropdown-item font-1" href="/educa-mais/turma/remover?id=${turma.idTurma}">Excluir</a>
										</div>
									</div>
								</div>
							</div>
		
							<div class="card-body text-success">
								<div class="text-center"></div>
							</div>
							<a class="" href="/educa-mais/professor/mural?id=${turma.idTurma }">
								<div class="card-footer">
									<div class="text-center d-flex justify-content-around">
										Entrar
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				
				<!-- ALUNOS -->
				
				<c:forEach var="turma" items="${turmasAluno}">
					<div class="col-md-4">
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted">
								${ turma.nomeTurma }
								<div class="dropdown float-right">
									<div class="nav-item dropdown">
										<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="#">Editar</a>
											<a class="dropdown-item font-1" href="#">Excluir</a>
										</div>
									</div>
								</div>
							</div>
		
							<div class="card-body text-success">
								<div class="text-center"></div>
							</div>
							<a href="/educa-mais/aluno/mural?id=${turma.idTurma }">
								<div class="card-footer">
									<div class="text-center d-flex justify-content-around">
										Entrar
									</div>
								</div>
							</a>
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