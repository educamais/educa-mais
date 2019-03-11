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
    
    <style>
    	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
		}
		input[type="number"] {
		-moz-appearance: textfield;
		}
    </style>
    
</head>
<body>
    
    <!-- MENU PRINCIPAL -->
    <nav class="navbar bg-white border">
		<div class="container">

			<a class="navbar-brand p-0" href="/educa-mais/usuario">
				<img src="<%=request.getContextPath()%>/resources/img/logo3.png" width="100"/>
			</a>

				<div class="font-2">
					<a class="nav-link d-none d-sm-block p-0 text-center" href="#">Código da Turma: ${turma.codigoTurma.toUpperCase()}</a>
				</div>
				
				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle p-0 font-2" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> ${usuario.nome} </a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<a class="dropdown-item font-1" href="/educa-mais/professor/desempenho?idTurma=${turma.idTurma}">Desempenho</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarNome">Alterar Nome</a>
						<a class="dropdown-item font-1" href="#" data-toggle="modal" data-target="#alterarSenha">Alterar Senha</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item font-1" href="/educa-mais/logout">Sair</a>
					</div>
			</div>
		</div>
	</nav>
	
    <div class="container my-5">
        
        <!-- MENU SECUNDÃRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" href="mural?id=${turma.idTurma}">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" id="participanteTab" style="font-family:Gravity;" href="atividade?id=${turma.idTurma}">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" href="participantes?id=${turma.idTurma}">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">
        
        	<div id="idAtividades">     
            
 			<!-- ************************** ATIVIDADES ************************ -->
			<div class="tab-pane active container border shadow p-4" id="atividades">
				<input type="hidden" value="${atividade}" id="tabAtividade">
				<div class="capsula mb-5">
					<div class="d-flex alterarNota justify-content-end">
						<button class="btn my-2 mb-4" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multi-collapse">
							Nova Atividade
						</button>
					</div>

					<!--*************** COLLAPSE DO CADASTRO DE ATIVIDADE ****************** -->
					<div class="collapse multi-collapse border p-4">
						
						<form action="/educa-mais/atividade/save" id="cadAtividade">

							<!-- FORMULÁRIO -->
							<input type="hidden" id="idTurma" name="id" value="${turma.idTurma}">

							<div class="d-flex justify-content-center mx-5 mb-3">
								<div class="col-9">
									<input type="text" id="nomeAtividade" name="nomeAtividade" class="form-input form-control form-control-lg text-center" placeholder="Nome da Atividade" required>
								</div>
							</div>

							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">Nome</th>
										<th scope="col">Nota</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="aluno" items="${ listaAluno }">
										<tr>
											<input type="hidden" name="idAluno" value="${aluno.idUsuario}">
											<td>${ aluno.nome.toUpperCase() }</td>
											<td>
												<input type="number" name="notaAluno" class="form-input form-control text-center" style="width:20%;">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<button id="btnCadastrar" class="btn my-2" type="button" onclick="validaAluno()">
								Cadastrar
							</button>
							
							<button class="btn my-2" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multi-collapse">
								Cancelar
							</button>
						</form>
					</div>

					<!--*************** COLLAPSE DO ATIVIDADE ************* -->
					<div class="collapse multi-collapse show border p-4" id="crudAtividade">
						
						<div class="d-flex justify-content-center mx-5 mb-3">
							<div class="col-9">
								<input type="text" id="pesquisarAtividade" class="form-input form-control form-control-lg text-center" placeholder="Pesquisar atividade..." required>
							</div>
						</div>
						
						<table class="table table-striped" id="tabelaAtividade">
							<thead>
								<tr>
									<th scope="col">Nome</th>
									<th scope="col">Data</th>
									<th scope="col" style="vertical-align: middle; text-align: center;">Operação</th>
								</tr>
							</thead>
							<tbody id="tabelaAtividadeBody">
								<c:forEach var="atividade" items="${listaAtividade}">
									<tr>
										<td style='vertical-align: middle;'><button class="btn btn-link" onclick="verAtividade(${atividade.idAtividade})" data-toggle="collapse" data-target="#tr_${atividade.idAtividade}">${atividade.nomeAtividade}</button></td>
										<td style='vertical-align: middle;'><fmt:formatDate value="${atividade.dataAtividade}" pattern="dd/MM/yyyy" /></td>
										<td style="vertical-align: middle; text-align: center;">
											<button class="btn btn-link collapsed" type="button" onclick="carregarTabelaAlterarNota(${atividade.idAtividade})" 
											data-toggle="collapse" data-target="#id_${atividade.idAtividade}" 
											aria-expanded="false">
												Alterar
											</button>
											<br>
											<a href="/educa-mais/atividade/remove?id=${turma.idTurma}&idAtividade=${atividade.idAtividade}">Remover</a>
										</td>
									</tr>
									<tbody id="tr_${atividade.idAtividade}" class="collapse">
									</tbody>
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
	<c:import url="/WEB-INF/view/modais/avisoAlunoObrigatorio.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAlterarUsuario.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAtividade.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/carregarTabelaAlterarNota.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/dataConverter.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/filtrarTabelaNota.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/veAtividade.js"></script>
	
    <script>
	    function carregarTabelaAlterarNota(idAtividade){
	    	carregaTabelaAlterarNota(idAtividade);
		}
	    
	    function verAtividade(idAtividade) {
	    	veAtividade(idAtividade);
	    }
	    
	    function carregaDiv() {
	    	$("#idAtividades").load(" #idAtividades");
	    }
	    
	    function validaAluno() {
	    	if($('#cadAtividade input[name=notaAluno]').length > 0) {
				$("#cadAtividade").submit();
			}else {
				$("#alunoObrigatorioModal").modal("show");	
			}
	    }
	    
		$(document).ready(function(){
			
    		$("#pesquisarAtividade").keyup(function() {
    			filtrarTabelaNota();
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