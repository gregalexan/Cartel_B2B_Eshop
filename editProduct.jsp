<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}

    ProductService ps = new ProductService();
    String productID =  request.getParameter("productID");
    Product product = ps.getProductById(Integer.parseInt(productID));
    UserService us = new UserService();
    User supplier = us.findUser(product.getSupplier());
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Edit Product - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
                <img src="<%=request.getContextPath()%>/<%= product.getImage() %>" width="100%"> 
            </div>
            <form class="col-2 edit" action="editProductController.jsp" method="POST">
                <p>Home / <%= product.getCategory() %></p>
                <%-- Hidden pass the product id --%>
                <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                <input type="text" style="font-size: 48px; font-weight: bold;" name="name" value="<%= product.getName() %>" required>
                <h3>by <%= supplier.getName() %></h3>
                <div style="display: flex; align-items: center;">
                    <span style="font-size: 20px; font-weight: bold; margin-right: 5px;">$ </span>
                    <input type="number" step="0.01" style="font-size: 20px; font-weight: bold; width: 28%;" name="price" value="<%= product.getPrice() %>" required>
                </div>
                <div class="stock">
                    <h5>Stock: </h5>
                    <input type="number" value="<%= product.getStock() %>" name="stock" required>
                </div>
                <h3>Product Details <i class="fa fa-ident"></i></h3>
                <div class="edit-text-class">
                    <textarea class="edit-text-box" name="description" style="font-family: 'Times New Roman';"><%= product.getDescription() %></textarea>
                </div>
                <div class="buttons">
                    <button class="cancel" type="button" onclick="window.location.href='my-products.jsp'">
                        Cancel
                    </button>
                    <button class="done" type="submit">
                        Done
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>