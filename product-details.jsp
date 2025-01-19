<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.List, java.util.ArrayList" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    ProductService ps = new ProductService();
    String productId =  request.getParameter("productId"); /* Which product user chose to see details */
    Product product = ps.getProductById(Integer.parseInt(productId));
    UserService us = new UserService();
    User supplier = us.findUser(product.getSupplier()); /* Get the supplier of this product */
    String description_copy = product.getDescription();
    String description = description_copy.replace(".", ".<br>"); /* Show the product description cleaner */

    /* Related products are the products with the same category */
    List<String> keywords = new ArrayList<String>();
    keywords.add(product.getCategory());
    List<Product> related = ps.viewProducts(keywords, true);
    /* Remove the current product from the related products list */
    for (int i = 0; i < related.size(); i++) {
        if (related.get(i).getProductID() == Integer.parseInt(productId)) {
            related.remove(i);
        }
    }
    ReviewService rs = new ReviewService();
    List<Review> reviews = rs.getProductReviews(product.getProductID()); /* Get the reviews of this product */

    /* Add to Cart: success or error message! */
    String message = (String) session.getAttribute("message");
    boolean success = false;
    if (message != null) {
        success = message.contains("successfully");
    }
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Product Details - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>
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
            session.setAttribute("message", null); /* make sure the message doesn't appear again when page is refreshed */
        }
    %>
    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
                <img src="<%=request.getContextPath()%>/<%= product.getImage() %>" width="100%"> 
            </div>
            <div class="col-2">
                <p>Home / <%= product.getCategory() %></p>
                <h1><%= product.getName() %></h1>
                <h3>by <%= supplier.getName() %></h5>
                <h4>$<%= product.getPrice()%></h4>
                <br>
                <h5>Stock: <%= product.getStock() %></h5>
                <%
                    /* Show the option "Add To Cart" only when the product is In Stock */
                    if (product.getStock() == 0) {
                        %>
                            <h3 style="color: red; margin-top: 15px; margin-bottom: 15px;">Out of Stock!</h3>
                        <%
                    } else {
                        %>
                            <input type="number" id="quantityInput" name="quantity" value="1">
                            <input type="hidden" value="<%=productId%>" id="productId">
                            <a onclick="addToCart(<%= productId%>)" class="btn" style="cursor:pointer;">Add To Cart</a>
                        <%
                    }
                %>
                <h3>Product Details <i class="fa fa-ident"></i></h3>
                <br>
                <p>
                    <%= description %>
                </p>
            </div>
        </div>
    </div>
    <!--reviews-->
    <div class="small-container reviews">
        <div class="row row-2">
            <h2>Reviews</h2>
<%
            /* If the product has more than 3 reviews then show the option to view all the reviews */
            if (reviews.size() > 0 & reviews.size() > 3) {
            %>
                <div class="view-more">
                    <a href="product-reviews.jsp?productId=<%=productId%>">View More</a>
                </div>
            <%
            }
