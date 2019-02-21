<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min .js"></script>

<style>
#n2{
margin-top:10px;
color:#54A4A6;

}

#n{
margin-top:10px;
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
<body>


	<div class="d-flex justify-content-center">

		<img alt="" class="img-fluid" src="<%=request.getContextPath()%>/resources/img/oops.png"/>
	</div>
	<div class="d-flex justify-content-center">
	
	<h1 id="n">ERROR &nbsp;</h1>
	</div> 
	<div class="d-flex justify-content-center">
	<h1 id="n2"> Não Especificado.</h1>
	
	</div>
	<hr id="linha">
	
</body>
</html>