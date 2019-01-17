<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>

    <DOCTYPE html>
	<html>
	<head>
	
		<meta charset = "utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Educa+</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fontawesome/css/all.css">
		
		
	</head>
	<body>

	<!-- MENU PRINCIPAL -->
	<nav class="navbar bg-white border">
		<div class="container">

			<a class="logo" href="#"> <span class="text-roxo"> Educa+
			</span>
			</a>

			<div class="row font-3">

				<a class="nav-link d-none d-sm-block text-roxo" href="#">Criar Turma</a>
				<a class="nav-link d-none d-sm-block text-roxo" href="#">Entrar</a>

				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle text-roxo"
						data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
						aria-expanded="false"> Nilson Candido </a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="#">Home</a> <a
							class="dropdown-item font-1" href="#">Minhas Turmas</a> <a
							class="dropdown-item d-sm-none font-1" href="#">Ranking</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#">Alterar Nome</a> <a
							class="dropdown-item font-1" href="#">Alterar Senha</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#">Sair</a>
					</div>

				</div>
			</div>
		</div>
	</nav>


	<!-- CONTEÚDO -->
			<div class="container mt-5 pt-5 ">
				<div class="row">
					<div class="col-md-4">
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted">Bem vindo á Turma 
								
								<div class="dropdown float-right">
									
									<div class="nav-item dropdown">
										
										<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" ></a>
										
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="#">Editar</a>
											<a class="dropdown-item font-1" href="#">Excluir</a>
										</div>
									</div>
									
								</div>
							</div>
							
							<div class="card-body text-success">
								<div class="text-center">
									
								</div>
							</div>
							
							
							<div class="card-footer">
								<div class="text-center d-flex justify-content-around">
									
									<button type="button" class="btn btn-outline-info">Entrar</button>
									<button type="button" class="btn btn-outline-info">Sair</button>
									
									
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- CARD 2 -->
					<div class="col-md-4">
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted">Bem vindo á Turma 
								
								<div class="dropdown float-right">
									
									<div class="nav-item dropdown">
										
										<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" ></a>
										
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="#">Editar</a>
											<a class="dropdown-item font-1" href="#">Excluir</a>
										</div>
									</div>
									
								</div>
							</div>
							
							<div class="card-body text-success">
								<div class="text-center">
									
								</div>
							</div>
							
							
							<div class="card-footer">
								<div class="text-center d-flex justify-content-around">
									
									<button type="button" class="btn btn-outline-info">Entrar</button>
									<button type="button" class="btn btn-outline-info">Sair</button>
									
									
								</div>
							</div>
						</div>
					</div>
					
					<!-- CARD 3 -->
					<div class="col-md-4">
						<div class="card border-secondary mb-3">
							<div class="card-header bg-transparent border-muted">Bem vindo á Turma 
								
								<div class="dropdown float-right">
									
									<div class="nav-item dropdown">
										
										<a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" ></a>
										
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item font-1" href="#">Editar</a>
											<a class="dropdown-item font-1" href="#">Excluir</a>
										</div>
									</div>
									
								</div>
							</div>
							
							<div class="card-body text-success">
								<div class="text-center">
									
								</div>
							</div>
							
							
							<div class="card-footer">
								<div class="text-center d-flex justify-content-around">
									
									<button type="button" class="btn btn-outline-info">Entrar</button>
									<button type="button" class="btn btn-outline-info">Sair</button>
									
									
								</div>
							</div>
						</div>
					</div>
							
				</div>
					</div>
										
							
							
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		
						
</body>
</html>