<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cartel.*"%>
<%@ page errorPage="error.jsp"%>

<%
int productID = Integer.parseInt(request.getParameter("productID"));

// update database by method
try {
    ProductService ps = new ProductService();
    ps.deleteProduct(productID);
    session.setAttribute("message", "Product deleted successfully!");
} catch (Exception e) {
    session.setAttribute("message", "Something went wrong! Failed to delete product!");
} finally { //when everything is done, return to my-products
    response.sendRedirect("my-products.jsp");
}
%>
