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
        session.setAttribute("source", "full-orders-history.jsp");
        request.setAttribute("message", "You have to log in to view your order history!");
        %>
           <jsp:forward page="login.jsp"/>
        <%
    }
    OrderService os = new OrderService();
    // Get the My Orders -> Orders I have made
    List<Order> myOrders_before = new ArrayList<Order>();
    List<Order> myOrders = new ArrayList<Order>();
    try {
        // myOrders = os.getMyOrders(user);
        myOrders_before = os.getMyOrders(user);
        myOrders = os.sortMyOrders(myOrders_before);
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
    <title>Order History - Cartel</title>
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
            <!-- My Orders -->
            <div class="my-orders" style="width: 100%;">
                <h1 style="text-align: center; margin-bottom: 35px;">
                    My 
                    <span style="color: #3b8e72;">
                        Orders
                    </span>
                </h1>
                <%
                    if (!myOrders.isEmpty()) {
                        for (Order o : myOrders) {
                            %>
                                <div class="product-preview">
                                    <img src="<%=o.getProducts().get(0).getImage()%>" alt="<%=o.getProducts().get(0).getName()%>">
                                    <span>Order ID: <%=o.getOrderId()%></span>
                                    <span>$<%=o.getTotal()%></span>
                                    <span><%=o.getOrderedDate()%></span>
                                    <span><%=o.getStatus()%></span>
                                </div>
                            <%
                        }
                    } else {
                        %>
                            <h3>You have not made any orders yet!</h3>
                        <%
                    }
                %>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
