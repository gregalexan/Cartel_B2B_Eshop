<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.List, java.util.ArrayList" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    if (user == null) {
        session.setAttribute("source", "profile.jsp");
        request.setAttribute("message", "You have to log in to view your profile!");
        %>
        <jsp:forward page="login.jsp"/>
        <%
    }
    
    String editController = (String) request.getAttribute("editController");
    if (editController == null) {
        editController = (String) session.getAttribute("checkoutMessage");
    }
    /* User's uploaded products */
    ProductService ps = new ProductService();
    List<Product> myProducts = new ArrayList<Product>();
    try {
        myProducts = ps.viewMyProducts(user.getUsername());
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }

    /* Get the Transaction History -> Orders of my products */
    OrderService os = new OrderService();
    List<Order> transactionHistory = new ArrayList<Order>();
    try {
        transactionHistory = os.getTransactionHistory(user);
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }

    /* Get the My Orders -> Orders I have made */
    List<Order> myOrders_before = new ArrayList<Order>();
    List<Order> myOrders = new ArrayList<Order>();
    try {
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
    <title>User Profile - Cartel</title>
    <style>
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* Centering modal in the viewport */
            padding: 20px;
            border: 1px solid #888;
            border-radius: 8px;
            width: 30%; /* Adjust modal width */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-header, .modal-footer {
            padding: 10px;
            text-align: center;
        }

        .modal-header {
            border-bottom: 1px solid #ddd;
        }

        .modal-footer {
            border-top: 1px solid #ddd;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }
        .modalBtn {
            padding: 5px 8px;
            background: var(--light-color);
            color: var(--navbar-items-color);
            font-weight: 600;
            text-decoration: none;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.5s;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
        }
        .modalBtn:hover {
            color: var(--primary-color);
            background: var(--light-color);
        } 
    </style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <%-- Message about editing or order placement --%>
    <%
        if (editController != null) {
            if (editController.equals("Changes saved successfully!") || editController.equals("Order placed successfully!")) {
            %>
                <div class="successmessage"
            <%
            } else {
            %>
                <div class="errormessage"
            <%
            }
            %>  
                    id="editControllerMessage"> 
                    <%= editController %>
                    <span style="margin-bottom: 5px; top: 0; cursor: pointer;" class="close" id="closeMessage">&times;</span>
                </div>
            <%
            session.setAttribute("editController", null); //make sure the message doesn't appear again when page is refreshed
            session.setAttribute("checkoutMessage", null); //make sure the message doesn't appear again when page is refreshed
        }
    %>
    <!-- Profile Section -->
    <div class="profile-container">
        <div class="profile-details">
            <div class="profile-picture"> <!-- Profile Picture -->
                <img src="<%= user.getImage()%>" alt="Profile Picture" width="150px">
            </div>
            <%-- User's information --%>
            <div class="user-info">
                <h2>Username: <%= user.getUsername()%></h2>
                <div>
                    <p>Company Name: <%= user.getName() %></p>
                    <p>SSN: <%= user.getSSN() %></p>
                    <p>Email: <%= user.getEmail() %></p>
                    <p>Member Since: <%= user.getJoined()%></p>
                    <%-- Optionals --%>
                    <p>Phone: <%= user.getPhone() != null ? user.getPhone() : "No phone registered" %><p>
                    <p>City: <%= user.getCity() != null ? user.getCity() : "No city registered" %></p>
                    <p>Address: <%= user.getAddress() != null ? user.getAddress() : "No address registered"%></p>
                    <p>Zip Code: <%= user.getZip() != 0 ? user.getZip() : "No zip code registered"%></p>
                </div>
                <!-- Trigger the modal with a button -->
                <button class="modalBtn" id="editProfileBtn">Edit Profile</button>
            </div>
            <!-- Edit Profile Modal -->
            <div id="editProfileModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header" style="margin-bottom: 10px;">
                        <span class="close" id="closeModal">&times;</span>
                        <h4 style="color: var(--primary-color);">Edit Profile</h4>
                    </div>
                    <div class="modal-body">
                    <%
                        if (user.getPhone() == null & user.getCity() == null & user.getAddress() == null & user.getZip() == 0) {
                            %>
                                <h5 style="text-align:center;">Please fill in all the fields</h5>
                            <%
                        }
                    %>
                        <form action="editProfileController.jsp" method="POST">
                            <label for="phone">Phone</label>
                            <input type="text" name="phone" placeholder="<%= user.getPhone() != null ? user.getPhone() : "Phone" %>" value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
                            <label for="city">City</label>
                            <input type="text" name="city" placeholder="<%= user.getCity() != null ? user.getCity() : "City" %>" value="<%= user.getCity() != null ? user.getCity() : "" %>">
                            <label for="address">Address</label>
                            <input type="text" name="address" placeholder="<%= user.getAddress() != null ? user.getAddress() : "Address" %>" value="<%= user.getAddress() != null ? user.getAddress() : "" %>">
                            <label for="zip">Zip Code</label>
                            <input type="text" name="zip" 
                                placeholder="<%= user.getZip() != 0 ? user.getZip() : "Zip Code" %>" 
                                value="<%= user.getZip() != 0 ? user.getZip() : "" %>">

                            <div class="modal-footer" style="margin-top: 10px; justify-content: space-evenly;">
                                <button type="button" class="modalBtn" id="cancelModal">Cancel</button>
                                <button type="submit" class="modalBtn" id="doneModal">Done</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="transaction-history-and-orders">
            <!-- Transaction History -->
            <div class="transaction-history" id="orders">
                <h2>Transaction History</h2>
                <%
                    if (!myProducts.isEmpty()) { /* No products uploaded */
                        if (!transactionHistory.isEmpty()) {
                            if (transactionHistory.size() <= 3) {
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
                            } else { // Show only the first 3 transactions
                                for (int times = 0; times < 3; times++) {
                                    %>
                                        <div class="product-preview">
                                            <img src="<%= transactionHistory.get(times).getProductForTransactionHistory().getImage() %>" alt="<%= transactionHistory.get(times).getProductForTransactionHistory().getName()%>">
                                            <span><%= transactionHistory.get(times).getProductForTransactionHistory().getName()%> </span>
                                            <span>$<%=transactionHistory.get(times).getProductForTransactionHistory().getPrice()%> x <%=transactionHistory.get(times).getQuantityForTransactionHistory() %></span>
                                            <span><%=transactionHistory.get(times).getOrderedDate()%></span>
                                            <span><%=transactionHistory.get(times).getStatus()%></span>
                                        </div>
                                    <%
                                }
                            }
                        } else {
                            %>
                                <h3>Products have not made any sales yet!</h3>
                            <%
                        }
                    } else {
                        %>
                            <h3>No Products Registered</h3>
                        <%
                    }
                %>
                <%
                    if (!transactionHistory.isEmpty() & transactionHistory.size() > 3) {
                        %>
                            <div class="view-more">
                                <a href="full-transaction-history.jsp">View More</a>
                            </div>
                        <%
                    }
                %>
            </div>
            <!-- My Orders -->
            <div class="my-orders">
                <h2>My Orders</h2>
                <%
                    if (!myOrders.isEmpty()) {
                        if (myOrders.size() <= 3) {
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
                            for (int times = 0; times < 3; times++) {
                                %>
                                    <div class="product-preview">
                                        <img src="<%=myOrders.get(times).getProducts().get(0).getImage()%>" alt="<%=myOrders.get(times).getProducts().get(0).getName()%>">
                                        <span>Order ID: <%=myOrders.get(times).getOrderId()%></span>
                                        <span>$<%=myOrders.get(times).getTotal()%></span>
                                        <span><%=myOrders.get(times).getOrderedDate()%></span>
                                        <span><%=myOrders.get(times).getStatus()%></span>
                                    </div>
                                <%
                            }
                        }
                        
                    } else {
                        %>
                            <h3>You have not made any orders yet!</h3>
                        <%
                    }
                %>
                <%
                    if (!myOrders.isEmpty() & myOrders.size()>3) {
                        %>
                            <div class="view-more">
                                <a href="full-orders-history.jsp">View More</a>
                            </div>
                        <%
                    }
                %>
            </div>
        </div>
        <div class="main-content">
            <!-- Uploaded Products -->
            <div class="uploaded-products" id="my-products">
                <h2>Uploaded Products</h2>
                <%
                    if (!myProducts.isEmpty()) {
                        if (myProducts.size() <= 3) {
                            for (Product product : myProducts) {
                                %>
                                    <div class="product-preview">
                                        <img src="<%=product.getImage()%>" alt="<%=product.getName()%>">
                                        <span><%=product.getName()%></span>
                                        <span>$<%=product.getPrice()%></span>
                                    </div>
                                <%
                            }
                        } else {
                            for (int times = 0; times < 3; times++) {
                                %>
                                    <div class="product-preview">
                                        <img src="<%=myProducts.get(times).getImage()%>" alt="<%=myProducts.get(times).getName()%>">
                                        <span><%=myProducts.get(times).getName()%></span>
                                        <span>$<%=myProducts.get(times).getPrice()%></span>
                                    </div>
                                <%
                            }
                        }
                    } else {
                        %>
                            <h3>You haven't uploaded any products yet</h3>
                        <%
                    }
                %>
                <%
                    if (!myProducts.isEmpty() & myProducts.size() > 3) {
                        %>
                            <div class="view-more">
                                <a href="my-products.jsp">View More</a>
                            </div>
                        <%
                    } else if (myProducts.isEmpty()) {
                        %>
                            <div class="view-more" style="margin-top: 15px;">
                                <a href="addProductForm.jsp">Upload your first product</a>
                            </div>
                        <%
                    }
                %>
            </div>
            <!-- Product Statistics -->
            <div class="product-statistics">
                <h2>My Sales Stats</h2>
                <h3 style="margin-top:15px;">Statistics are not available yet!</h3>
            </div>
        </div>
    </div>
</div>
    
    <%@ include file="footer.jsp"%>

    <script>
        // Modal logic
        const modal = document.getElementById("editProfileModal");
        const openBtn = document.getElementById("editProfileBtn");
        const closeModal = document.getElementById("closeModal");
        const cancelModal = document.getElementById("cancelModal");
        const doneModal = document.getElementById("doneModal");

        // Open the modal
        openBtn.onclick = function() {
            modal.style.display = "block";
        };

        // Close the modal
        closeModal.onclick = function() {
            modal.style.display = "none";
        };

        cancelModal.onclick = function() {
            modal.style.display = "none";
        };

        doneModal.onclick = function() {
            modal.style.display = "none";
        }

        // Close the modal when clicking outside of it
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };
    </script>
    <script> //to close the message
        const editControllerMessage = document.getElementById("editControllerMessage");
        const closeMessage = document.getElementById("closeMessage");
        closeMessage.onclick = function() {
            editControllerMessage.style.display = "none";
        }
    </script>
</body>
</html>
