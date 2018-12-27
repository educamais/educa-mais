<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<h1>Login</h1>
	<hr>
	<p>${mensagem }</p>
	<form action="autenticar" method="post">
	<input type="text" name="email" required>
	<input type="password" name="senha" required>
	<button type="submit">Enviar</button>
	</form>
</body>
</html>