<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.ArrayList, java.util.List" %>

<%
    User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    
    String rating = request.getParameter("rating");
    
    int stars = 0;
    if (rating != null) {
        stars = Integer.parseInt(rating);
    }

    String reviewText = request.getParameter("reviewMessage");

    String productId = request.getParameter("productId");


    try {
        ReviewService rs = new ReviewService();
        rs.postReview(user, stars, reviewText, Integer.parseInt(productId));
        request.setAttribute("message", "Review posted successfully!");
        String destination = "product-details.jsp?productId=" + productId;
        response.sendRedirect(destination);
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }


%>
