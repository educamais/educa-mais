<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="3; url=/educa-mais/<c:if test='${not empty link }'>${link}</c:if>">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min .js"></script>
</head>
<body >
	
<div class="d-flex justify-content-center mx-5 my-5">

	<h2 class=" text-danger">ola estou testanton${mensagem}</h2>
</div>

</body>
</html>