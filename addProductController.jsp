<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.nio.file.*, javax.servlet.http.Part" %>
<%@ page import="cartel.*"%>
<%@ page errorPage="error.jsp"%>

<%
    // Get parameters from request
    String category = request.getParameter("category");
    String supplier = request.getParameter("supplier");
    String image = "images/image.jpg"; /* Default image, improvement could be drag and drop */
    String name = request.getParameter("name");
    double price = Double.parseDouble(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));
    String description = request.getParameter("description");

    // Save product to database
    try {
        ProductService ps = new ProductService();
        ps.addProduct(name, image, category, price, stock, description, supplier);
        session.setAttribute("message", "Product added successfully!");
    } catch (Exception e) {
        session.setAttribute("message", "Something went wrong! Failed to add product!");
    } finally { //when everything is done, return to my-products
        response.sendRedirect("my-products.jsp");
    }
%>