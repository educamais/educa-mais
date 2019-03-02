<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Educa+</title>
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/telaLoginStyle/style.css">    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fontawesome/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">

</head>
<body class="bg-cf">
    
    <div class="container my-5 ctp-0 rounded">
        
        <div class="row p-3 pb-5">
            
            <div class="col-sm">
                
                <!-- LOGO -->
                <nav class="navbar navbar-expand-sm d-flex justify-content-center">
                    
               		<a class="logo" href="/educa-mais/usuario">
                  		<span class="text-roxo">
                  			<img alt="" class="rounded mx-auto d-block" src="<%=request.getContextPath()%>/resources/img/logo3.png" width="20%" height="20%" />
						</span>
					</a>
                    
                </nav>
                
                <hr class="bg-roxo">
                
                <!-- CONTEÚDO -->
                <div class="row align-items-center">
                    
                    <div class="col-lg d-none d-lg-block">
                        <p id="text">
                            <span class="text-verde" style="font-size:10px">didática</span>
                            <span class="text-verde" style="font-size:15px">Socialização</span>
                            <span class="text-clilas" style="font-size:20px">Aprendizagem</span>
                            <span class="text-azul">videos</span>
                            <span class="text-azul" style="font-size:20px">Cultura</span>
                            <span class="text-cazule">verdade</span>
                            <span class="text-cazulc">
                                descobrimento
                                viagem
                            </span>
                            <span class="text-verde" style="font-size:20px">Educação</span>
                            <span class="text-clilas" style="font-size:10px">Tutorial</span>
                            <span class="text-clilas">televisão</span>
                            <span class="text-azul" style="font-size:15px">Ensino</span>
                            <span class="text-azul">jornal</span>
                            <span class="text-azul" style="font-size:20px">Comunicação</span>
                            <span class="text-cazule">youtube</span>
                            <span class="text-cazulc" style="font-size:20px">Ciência</span>
                            <span class="text-cazulc" style="font-size:10px">visualização</span>
                            <span class="text-verde">
                                blogs
                                wiki
                            </span>
                            <span class="text-clilas" style="font-size:10px">interface</span>
                            <span class="text-clilas" style="font-size:20px">Usabilidade</span>
                            <span class="text-azul">rádio</span>
                            <span class="text-azul" style="font-size:20px">Interação</span>
                            <span class="text-azul">escola</span>
                            <span class="text-cazule" style="font-size:15px">Cooperação</span>
                            <span class="text-cazulc" style="font-size:20px">Experiência</span>
                            <span class="text-verde">
                                cursos
                            </span>
                            <span class="text-clilas">conversa</span>
                            <span class="text-clilas" style="font-size:15px">Superar</span>
                            <span class="text-clilas" style="font-size:20px">Tecnologia</span>
                            <span class="text-azul" style="font-size:20px">Conhecimento</span>
                            <span class="text-cazule">quadrinhos</span>
                            <span class="text-cazulc">dicionário</span>
                            <span class="text-cazulc" style="font-size:15px">Arte</span>
                            <span class="text-verde" style="font-size:10px">Liberdade</span>
                            <span class="text-clilas">
                                música
                                podcast
                            </span>
                            <span class="text-clilas" style="font-size:20px">Disciplina</span>
                            <span class="text-clilas">revistas</span>
                            <span class="text-azul" style="font-size:10px">Respeito</span>
                            <span class="text-cazule">histórias</span>
                            <span class="text-cazule" style="font-size:15px">Emoção</span>
                            <span class="text-cazulc" style="font-size:18px">Razão</span>
                        </p>
                    </div>
                    
                    <!-- FORMULÁRIO -->
                    <div class="col-lg-5">
                        
                        <!-- NAV -->
                        <ul class="nav nav-tabs nav-justified">
                            <li class="nav-item" id="loginNav">
                                <a class="nav-link active font-weight-bold text-roxo" data-toggle="tab" href="#login">
                                    <span style="font-family:Gravity;">
                                        Login
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item" id="cadastroNav">
                                <a class="nav-link font-weight-bold text-roxo" data-toggle="tab" href="#cadastro">
                                    <span style="font-family:Gravity;">
                                        Cadastro
                                    </span>
                                </a>
                            </li>
                        </ul>
                        
                        <!-- FROM -->
                        <div class="tab-content bg-white">
                            
                            <!--Login-->
                            <div class="tab-pane container active border shadow p-4" id="login">
                                
                                <form id="formLogin" method="post" action="autenticar">
                                	<c:if test="${not empty mensagem}">
                                		<div class="alert alert-danger">
                                			${mensagem}
                                		</div>
                                	</c:if>
									
									<!-- E-mail -->                                
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control w-75" id="emailLogin" name="email" placeholder="Digite o seu e-mail.." required>
                                    </div>
                                    
                                    <!-- Senha -->
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="senhaLogin" name="senha" placeholder="Digite a sua senha...">
                                    </div>
                                    
                                    <!-- Botões e links -->
                                    <a class="float-right text-roxo mb-2" href="#"><i>Esqueceu a senha?</i></a><br>
                                    
                                    <button id="botaoEntrar" type="submit" class="btn btn-roxo btn-lg btn-block">
                                        <span style="font-family:Gravity;">
                                            Entrar
                                        </span>
                                    </button>
                                    
                                </form>
                                
                                <div class="row justify-content-md-center">
                                    <div class="col-md-6 text-center my-2">
                                        OU
                                        <div class="row">
                                            <div class="col">
                                                <i class="fab fa-facebook-square text-primary" style="font-size: 48px;"></i>
                                            </div>
                                            <div class="col">
                                                <i class="fab fa-google-plus-square text-danger" style="font-size: 48px;"></i>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                
                            </div>
                            
                            <!--Cadastro-->
                            <div class="tab-pane container fade border shadow p-4" id="cadastro">
                            	
                            	<form id="formCadastro" method="post" action="save">
                                    
                                    <!-- Nome -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-user'></i></span>
                                        </div>
                                        <input type="text" class="form-control w-75" id="nomeCadastro" name="nome" placeholder="Digite o seu nome...">
                                    </div>
                                    
                                    <!-- E-mail -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control w-75" id="emailCadastro" name="email" placeholder="Digite o seu e-mail.." required>
                                    </div>
                                    
                                    <!-- Senha -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="senhaCadastro" name="senha" placeholder="Digite a sua senha...">
                                    </div>
                                    
                                    <!-- Confirmar Senha -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="confirmarSenhaCadastro" name="confirmarSenha" placeholder="Digite sua senha novamente...">
                                    </div>
                                    
                                    <!-- Botão -->
                                    <button id="botaoCadastrar" type="submit" class="btn btn-roxo btn-lg btn-block">
                                        <span style="font-family:Gravity;">
                                            Cadastrar
                                        </span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="<%=request.getContextPath()%>/resources/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/Validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/localization/messages_pt_BR.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/additional-methods.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/Validation/created/validationFormIndex.js"></script>
</body>
</html>