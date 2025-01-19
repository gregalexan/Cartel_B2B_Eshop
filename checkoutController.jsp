<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.Calendar, java.util.List, java.util.ArrayList" %>

<%
    User user = null;
    if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}

    // Get the cart with the Products
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<Product>();
        request.setAttribute("error", "Error completing checkout");
        %>
            <jsp:forward page="browse-products.jsp" />
        <%
    }

    String name = request.getParameter("companyName");
    String ssn = request.getParameter("companySSN");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String city = request.getParameter("city");
    String zip =(request.getParameter("zip"));

    // Validate that they are the same as the user obj
    if ((!name.equals(user.getName())) || (!ssn.equals(user.getSSN()))
            || !email.equals(user.getEmail())) {
                response.sendRedirect("checkout.jsp?errorCheckout=true");
    }

    String cardName = request.getParameter("cardName");
    String cardNumber = request.getParameter("cardnumber");
    String cardDate = request.getParameter("exp-date");
    String cardCvv = request.getParameter("cvv");

    // Normally some validation happens here... But it is too much for our project.
    // At least for now.

    // If user selects save info update user info    
    String saveInfo = request.getParameter("saveInfo");
    if (saveInfo != null) {
        try {
            UserService us = new UserService();
            us.editProfile(ssn, user, phone, city, address, zip);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    OrderService os = new OrderService();
    try {
        os.placeOrder(cart, user);
    } catch (Exception e) {
        
        session.setAttribute("checkoutMessage", "Something went wrong proccessing your order. Please try again later!");
        response.sendRedirect("profile.jsp");
    }

    session.setAttribute("cart", new ArrayList<Product>());
    session.setAttribute("checkoutMessage", "Order placed successfully!");
    response.sendRedirect("profile.jsp");
%>
