<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Educa+</title>
        
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fontawesome/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">

</head>
<body>
    
    <div class="container my-3 rounded">
        
        <div class="row p-3 pb-5">
            
            <div class="col-sm">
                
                <!-- LOGO -->
                <nav class="navbar navbar-expand-sm d-flex justify-content-center">
                    
               		<a class="logo" href="/educa-mais/usuario">
                  		<span class="h1">
                  			EDUCA+
						</span>
					</a>
                    
                </nav>
                
                <hr>
                
                <!-- CONTEÚDO -->
                <div class="row my-5 d-flex justify-content-center">
                    
                    <!-- FORMULÁRIO -->
                    <div class="col-lg-5">
                        
                        <!-- NAV -->
                        <ul class="nav nav-tabs nav-justified">
                            <li class="nav-item" id="loginNav">
                                <a class="nav-link active font-weight-bold " data-toggle="tab" href="#login">
                                    <span>
                                        Login
                                    </span>
                                </a>
                            </li>
                            <li class="nav-item" id="cadastroNav">
                                <a class="nav-link font-weight-bold " data-toggle="tab" href="#cadastro">
                                    <span>
                                        Cadastro
                                    </span>
                                </a>
                            </li>
                        </ul>
                        
                        <!-- FROM -->
                        <div class="tab-content bg-white">
                            
                            <!--Login-->
                            <div class="tab-pane container active border-right border-left shadow p-4" id="login">
                                
                                <form id="formularioLogin" method="post" action="autenticar">
                                	
                                	<c:if test="${not empty mensagem}">
                                		<div class="alert alert-danger">
                                			${mensagem}
                                		</div>
                                	</c:if>
									
									<!-- E-mail -->                                
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control w-75" id="emailLogin" name="email" placeholder="Digite o seu e-mail.." required>
                                    </div>
                                    
                                    <!-- Senha -->
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="senhaLogin" name="senha" placeholder="Digite a sua senha...">
                                    </div>
                                    
                                    <!-- Botões e links -->
                                    <a class="float-right mb-2" href="#"><i>Esqueceu a senha?</i></a><br>
                                    
                                    <button id="botaoEntrar" type="submit" class="btn  btn-lg btn-block">
                                        <span>
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
                            <div class="tab-pane container fade border-right border-left shadow p-4" id="cadastro">
                            	
                            	<form id="formularioCadastro" method="post" action="save">
                                    
                                    <!-- Nome -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white"><i class='fas fa-user'></i></span>
                                        </div>
                                        <input type="text" class="form-control w-75" id="nomeCadastro" name="nome" placeholder="Digite o seu nome...">
                                    </div>
                                    
                                    <!-- E-mail -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white">@</span>
                                        </div>
                                        <input type="email" class="form-control w-75" id="emailCadastro" name="email" placeholder="Digite o seu e-mail.." required>
                                    </div>
                                    
                                    <!-- Senha -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="senhaCadastro" name="senha" placeholder="Digite a sua senha...">
                                    </div>
                                    
                                    <!-- Confirmar Senha -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text  text-white"><i class='fas fa-lock'></i></span>
                                        </div>
                                        <input type="password" class="form-control w-75" id="confirmarSenhaCadastro" name="confirmarSenha" placeholder="Digite sua senha novamente...">
                                    </div>
                                    
                                    <!-- Botão -->
                                    <button id="botaoCadastrar" type="submit" class="btn  btn-lg btn-block">
                                        <span>
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
    <script src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
</body>
</html>