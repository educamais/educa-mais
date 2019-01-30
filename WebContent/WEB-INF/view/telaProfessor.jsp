<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Educa+</title>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
    <!--******************************************************SCRIPT BOOTSTRAP*****************************************8-->
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
        	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">

    <script src="<%=request.getContextPath()%>/resources/js/tabPane.js"></script>
    
    
</head>

<body>
    
    <!-- MENU PRINCIPAL -->
    <nav class="navbar bg-white border">
        <div class="container">
            
            <a class="logo" href="#">
                <span class="text-roxo">
                    Educa+
                </span>
            </a>
            
            <div class="row font-3">
                
                <a class="nav-link d-none d-sm-block text-roxo" href="#">1926 pts</a>
                
                <!-- Dropdown-->
                <div class="nav-item dropdown">
                    
                    <a class="nav-link dropdown-toggle text-roxo" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        Gabriel Neves
                    </a>
                    
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item font-1" href="#">Home</a>
                        <a class="dropdown-item font-1" href="#">Minhas Turmas</a>
                        <a class="dropdown-item d-sm-none font-1" href="#">Ranking</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item font-1" href="#">Alterar Nome</a>
                        <a class="dropdown-item font-1" href="#">Alterar Senha</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item font-1" href="#">Sair</a>
                    </div>
                    
                </div>
            </div>
        </div>
    </nav>
    <div class="container my-5">
        
        <!-- MENU SECUNDÁRIO -->
        <ul class="nav nav-tabs nav-justified" id="lista-menu">
            <li class="nav-item">
                <a class="nav-link active border active font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#mural">
                    Mural
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#atividades">
                    Atividades
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  border font-weight-bold" style="font-family:Gravity;" data-toggle="tab" href="#participantes">
                    Participantes
                </a>
            </li>
        </ul>
        
        <!-- CORPO DO SITE -->
        <div class="tab-content bg-white">
            
            <!-- MURAL -->
            <div class="tab-pane fade container border shadow p-4" id="mural">
                
                <div class="capsula border mb-5">
                    
                    <!-- CADASTRO DE MATERIAIS -->
                    <form class="p-2">
                        <div class="row mb-2">
                            <div class="form-group col-sm-8">
                                <input type="text" class="form-control" placeholder="T I T U L O">
                            </div>
                            <div class="col-sm-4">
                                <button class="btn btn-rosa btn-block">Lista de alunos</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="3" style="resize:none;"></textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-rosa btn-block">Publicar</button>
                        </div>
                    </form>
                </div>
                
                <!-- FEED 1 -->
                <div class="capsula mb-4">
                    
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab">
                                Professor 1 - Titulo da publicação
                            </a>
                        </li>
                    </ul>
                    
                    
                    <div class="card gedf-card">
                        
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Editar</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Excluir</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <p class="card-text">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos ipsa praesentium esse magnam nemo dolor
                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                            </p>
                        </div>
                        
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <button class="btn btn-azulc">Ler mais-></button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                <!-- FEED 2 -->
                
                <div class="capsula mb-3">
                    
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab">
                                Professor 2 - Titulo da publicação
                            </a>
                        </li>
                    </ul>
                    
                    <div class="card gedf-card">
                        
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Editar</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Excluir</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <div class="row">
                                <div class="col-4">
                                    <div class="row mb-2">
                                        <div class="col-6">
                                            <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16807d8b30d%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16807d8b30d%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2272%22%20y%3D%22105.1%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" class="img-fluid img-thumbnail">
                                        </div>
                                        <div class="col-6">
                                            <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16807d8b30d%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16807d8b30d%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2272%22%20y%3D%22105.1%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" class="img-fluid img-thumbnail">
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-6">
                                            <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16807d8b30d%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16807d8b30d%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2272%22%20y%3D%22105.1%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" class="img-fluid img-thumbnail">
                                        </div>
                                        <div class="col-6">
                                            <img src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16807d8b30d%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16807d8b30d%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2272%22%20y%3D%22105.1%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" class="img-fluid img-thumbnail">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <p class="card-text">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos ipsa praesentium esse magnam nemo dolor
                                        sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <button class="btn btn-azulc">Ler mais-></button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            
            <!-- ATIVIDADES -->
            <div class="tab-pane fade container border shadow p-4" id="atividades">
                
                <div class="capsula mb-5">
                    
                    <button class="btn btn-rosa float-right my-3 mb-5">Cadastrar Atividade</button>
                    
                    <table class="table table-striped">
                        <thead class="thead-rosa">
                            <tr>
                                <th scope="col">
                                    Nome &nbsp; 
                                    <i class="fas fa-sort"></i>
                                </th>
                                <th scope="col">
                                    Data &nbsp;
                                    <i class="fas fa-sort"></i>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                            <tr>
                                <td>Atividade 1</td>
                                <td>10/07/2018</td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
            </div>
            
            <!-- PARTICIPANTES -->
            <div class="tab-pane container active border shadow p-4" id="participantes">
                
                <div class="capsula mb-5">
                    
                    <div class="row">
                        
                        <!-- TABELA PROFESSORES -->
                        <div class="col-sm-6">
                            
                            <h1 class="text-center">Professores</h1>
                            
                            <table class="table table-striped">
                                
                                <thead class="thead-rosa">
                                    <tr>
                                        <th scope="col">
                                            Nome &nbsp; 
                                            <i class="fas fa-sort"></i>
                                        </th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                        <td>LUCAS FRANCISCO XAVIER DE LUNA</td>
                                    </tr>
                                    <tr>
                                        <td>KEYLA MARIA DA SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>SÁVIO FELIPE ALVES DE AZEVEDO</td>
                                    </tr>
                                    <tr>
                                        <td>SÁVIO FELIPE ALVES DE AZEVEDO</td>
                                    </tr>
                                    <tr>
                                        <td>ROBERTA DE MOURA SANTOS</td>
                                    </tr>
                                    <tr>
                                        <td>DRYELLEN CRIS DE ALBUQUERQUE MONTARROYOS</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                        
                        <!-- TABELA ALUNOS -->
                        <div class="col-sm-6">
                            
                            <h1 class=" text-center">Alunos</h1>
                            
                            <table class="table table-striped">
                                
                                <thead class="thead-rosa">
                                    <tr>
                                        <th scope="col">
                                            Nome &nbsp; 
                                            <i class="fas fa-sort"></i>
                                        </th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr>
                                        <td>JUNIO HENRIQUE DE MELO</td>
                                    </tr>
                                    <tr>
                                        <td>ANDREZA FREITAS DOS SANTOS</td>
                                    </tr>
                                    <tr>
                                        <td>CAMILA MARIA FREIRE NECO</td>
                                    </tr>
                                    <tr>
                                        <td>WELLINGTON PEREIRA DO NASCIMENTO</td>
                                    </tr>
                                    <tr>
                                        <td>KETINI MARIA JOSE DA SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>ROBSON ITALO SILVA DA CRUZ</td>
                                    </tr>
                                    <tr>
                                        <td>JONATAS VAGNER DE BRITO NASCIMENTO</td>
                                    </tr>
                                    <tr>
                                        <td>MIRELLA PRISCILA SILVESTRE DA SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>CARLA BEATRIZ FERREIRA DA SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>MARIA VITÓRIA CARDOSO NASCIMENTO</td>
                                    </tr>
                                    <tr>
                                        <td>EWERTON HENRIQUE JOSÉ BORTOLETTO SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>RICKELLEM MARIA DE LIMA SILVA</td>
                                    </tr>
                                    <tr>
                                        <td>CASSIANE FERREIRA DOS SANTOS</td>
                                    </tr>
                                    
                                </tbody>
                                
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
 
    
</body>

</html>