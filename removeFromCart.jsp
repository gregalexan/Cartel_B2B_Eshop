<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Iterator" %>

<%
    String productId = request.getParameter("productId");
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (!cart.isEmpty()) {
        for (Product p : cart) {
            if (p.getProductID() == Integer.parseInt(productId)) {
                cart.remove(p);
                break;
            }
        }
    }
    %>
        <jsp:forward page="cart.jsp"/>
    <%
%>