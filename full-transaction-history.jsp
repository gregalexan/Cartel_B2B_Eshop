<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.List, java.util.ArrayList" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    if (user == null) {
        session.setAttribute("source", "full-transaction-history.jsp");
        request.setAttribute("message", "You have to log in to view your transactions!");
        %>
           <jsp:forward page="login.jsp"/>
        <%
    }
    // My Products
    ProductService ps = new ProductService();
    List<Product> myProducts = new ArrayList<Product>();
    try {
        myProducts = ps.viewMyProducts(user.getUsername());
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }
    // Get the Transaction History -> Orders of my products
    OrderService os = new OrderService();
    List<Order> transactionHistory = new ArrayList<Order>();
    try {
        transactionHistory = os.getTransactionHistory(user);
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
    <title>Transaction History - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <!-- Profile Section -->
    <div class="profile-container">
        <div class="profile-details">
            <div class="profile-picture">
                <img src="<%=user.getImage()%>" alt="<%=user.getName()%>" width="150px">
            </div>
            <div class="user-info">
                <h2>Username: <%=user.getUsername()%></h2>
                <p>Email: <%=user.getEmail()%></p>
                <p>Member Since: <%=user.getJoined()%></p>
            </div>
        </div>
        <div class="transaction-history-and-orders">
            <!-- Transaction History -->
            <div class="transaction-history" id="orders" style="width: 100%;">
                <h1 style="text-align: center; margin-bottom: 35px;">
                    <span style="color: #3b8e72;">
                        Transaction
                    </span> History
                </h1>
                <%
                    if (!myProducts.isEmpty()) {
                        if (!transactionHistory.isEmpty()) {
                            for (Order o : transactionHistory) {
                                %>
                                    <div class="product-preview">
                                        <img src="<%= o.getProductForTransactionHistory().getImage() %>" alt="<%= o.getProductForTransactionHistory().getName()%>">
                                        <span><%= o.getProductForTransactionHistory().getName()%> </span>
                                        <span>$<%=o.getProductForTransactionHistory().getPrice()%> x <%=o.getQuantityForTransactionHistory() %></span>
                                        <span><%=o.getOrderedDate()%></span>
                                        <span><%=o.getStatus()%></span>
                                    </div>
                                <%
                            }
                        } else {
                            %>
                                <h3>You do not have any transactions yet!</h3>
                            <%
                        }
                    } else {
                        %>
                            <h3>You do not have any products yet!</h3>
                        <%
                    }
                %>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>
