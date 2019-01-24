<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
	<title>Usuário</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
</head>
<body>

	<!-- MENU PRINCIPAL -->
    <nav class="navbar border">

        <a class="nav-brand" href="#">
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
                        Gabriel Neves
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item d-sm-none" href="#criarTurma">Criar Turma</a>
                        <a class="dropdown-item d-sm-none" href="#participar">Participar</a>
                        <div class="dropdown-divider d-sm-none"></div>
                        <a class="dropdown-item" href="#">Alterar Nome</a>
                        <a class="dropdown-item" href="#">Alterar Senha</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/educa-mais/">Sair</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <!-- CONTEÚDO -->
	<div class="container mt-5 pt-5 ">
		<div class="row">
		
			<!-- CARD 1 -->
			<div class="col-md-4">
				<div class="card border-secondary mb-3">
					<div class="card-header bg-transparent border-muted">
						Bem vindo á Turma

						<div class="dropdown float-right">

							<div class="nav-item dropdown">

								<a class="nav-link dropdown-toggle text-roxo"
									data-toggle="dropdown" href="#" role="button"
									aria-haspopup="true"></a>

								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item font-1" href="#">Editar</a> <a
										class="dropdown-item font-1" href="#">Excluir</a>
								</div>
							</div>

						</div>
					</div>

					<div class="card-body text-success">
						<div class="text-center"></div>
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
					<div class="card-header bg-transparent border-muted">
						Bem vindo á Turma

						<div class="dropdown float-right">

							<div class="nav-item dropdown">

								<a class="nav-link dropdown-toggle text-roxo"
									data-toggle="dropdown" href="#" role="button"
									aria-haspopup="true"></a>

								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item font-1" href="#">Editar</a> <a
										class="dropdown-item font-1" href="#">Excluir</a>
								</div>
							</div>

						</div>
					</div>

					<div class="card-body text-success">
						<div class="text-center"></div>
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
					<div class="card-header bg-transparent border-muted">
						Bem vindo á Turma

						<div class="dropdown float-right">

							<div class="nav-item dropdown">

								<a class="nav-link dropdown-toggle text-roxo"
									data-toggle="dropdown" href="#" role="button"
									aria-haspopup="true"></a>

								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item font-1" href="#">Editar</a> <a
										class="dropdown-item font-1" href="#">Excluir</a>
								</div>
							</div>

						</div>
					</div>

					<div class="card-body text-success">
						<div class="text-center"></div>
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
</div>


<!-- Modal -->
<div class="modal fade" id="participar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Título do modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                Participar
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Salvar mudanças</button>
            </div>

        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="criarTurma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Título do modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="formCriarSala" method="post"  action="turma/save">
                	<input type="text" class="form-control" name="nomeTurma" placeholder="Digite o nome da turma..." required>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" id="btn_criarTurma">Criar Turma</button>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#btn_criarTurma").click(function(){
			$("#formCriarSala").submit();
		});
	});
</script>

</body>
</html>