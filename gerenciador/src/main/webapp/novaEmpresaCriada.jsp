<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nova Empresa Criada</title>
</head>
<body>
	<!--Abstraindo o HTML do NovaEmpresaServlet  -->
	<%-- Empresa <%=nomeEmpresa %> cadastrada com sucesso; --%>
	
	<!--Utilizando Expressões de Linguagens  -->
	<c:if test="${not empty empresa}">
		Empresa ${empresa} cadastrada com sucesso!
	</c:if>
	
	<c:if test="${empty empresa }">
		Nenhuma empresa cadastrada!
	</c:if>
</body>
</html>