<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.List, java.util.ArrayList, java.lang.Math, java.math.BigDecimal, java.math.RoundingMode" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    
    /* Retrieve the cart from the session (or create a new one if it doesn't exist) */
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<Product>();
    }
    /* Calculate the SubTotal and Total with given a 24% tax */
    double subtotal = 0;
    for (Product product : cart) {
        subtotal +=  product.getQuantity() * product.getPrice();
    }
    /* Calculate the TAX and round it up */
    BigDecimal bd = new BigDecimal(subtotal * 24 / 100.00);
    BigDecimal tax = bd.setScale(2, RoundingMode.UP);
    /* Calculate the total amount */
    double total = tax.doubleValue() + subtotal;
    session.setAttribute("total", total);
%>
<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Cart Items - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <!-- cart items details -->
     <div class="small-container cart-page">
        <div class="cart-page-buttons">
            <div class="cart-page-button">
                <button onclick="window.location.href='browse-products.jsp'" class="btnCart btnLogIn">
                    Browse more Products
                </button>
            </div>
            <% if (cart.size() > 0) {
                %>
                    <div class="cart-page-button">
                        <button onclick="window.location.href='checkout.jsp'" class="btnCart btnLogIn">
                            Proceed to Checkout
                        </button>
                    </div>
                <%
            }
            %>
        </div>
        <%
            if (cart.size() > 0) {
                %>
                    <table>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%  
                            for (Product product : cart) {
                                %>
                                    <tr>
                                        <td>
                                            <div class="cart-info">
                                                <img src="<%=product.getImage()%>">
                                                <div>
                                                    <p><%= product.getName() %></p>
                                                    <small>Price: <%= product.getPrice() %></small>
                                                    <br>
                                                    <a href="removeFromCart.jsp?productId=<%=product.getProductID()%>">Remove </a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <%=product.getQuantity()%>
                                        </td>
                                        <td><%= product.getQuantity() * product.getPrice() %></td>
                                    </tr>
                                <%
                            }
                        %>
                    </table>
                    <div class="total-price">
                        <table>
                            <tr>
                                <td>Subtotal</td>
                                <td>$<%= subtotal%></td>
                            </tr>
                            <tr>
                                <td>Tax</td>
                                <td>$<%= tax%></td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td>$<%= total%></td>
                            </tr>
                        </table>
                    </div>
                <%
            } else {
                %>
                    <div style="text-align:center;">
                        <h1 style="color: #3b8e72;">You have nothing in your cart</h2>
                        <img src="<%=request.getContextPath()%>/images/empty-cart.png" style="align: center; margin-top: 30px; margin-bottom: 30px;">
                    </div>

                <%
            }
        %>
        </table>
     </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>