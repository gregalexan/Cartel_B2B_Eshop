<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cartel.*"%>
<%@ page errorPage="error.jsp"%>

<%
String source = (String) session.getAttribute("source");
if (source == null) {
    source = "browse-products.jsp";
}
//get parameter from request
String username = request.getParameter("login_username");
String password = request.getParameter("login_password");
UserService us = new UserService();
try{
    User user = us.authenticate(username, password);
    session.setAttribute("currentuser", user);
    response.sendRedirect(source);
} catch (Exception e) {
    request.setAttribute("message", e.getMessage());
%>
    <jsp:forward page="login.jsp"/>
<%
}
%>