%>
        </div>
        <div class="review-row">
        <%
            if (reviews.size() > 0 & reviews.size() <= 3) {
                for (Review rev : reviews) {
                    %>
                        <div class="review">
                            <img src="<%= request.getContextPath()%>/<%=rev.getCompanyImage()%>" alt="User Image" class="review-img">
                            <div class="review-content">
                                <h3><%= rev.getCompanyName() %></h3>
                                <div class="rating">
                                    <%
                                        for (int i = 0; i < rev.getStars(); i++ ) {
                                            %>
                                                <i class="fa fa-star"></i>
                                            <%
                                        }
                                        for (int i = 0; i < 5 - rev.getStars(); i++ ) {
                                            %>
                                                <i class="fa fa-star-o"></i>
                                            <%
                                        }
                                    %>
                                </div>
                                <p><%= rev.getReview() %></p>
                            </div>
                        </div>
                    <%
                }
            } else if (reviews.size() == 0) {
                %>
                    <div style="display:flex; justify-content:center; align-items:center; width: 100%">
                        <h3 style="color: #111; text-align: center;">
                            There are no reviews yet for this product.
                        </h3>
                    </div>

                <%
            } else if (reviews.size() > 3) {
                for (int times = 0; times < 3; times++) {
                    %>
                        <div class="review">
                            <img src="<%= request.getContextPath()%>/<%=reviews.get(times).getCompanyImage()%>" alt="User Image" class="review-img">
                            <div class="review-content">
                                <h3><%= reviews.get(times).getCompanyName() %></h3>
                                <div class="rating">
                                    <%
                                        for (int i = 0; i < reviews.get(times).getStars(); i++ ) {
                                            %>
                                                <i class="fa fa-star"></i>
                                            <%
                                        }
                                        for (int i = 0; i < 5 - reviews.get(times).getStars(); i++ ) {
                                            %>
                                                <i class="fa fa-star-o"></i>
                                            <%
                                        }
                                    %>
                                </div>
                                <p><%= reviews.get(times).getReview() %></p>
                            </div>
                        </div>
                    <%
                }
            }
        %>
        <%
            if (reviews.size() == 0) {
                %>
                  <a href="review.jsp?productId=<%= productId %>" class="btn">Add the first review</a>
                <%
            } else {
                %>
                    <a href="review.jsp?productId=<%= productId %>" class="btn">Add your own review</a>
                <%
            }
        %>
    </div>
    </div>
    <!--related products-->
    <div class="small-container related-products">
        <div class="row row-2">
            <h2>Related Products</h2>
            <div class="view-more">
                <%-- Browse Products with the same category --%>
                <a href="browse-products.jsp?category=<%= product.getCategory() %>">View More</a>
            </div>
        </div>
    </div>
    <%-- Related products --%>
    <div class="small-container">
        <div class="row">
        <%
            if (related.size() > 0) {
                if (related.size() <= 4) {
                    for (Product relatedProduct : related) {
                    %>
                        <div class="col-4">
                            <img src="<%=request.getContextPath() %>/<%= relatedProduct.getImage() %>" onClick="window.location.href='product-details.jsp?productId=<%= relatedProduct.getProductID() %>'" style="cursor: pointer;">
                            <h4><%= relatedProduct.getName()%></h4>
                            <div class="rating">
                            <%
                                for (int i = 0; i < relatedProduct.getRating(); i++) {
                                    %>
                                        <i class="fa fa-star"></i>
                                    <%
                                }
                                for (int i = 0; i < 5 - relatedProduct.getRating(); i++) {
                                    %>
                                        <i class="fa fa-star-o"></i>
                                    <%
                                }
                            %>
                            </div>
                            <p><%= relatedProduct.getPrice() %>$</p>
                        </div>
                    <%
                    }
                } else {
                    List<Product> firstRelated = new ArrayList<Product>();
                    for (int i = 0; i < 4; i++) {
                        firstRelated.add(related.get(i));
                    }
                    for (Product relatedProduct : firstRelated) {
                        %>
                            <div class="col-4">
                                <img src="<%=request.getContextPath() %>/<%= relatedProduct.getImage() %>" onClick="window.location.href='product-details.jsp?productId=<%= relatedProduct.getProductID() %>'" style="cursor: pointer;">
                                <h4><%= relatedProduct.getName()%></h4>
                                <div class="rating">
                                <%
                                    for (int i = 0; i < relatedProduct.getRating(); i++) {
                                        %>
                                            <i class="fa fa-star"></i>
                                        <%
                                    }
                                    for (int i = 0; i < 5 - relatedProduct.getRating(); i++) {
                                        %>
                                            <i class="fa fa-star-o"></i>
                                        <%
                                    }
                                %>
                                </div>
                                <p><%= relatedProduct.getPrice() %>$</p>
                            </div>
                        <%
                    }
                }
            }
        %>
        </div>
    </div>

    <%@ include file="footer.jsp"%>
    <script>
        function addToCart(productId) {
            const quantity = document.getElementById('quantityInput').value;
            const url = "addToCartController.jsp?productId=" + productId + "&quantity=" + quantity;
            window.location.href = url;
        }
    </script>
    <script> //to close the message
        const added = document.getElementById("addedMessage");
        const closeMessage = document.getElementById("closeMessage");
        closeMessage.onclick = function() {
            added.style.display = "none";
        }
    </script>
</body>
</html>