<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<%@ include file="header.jsp" %>
	<!-- automatically will redirect to browse-products.jsp after 2 seconds -->
	<meta http-equiv="refresh" content="2;url=browse-products.jsp" />
	<meta name="description" content="Cartel - Log out Page">
	<title>Cartel - Log out Page</title>
	</head>
<body>
	<div class="container theme-showcase" role="main">
		<div style="display: flex; justify-content: center; align-items: center; height: 50vh;">
			<img src="<%= request.getContextPath()%>/images/Cartel.png" class="img-rounded" alt="Cartel Logo" style="width: 200px; height: 200px;">
		</div>
		<div class="successmessage" style="font-size: 18px;" role="alert">Logout Successful!</div>
	</div>
</body>
</html>
