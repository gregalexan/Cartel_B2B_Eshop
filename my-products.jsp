<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.List, java.util.ArrayList" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    if (user == null) {
        session.setAttribute("source", "my-products.jsp");
        request.setAttribute("message", "You have to log in to view your products!");
        %>
        <jsp:forward page="login.jsp"/>
        <%
    }
    //success or error message!
    String message = (String) session.getAttribute("message");
    boolean success = false;
    if (message != null) {
        success = message.contains("successfully");
    }
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>My Products - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <%-- ERROR OR SUCCESS MESSAGE --%>
    <%
        if (message != null) {
            if (success) {
            %>
                <div class="successmessage"
            <%
            } else {
            %>
                <div class="errormessage"
            <%
            }
            %>  
                    id="messageOnTop">
                    <%= message %>
                    <span style="margin-bottom: 5px; top: 0; cursor: pointer;" class="close" id="closeMessage">&times;</span>
                </div>
            <%
            session.setAttribute("message", null); //make sure the message doesn't appear again when page is refreshed
        }
    %>
<%
    List<Product> myproducts_before = new ArrayList<Product>();
    List<Product> myproducts = null;
    try {
        ProductService ps = new ProductService();
        myproducts_before = ps.viewMyProducts(user.getUsername());
        
        /* Sorting */
        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "default";
        }
        myproducts = ps.sortProducts(myproducts_before, sort);
    
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }
    if (myproducts.isEmpty()) {
%>
    <div class="small-container" style="text-align: center;">
        <div class="row">
            <h1 style="color: #3b8e72;">You currently have no products</h2>
        </div>
        <img src="images/no-products-icon.png" style="align: center; margin-top: 30px; margin-bottom: 30px;">
<%
    } else {
%>
    <div class="small-container" style="margin-top: 55px;">
        <div class="row row-2" style="margin-bottom: 15px;">
            <h2>My Products</h2>
            <h3 style="color: var(--primary-color);">Click a product to see its reviews</h4>
            <div class="filters">
                <select id="sort-options" onchange="updateSortParameter()">
                    <option value="default" class="filters-option">Default Sorting</option>
                    <option value="price" class="filters-option">Sorting by Price</option>
                    <option value="rating" class="filters-option">Sorting by Rating</option>
                </select>
            </div>
        </div>
        <div class="row">
    <%
        for (Product product: myproducts) {
    %>
            <div class="col-4 product-container">
                <div class="image-container">
                    <img src="<%= product.getImage()%>" onclick="window.location.href='product-reviews.jsp?productId=<%= product.getProductID()%>'" style="cursor: pointer;">
                    <div class="overlay">
                        <h4><%= product.getName()%></h4>
                        <div class="manage-buttons">
                            <a href="editProduct.jsp?productID=<%= product.getProductID()%>" class="edit-btn"><i class="fa fa-pencil"></i></a>
                            <a href="deleteProductController.jsp?productID=<%= product.getProductID()%>" class="delete-btn"><i class="fa fa-trash"></i></a>
                        </div>
                    </div>
                </div>
                <div class="rating">
        <%
            for (int i=0; i < product.getRating(); i++) {
        %>
                    <i class="fa fa-star"></i>
        <%
            }
            for (int i=0; i < 5 - product.getRating(); i++) {
        %>
                    <i class="fa fa-star-o"></i>
        <%
            }
        %>
                </div>
                <p>$<%= product.getPrice()%></p>
            </div> 
    <%  
        } // end of for-loop
    %>
        </div>   
<%         
    } // end of if-statement
%>
        <div style="text-align: center; margin-top:-40px;">
            <a href="addProductForm.jsp" class="btn">Add a new product</a>
        </div>
    </div> <!-- end of div "small container" -->
    
    <%@ include file="footer.jsp"%>
    <script>
        function updateSortParameter() {
            const sortValue = document.getElementById('sort-options').value;
            const currentUrl = new URL(window.location.href);

            // Always set the 'sort' parameter, even for default
            currentUrl.searchParams.set('sort', sortValue);

            // Redirect to the updated URL
            window.location.href = currentUrl.toString();
        }

        // Set the selected option based on the current URL when the page loads
        document.addEventListener("DOMContentLoaded", () => {
        const currentUrl = new URL(window.location.href);
        const sortValue = currentUrl.searchParams.get('sort');

        if (sortValue) {
            const sortOptions = document.getElementById('sort-options');
            sortOptions.value = sortValue; // Set the dropdown value
        }
    });
    </script>
    <script> //to close the message
        const messageOnTop = document.getElementById("messageOnTop");
        const closeMessage = document.getElementById("closeMessage");
        closeMessage.onclick = function() {
            messageOnTop.style.display = "none";
        }
    </script>
</body>
</html>