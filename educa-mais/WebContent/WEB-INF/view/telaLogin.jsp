<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Educa+</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/telaLogin/style.css">
    <script src="<%=request.getContextPath()%>/resources/telaLogin/script.js"></script>
    <!-- Ícones -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <!-- JQuery -->
    <script src="<%=request.getContextPath()%>/resources/telaLogin/jquery.js"></script>
    
</head>
<body>
    <div class="container my-5 ctp-0 rounded">
        
        <div class="row p-3 pb-5">
            
            <div class="col-sm">
                
                <!-- LOGO -->
                <nav class="navbar navbar-expand-sm d-flex justify-content-center">
                    
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <h1 class="display-1 text-roxo" style="font-family:Meatloaf;">
                                Educa+
                            </h1>
                        </li>
                    </ul>
                    
                </nav>
                
                <hr class="bg-roxo">
                
                <!-- CONTEÚDO -->
                <div class="row align-items-center">
                    
                    <div class="col-sm d-none d-sm-block">
                        <p id="text">
                            <span class="text-crosa" style="font-size:10px">didática</span>
                            <span class="text-crosa" style="font-size:15px">Socialização</span>
                            <span class="text-clilas" style="font-size:20px">Aprendizagem</span>
                            <span class="text-croxo">videos</span>
                            <span class="text-croxo" style="font-size:20px">Cultura</span>
                            <span class="text-cazule">verdade</span>
                            <span class="text-cazulc">
                                descobrimento
                                viagem
                            </span>
                            <span class="text-crosa" style="font-size:20px">Educação</span>
                            <span class="text-clilas" style="font-size:10px">Tutorial</span>
                            <span class="text-clilas">televisão</span>
                            <span class="text-croxo" style="font-size:15px">Ensino</span>
                            <span class="text-croxo">jornal</span>
                            <span class="text-croxo" style="font-size:20px">Comunicação</span>
                            <span class="text-cazule">youtube</span>
                            <span class="text-cazulc" style="font-size:20px">Ciência</span>
                            <span class="text-cazulc" style="font-size:10px">visualização</span>
                            <span class="text-crosa">
                                blogs
                                wiki
                            </span>
                            <span class="text-clilas" style="font-size:10px">interface</span>
                            <span class="text-clilas" style="font-size:20px">Usabilidade</span>
                            <span class="text-croxo">rádio</span>
                            <span class="text-croxo" style="font-size:20px">Interação</span>
                            <span class="text-croxo">escola</span>
                            <span class="text-cazule" style="font-size:15px">Cooperação</span>
                            <span class="text-cazulc" style="font-size:20px">Experiência</span>
                            <span class="text-crosa">
                                cursos
                            </span>
                            <span class="text-clilas">conversa</span>
                            <span class="text-clilas" style="font-size:15px">Superar</span>
                            <span class="text-clilas" style="font-size:20px">Tecnologia</span>
                            <span class="text-croxo" style="font-size:20px">Conhecimento</span>
                            <span class="text-cazule">quadrinhos</span>
                            <span class="text-cazulc">dicionário</span>
                            <span class="text-cazulc" style="font-size:15px">Arte</span>
                            <span class="text-crosa" style="font-size:10px">Liberdade</span>
                            <span class="text-clilas">
                                música
                                podcast
                            </span>
                            <span class="text-clilas" style="font-size:20px">Disciplina</span>
                            <span class="text-clilas">revistas</span>
                            <span class="text-croxo" style="font-size:10px">Respeito</span>
                            <span class="text-cazule">histórias</span>
                            <span class="text-cazule" style="font-size:15px">Emoção</span>
                            <span class="text-cazulc" style="font-size:18px">Razão</span>
                        </p>
                    </div>
                    
                    <!-- FORMULÁRIO -->
                    <div class="col-sm-5">
                        
                        <!-- NAV -->
                        <ul class="nav nav-tabs nav-justified">
                            <li class="nav-item">
                                <a class="nav-link font-weight-bold text-roxo" data-toggle="tab" href="#login">
                                    <span style="font-family:Gravity;">
                                        Login
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active font-weight-bold text-roxo" data-toggle="tab" href="#cadastro">
                                    <span style="font-family:Gravity;">
                                        Cadastro
                                    </span>
                                </a>
                            </li>
                        </ul>
                        
                        
                        <div class="tab-content bg-white">
                            
                            <!--Login-->
                            <div class="tab-pane container fade border shadow p-4" id="login">
                                
                                <!-- MENSAGEM DE ERRO -->
                                <c:if test="${not empty mensagem}">
                                	<div class="alert alert-danger" role="alert"> ${mensagem }</div> 
                                </c:if>
                                
                                <!-- FORMULÁRIO -->
                                <form action="autenticar" method="post">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control" name="email" placeholder="Digite o seu e-mail.." required>
                                    </div>
                                    
                                    <div class="input-group mb-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control" name="senha" placeholder="Digite a sua senha..." required>
                                    </div>
                                    
                                    <!-- BOTÕES -->
	                                <a class="float-right text-roxo mb-2" href="#"><i>Esqueceu a senha?</i></a><br>
	                                <button type="submit" class="btn btn-roxo btn-lg btn-block">
	                                    <span style="font-family:Gravity;">
	                                        Entrar
	                                    </span>
	                                </button>
                                    
                                </form>
                                
                                <!-- ÍCONES -->
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
                            <div class="tab-pane container active border shadow p-4" id="cadastro">
                                
                                <!-- MENSAGEM DE ERRO -->
                                <c:if test="${not empty mensagem}">
                                	<div class="alert alert-danger" role="alert"> ${mensagem }</div> 
                                </c:if>
                                
                                <!-- FORMULÁRIO -->
                                <form action="save" method="post">
                                    
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text text bg-roxo text-white"><i class='fas fa-user'></i></span>
                                        </div>
                                        <input type="text" class="form-control" name="nome" placeholder="Digite o seu nome.." required>
                                    </div>
                                    
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control" name="email" placeholder="Digite o seu e-mail.."  required>
                                    </div>
                                    
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control" name="senha" placeholder="Digite a sua senha..." required>
                                    </div>
                                    
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-roxo text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control" name="confirmarSenha" placeholder="Digite sua senha novamente..." required>
                                    </div>
                                    
                                    <!-- BOTÃO -->
	                                <button type="submit" class="btn btn-roxo btn-lg btn-block">
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
</body>
</html>