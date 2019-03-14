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
    <nav class="navbar bg-one border">
		<div class="container">

			<a class="navbar-brand p-0 font-2 font-weight-bold text-white" href="/educa-mais/usuario">EDUCA+</a>
			
			<a class="navbar-brand p-0 font-2 text-white" href="#">${turma.nomeTurma}</a>

			<div class="font-2">
				<a class="nav-link d-none d-sm-block p-0 text-center text-white" href="#">Código da Turma: ${turma.codigoTurma.toUpperCase()}</a>
			</div>
			
			<!-- Dropdown-->
			<div class="nav-item dropdown">
				<a class="nav-link dropdown-toggle p-0 font-2 text-white" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> ${usuario.nome} </a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
					<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
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
        
        <!-- MENU SECUNDÁRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link text-white bg-one border font-weight-bold" style="font-family:Gravity;" href="mural?id=${turma.idTurma}">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white bg-one border font-weight-bold" id="participanteTab" style="font-family:Gravity;" href="atividade?id=${turma.idTurma}">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-one border font-weight-bold" style="font-family:Gravity;" href="desempenho?idTurma=${turma.idTurma}">
                    Desempenho
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white bg-one border font-weight-bold" style="font-family:Gravity;" href="participantes?id=${turma.idTurma}">
                    Participantes
                </a>
            </li>
        </ul>
	
		<div class="container border shadow">
		  
			<div class="mb-5 p-5">
				<div class="card">
				
					<div class="card-header bg-two mb-0 text-center" data-toggle="collapse" data-target="#desempenhoGeral" aria-expanded="true">
						<span class="font-weight-bold text-white" style="font-family: Gravity;">Desempenho Individual</span>
					</div>
					<div id="desempenhoGeral" class="collapse">
						<div class="card-body">
				
							<div class="d-flex justify-content-center mx-auto mb-3">
								<div class="col-9">
									<input type="text" id="pesquisarNome" class="form-control form-control-lg text-center" placeholder="Pesquisar..." required>
								</div>
							</div>
							
							<div class="grafico">
								
								<canvas id="myChart"></canvas>
								
							</div>
							
							<table class="table table-striped">
								<thead class="bg-two text-white">
									<tr>
										<th scope="col">Nome</th>
										<th scope="col">Nota</th>
									</tr>
								</thead>
								<tbody id="ranking">
									<c:forEach var="alunoNota" items="${listaAlunoNota}">
										<tr onclick="desempenho(${alunoNota[0].idUsuario})">
											<td>${alunoNota[0].nome.toUpperCase()}</td>
											<td>${alunoNota[1]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col">
									<h5>Média da turma: &nbsp;<span id="desempenhoGeralMedia"></span></h5>
								</div>
								<div class="col">
									<h5>Total da turma: &nbsp;<span id="desempenhoGeralTotal"></span></h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="card">
				
					<div class="card-header bg-two text-center" data-toggle="collapse" data-target="#desempenhoAtividade" aria-expanded="true">
						<span class="font-weight-bold text-white mb-0" style="font-family: Gravity;">Desempenho por Atividade</span>
					</div>
					<div id="desempenhoAtividade" class="collapse">
						<div class="card-body">
				
							<c:forEach var="atividade" items="${listaAtividade}">
								<div class="card" onclick="verAtividade(${atividade.idAtividade})">
									<div class="card-header" data-toggle="collapse" data-target="#atividade_${atividade.idAtividade}" aria-expanded="true">
										<h5 class="mb-0">
											<button class="btn btn-link" type="button">
												${atividade.nomeAtividade}
											</button>
										</h5>
									</div>
									
									<div  id="atividade_${atividade.idAtividade}" class="collapse">
										<table class="table table-striped">
											<thead>
												<tr>
													<th scope="col" colspan="2">Nome</th>
													<th scope="col">Nota</th>
												</tr>
											</thead>
											<tbody id="tr_${atividade.idAtividade}">
												
											</tbody>
										</table>
										<div class="row">
											<div class="col">
												<h5>Média da atividade: &nbsp;<span id="desempenhoAtividadeMedia"></span></h5>
											</div>
											<div class="col">
												<h5>Total da atividade: &nbsp;<span id="desempenhoAtividadeTotal"></span></h5>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<input type="hidden" value="${turma.idTurma}" id="idTurma">
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	
	<script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormAlterarUsuario.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/filtrarTabelaRanking.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/veAtividade.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/js/Chart.min.js"></script>
	<script>
	
	function desempenho(id){
		var idUsuario = id;
		var idTurma = $("#idTurma").val();
	
		$.post("/educa-mais/atividade/atividades",{
			
			idUsuario : idUsuario,
			idTurma : idTurma
			
		}, function(atividades) {
			
			var data = [];
			var labels = [];
			
			atividades.forEach(function(atividade, index) {
				data[index] = atividade.nota;
				labels[index] = atividade.atividade.nomeAtividade;
			});
			
			var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: labels,
			        datasets: [{
			            label: 'Desempenho nas atividades',
			            data: data,
			            borderWidth: 2
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
		});
	}
	
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: [""],
	        datasets: [{
	            label: 'Desempenho nas atividades',
	            data: [0, 0, 0, 0, 0, 0],
	            borderWidth: 2
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	</script>
	
    <script>
	    function verAtividade(idAtividade) {
	    	veAtividade(idAtividade);
	    }
    
		$(document).ready(function(){
			
			
			var arrayNota = $("#ranking tr td:last-child").text().split(".");
			var soma = 0;
				
			arrayNota.forEach(function(index){
				soma += parseInt(index);
			});
			if(!(isNaN(soma))){
				$("#desempenhoGeralTotal").text(soma.toFixed(1));
				$("#desempenhoGeralMedia").text(soma/arrayNota.length);
			}
			
			
    		$("#pesquisarNome").keyup(function() {
    			filtrarTabelaRanking();
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