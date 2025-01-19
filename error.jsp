<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ page import="cartel.*" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
%>


<!DOCTYPE html>
<html lang="en">
	<head>       
		<%-- JSP INCLUDE --%>
		<%@ include file="header.jsp" %>
		<meta name="description" content="Cartel - Error page">
		<title>Cartel - Error Page</title>

        <!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/personal_projects/bootstrap.min.css">	
		<!-- Bootstrap Optional theme -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/personal_projects/bootstrap-theme.min.css">
	</head>
	<body>

		<div class="container theme-showcase" role="main" style="font-family: Times New Roman;">
			
			<div style="display: flex; justify-content: center; align-items: center; height: 30vh;">
				<img src="<%= request.getContextPath()%>/images/Cartel.png" class="img-rounded" alt="Cartel Logo" style="width: 150px; height: 150px;">
			</div>
            
			<!-- Page Title -->
			<div class="page-header" style="color: var(--primary-color); text-align: center">
				<h1>Something went wrong</h1>
			</div>

            <div class="row" style="text-align:center;">

				<div class="col-xs-12">

					<h2>An error occured</h2>

					<% if(exception != null) { %>	                  	
						<p><code><%=exception %></code></p>						
					<% } %>		

				</div>

			</div>
			<div style="text-align:center; margin-top: 10px;">
				<button onclick="window.location.href='browse-products.jsp'" class="btnCart btnLogIn">
						Home Page
				</button>
			</div>
			
		</div>
		<!-- /container -->
        
	</body>
</html>


