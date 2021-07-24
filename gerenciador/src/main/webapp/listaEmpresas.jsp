<!--Java Standard TagLib  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!--Abstraindo o HTML do ListaEmpresasServlet, ou seja estamos dividindo responsabilidades  -->
	
	<!--O NovaEmpresaServlet está conectado ao JSP novaEmpresaCriada. Vamos alterar logo abaixo  -->
	<c:if test="${not empty empresa }">
		Empresa ${empresa} cadastrada com sucesso!
	</c:if>
	
	Lista de empresas: <br/>
	
	<!-- Para usarmos Expressions Languages, precisaremos de uma biblioteca para trabalhar com laços  -->
	<ul>
		
		<c:forEach items="${empresas}" var="empresa">
			<li>
			${empresa.nome} <fmt:formatDate value="${empresa.dataAbertura}" pattern="dd/MM/yyyy"/> 
			<a href="/gerenciador/entrada?acao=MostraEmpresa&id=${empresa.id }">Edit</a>
			<a href="/gerenciador/entrada?acao=RemoveEmpresa&id=${empresa.id }">Remove</a>
			</li>
		</c:forEach>
		
	</ul>
	
</body>
</html>