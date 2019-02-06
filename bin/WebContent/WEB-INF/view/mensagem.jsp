<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="3; url=/educa-mais/<c:if test='${not empty link }'>${link}</c:if>">
</head>
<body>
	<h1>${mensagem}</h1>
</body>
</html>