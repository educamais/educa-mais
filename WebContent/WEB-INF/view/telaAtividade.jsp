<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Educa+</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>
<body>

	<!-- MENU PRINCIPAL -->
	<nav class="navbar bg-white border">
		<div class="container">

			<a class="logo" href="/educa-mais/usuario"><span
				class="text-roxo"> <img alt=""
					class="rounded mx-auto d-block"
					src="<%=request.getContextPath()%>/resources/img/logo3.png"
					width="70" height="70" />
			</span>
			</a>
            </nav>
            
            <br><br>
					<div class="col-lg-5">

						<!-- NAV -->
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item" id="loginNav"><a
								class="nav-link active font-weight-bold text-roxo"
								data-toggle="tab" href="#login"> <span
									style="font-family: Gravity;"> Cadastrar Atividade </span>

							</a></li>

						</ul>
						<br> <br>
						
						
                   <!-- FORMULÁRIO -->
                   
                       <form>
						<div>
							<input type="nomeAtividade" id="newsletternomeAtividadeInput"
								name="nomeAtividade"
								class="form-input newsletter-input-nomeAtividade" required=""
								placeholder="Nome da Atividade" size="30">
						</div>
						<br> <br>
						

						<div>
							<label for="diaa">Data da Atividade:</label><input type="date"
								id="diaa" name="diaa">
						</div>
                        <br> <br>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Nome</th>
									<th scope="col">Nota</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								   <td scope="row">1</td>
								    <td>João Victor</td>
									<td>Thornton</td>
								
								</tr>
								
								
								<tr>
								<td scope="row">2</td>
								<td>João Victor</td>
								<td>Thornton</td>
                                </tr>
                                
                                
								<tr>
								<td scope="row">3</td>
								<td>João Victor</td>
								<td>Thornton</td>
								</tr>
								
								<tr>
								<td scope="row">4</td>
								<td>João Victor</td>
								<td>Thornton</td>
								</tr>
								
								<tr>
								<td scope="row">5</td>
								<td>João Victor</td>
								<td>Thornton</td>
								</tr>
								
								<tr>
								<td scope="row">6</td>
								<td>João Victor</td>
								<td>Thornton</td>
								</tr>
							</tbody>
						</table>


					</form>
					
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>		
				
</body>
</html>