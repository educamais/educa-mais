<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Educa+</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
	
</head>
<body>

	<!-- MENU PRINCIPAL -->
    <nav class="navbar border">
        <a class="logo" href="/educa-mais/usuario">
				<img class="rounded mx-auto d-block logo" src="<%=request.getContextPath()%>/resources/img/logo3.png" width ="20%" height="20%"/>
		</a>
        <div class="row">
            <div class="col-auto d-none d-sm-block">
                <a class="nav-link " href="#" data-toggle="modal" data-target="#criarTurma">Criar Turma</a>
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
                        <a class="dropdown-item" href="#">Alterar Nome</a>
                        <a class="dropdown-item" href="#">Alterar Senha</a>
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
											<a class="dropdown-item font-1" href="#">Excluir</a>
										</div>
									</div>
								</div>
							</div>
		
							<div class="card-body text-success">
								<div class="text-center"></div>
							</div>
							<div class="card-footer text-center d-flex justify-content-around">
							<a class="btn btn-vinho" href="/educa-mais/professor?id=${turma.idTurma }">
								Entrar	
							</a>
							</div>
							
						</div>
					</div>
				</c:forEach>
				
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
							
							<div class="text-center d-flex justify-content-around card-footer">
								<a class="btn btn-azul"href="/educa-mais/aluno?id=${turma.idTurma }">
										Entrar
									
								</a>	
							</div>
							
						</div>
					</div>
				</c:forEach>
	
			</div>
		</div>
	</div>


	<!-- Modal Participar Turma -->
	<c:import url="/WEB-INF/view/modais/participarTurma.jsp"/>

	<!-- Modal Criar Turma -->
	<c:import url="/WEB-INF/view/modais/criarTurma.jsp"/>

	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormTelaUsuario.js"></script>
	
	<script>
		$(document).ready(function(){
			$("#btn_criarTurma").click(function(){
				$("#formCriarSala").submit();
			});
		});
		$(document).ready(function(){
			$("#btn_participar").click(function(){
				$("#formParticipar").submit();
			});
		});
	</script>

</body>
</html>