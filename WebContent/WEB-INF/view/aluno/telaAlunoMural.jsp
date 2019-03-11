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

			<a class="navbar-brand p-0" href="/educa-mais/usuario">
				<img src="<%=request.getContextPath()%>/resources/img/logo3.png" width="100"/>
			</a>

			<div class="font-2">
				<a class="nav-link d-none d-sm-block p-0 text-center" href="/educa-mais/aluno/ranking?idTurma=${turma.idTurma}">Minha Pontuação: ${pontuacao.get(0)}</a>
			</div>

			<div class="row font-2">

				<!-- Dropdown-->
				<div class="nav-item dropdown">

					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						 ${usuario.nome}
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-1" href="/educa-mais/usuario">Home</a>
						<a class="dropdown-item font-1" href="/educa-mais/turma/minhasturmas">Minhas Turmas</a>
						<a class="dropdown-item d-sm-none font-1" href="/educa-mais/aluno/ranking?idTurma=${turma.idTurma}">Ranking</a>
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

		<!-- MENU SECUNDÁRIO -->
		<ul class="nav nav-tabs nav-justified" id="lista-menu">
			<li class="nav-item">
				<a class="nav-link border font-weight-bold" style="font-family: Gravity;" href="#">
					Mural
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/atividades?id=${turma.idTurma}">
					Atividades
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link border font-weight-bold" style="font-family: Gravity;" href="/educa-mais/aluno/participantes?id=${turma.idTurma}">
					Participantes
				</a>
			</li>
		</ul>

		<!-- CORPO DO SITE -->
		<div class="tab-content bg-white">

			<div class="tab-pane container active border shadow p-4" id="mural">

				<!-- FEED 3 -->
				<div class="capsula" id="feed">
                <c:forEach var="postagem" items="${listaPostagem}">
	                <div class="mb-3 feed" id="id_${postagem.idPostagem}">
	                    
	                    <ul class="nav nav-tabs">
	                        <li class="nav-item">
	                            <a class="nav-link border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" id="titulo_postagem">
	                                ${postagem.tituloPostagem}
	                            </a>
	                        </li>
	                    </ul>
	                    
	                    <div class="card gedf-card">
	                        
	                        <div class="card-body"  id="descricao_postagem">
	                        	
	                        	<div class="row">
	                                <div class="p-1">
	                                    <p class="card-text">
											${ postagem.descricaoPostagem}
	                                    </p>
	                                </div>
	                            </div>
	                        	
	                            <div class="row">
	                            	
	                            	<c:if test="${not empty postagem.listaArquivo}">
										<c:forEach var="arquivo" items="${postagem.listaArquivo}">
			                           		<div class="col-6 col-lg-2 my-2">
												<c:choose>
			                                    	<c:when test="${arquivo.arquivo.endsWith('.png') || arquivo.arquivo.endsWith('.jpg') || arquivo.arquivo.endsWith('.jpeg')}">
			                                        	<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
			                                            	<img src="<%=request.getContextPath()%>/resources/img/image.png" class="img-fluid img-thumbnail">
			                                            </a>
			                                        </c:when>
			                                        <c:when test="${arquivo.arquivo.endsWith('.pdf') || arquivo.arquivo.endsWith('.doc') || arquivo.arquivo.endsWith('.docx') || arquivo.arquivo.endsWith('.odt') || arquivo.arquivo.endsWith('.xlsx') || arquivo.arquivo.endsWith('.ods') || arquivo.arquivo.endsWith('.pptx') || arquivo.arquivo.endsWith('.ppt') || arquivo.arquivo.endsWith('.odp')}">
			                                           	<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
			                                           		<img src="<%=request.getContextPath()%>/resources/img/doc.png" class="img-fluid img-thumbnail">
			                                           	</a>
			                                        </c:when>
			                                        <c:otherwise>
			                                          	<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">
			                                           		<img src="<%=request.getContextPath()%>/resources/img/docUnknow.png" class="img-fluid img-thumbnail">
			                                           	</a>
			                                        </c:otherwise>
			                                    </c:choose>
											</div>
		                                </c:forEach>
	                                </c:if>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${turma.idTurma }" id="idTurma">
	<c:import url="/WEB-INF/view/modais/alterarNome.jsp"/>
	<c:import url="/WEB-INF/view/modais/alterarSenha.jsp"/>
	
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
    
    <script>
    
    var page = 0;
    
	$(window).scroll(function () {
		
        if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
        	
        	console.log($(".feed").length+" = "+page);
        	
        	if($(".feed").length >= page+5){
        	
            $.get("/educa-mais/alunopostagem",{
            	"idTurma" : $("#idTurma").val(),
            	'inicio' : page += 5
            },function(postagem){
            	
            	$(postagem).each(function (i) {
            		var linhas = '';
            		linhas += '<div class="mb-3 feed" id="id_'+postagem[i].idPostagem+'">';
            		linhas += '<ul class="nav nav-tabs">';
            		linhas += '<li class="nav-item">';
            		linhas += '<a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab" id="titulo_postagem">';
            		linhas += postagem[i].tituloPostagem;
            		linhas += '</a>';
            		linhas += '</li>';
            		linhas += '</ul>';
                    
            		linhas += '<div class="card gedf-card">';
            		linhas += '<div class="card-body"  id="descricao_postagem">';
            		linhas += '<div class="float-right">';
            		linhas += '<button type="button" class="btn btn-link dropdown-toggle p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
            		linhas += '<i class="fa fa-ellipsis-h"></i>';
            		linhas += '</button>';
            		linhas += '<div class="dropdown-menu">';
            		linhas += '<button class="btn btn-link dropdown-item" type="button" onclick="alterarPostagem('+postagem[i].idPostagem+', '+idTurma+', '+postagem[i].turma.professor.idUsuario+')">Editar</button>';
            		linhas += '<div class="dropdown-divider"></div>';
            		linhas += '<a class="dropdown-item" href="/educa-mais/postagem/remove?id='+postagem[i].idPostagem+'">Excluir</a>';
            		linhas += '</div>';
            		linhas += '</div>';
            		linhas += '<div class="row">';
            		linhas += '<div class="p-1">';
            		linhas += '<p class="card-text">';
            		linhas += postagem[i].descricaoPostagem;
            		linhas += '</p>';
            		linhas += '</div>';
            		linhas += '</div>';
            		linhas += '<div class="row">';
                            
                    if (postagem[i].listaArquivo.length > 0){
                    	
                    	postagem[i].listaArquivo.forEach(function(arquivo){
                    		
                    		linhas += '<div class="col-6 col-lg-2 mb-1">';
                    		
                    		if(arquivo.arquivo.endsWith('.png') || arquivo.arquivo.endsWith('.jpg') || arquivo.arquivo.endsWith('.jpeg')){
                    			linhas += "<a href='<%=request.getContextPath()%>/resources/img/upload/"+arquivo.arquivo+"' download='"+arquivo.arquivo+"'>";
                    			linhas += '<img src="<%=request.getContextPath()%>/resources/img/image.png" class="img-fluid img-thumbnail">';
                    			linhas += '</a>';
                           	} else if(arquivo.arquivo.endsWith('.pdf') || arquivo.arquivo.endsWith('.doc') || arquivo.arquivo.endsWith('.docx') || arquivo.arquivo.endsWith('.odt') || arquivo.arquivo.endsWith('.xlsx') || arquivo.arquivo.endsWith('.ods') || arquivo.arquivo.endsWith('.pptx') || arquivo.arquivo.endsWith('.ppt') || arquivo.arquivo.endsWith('.odp')){
                           		linhas += '<a href="<%=request.getContextPath()%>/resources/img/upload/'+arquivo.arquivo+'" download="'+arquivo.arquivo+'">';
                               	linhas += '<img src="<%=request.getContextPath()%>/resources/img/doc.png" class="img-fluid img-thumbnail">';
                               	linhas += '</a>';
                            } else {
                            	linhas += '<a href="<%=request.getContextPath()%>/resources/img/upload/'+arquivo.arquivo+'" download="'+arquivo.arquivo+'">';
                            	linhas += '<img src="<%=request.getContextPath()%>/resources/img/docUnknow.png" class="img-fluid img-thumbnail">';
                            	linhas += '</a>';
                            }
                    		linhas += '</div>';
                    	});
                    }
                    linhas += '</div>';
                    linhas += '</div>';
                    linhas += '</div>';
                    linhas += '</div>';
                    
                    if($("#feed:last"))
                    $("#feed").append(linhas);
            	});
            });
        }
        }
    });
    </script>
    
</body>
</html>