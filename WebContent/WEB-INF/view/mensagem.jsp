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

	<style>
#n2{
margin-top:10px;
color:#54A4A6;

}

#n{

color:#FF7058;

}
#mensagem{

color:#666666;
}
#linha{
      border-top: 3px dashed #666666;
      color: #fff;
      background-color: #fff;
      height: 4px;
      width: 30%;
    
    }
</style>
</head>
<body >
	<div class="d-flex justify-content-center">
	
			<img alt="" class="img-fluid" src="<%=request.getContextPath()%>/resources/img/oops.png"/>
	</div>
	<div class="d-flex justify-content-center mx-5 my-5">
	
		<h1 id="n">${mensagem}</h1>
	</div>

</body>
</html>