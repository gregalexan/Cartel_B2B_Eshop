<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cartel.*"%>
<%@ page errorPage="error.jsp"%>

<%
// get parameters from request and convert them to correct types
String name = request.getParameter("name");
double price = Double.parseDouble(request.getParameter("price"));
int stock = Integer.parseInt(request.getParameter("stock"));
String description = request.getParameter("description");
String productID = request.getParameter("productID");

// update database by method
try {
    ProductService ps = new ProductService();
    ps.updateProductDetails(Integer.parseInt(productID), name, price, stock, description);
    session.setAttribute("message", "Product edited successfully!");
} catch (Exception e) {
    session.setAttribute("message", "Something went wrong! Editting failed!");
} finally { //when everything is done, return to my-products
    response.sendRedirect("my-products.jsp");
}
%>
