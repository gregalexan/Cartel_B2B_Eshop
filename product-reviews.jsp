<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Iterator, java.lang.Math" %>
<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    ProductService ps = new ProductService();
    String productId =  request.getParameter("productId");
    Product product = ps.getProductById(Integer.parseInt(productId));
    UserService us = new UserService();
    User supplier = us.findUser(product.getSupplier());
    ReviewService rs = new ReviewService();
    List<Review> reviews = rs.getProductReviews(product.getProductID());
    int reviewAverage = ps.getProductRating(product.getProductID());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
    <title>Product Reviews - Cartel</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <!-- Profile Section -->
        <div class="small-container single-product">
            <div class="row">
                <div class="col-2">
                    <img src="<%=request.getContextPath()%>/<%= product.getImage() %>" width="100%"> 
                </div>
                <div class="col-2">
                    <p>Home / <%= product.getCategory() %></p>
                    <h1><%= product.getName() %></h1>
                    <h3>by <%= supplier.getName() %></h5>
                    <div class="rating" style="margin-top: 23px; text-align: left;">
                    <%
                        for (int i = 0; i < reviewAverage; i++) {
                            %>
                                <i style="font-size: 50px;" class="fa fa-star"></i>
                            <%
                        }
                        for (int i = 0; i < 5 - reviewAverage; i++) {
                            %>
                                <i style="font-size: 50px;" class="fa fa-star-o"></i>
                            <%
                        }
                    %>
                    </div>
                </div>
            </div>
        </div>
    <!--reviews-->
        <div class="small-container reviews" style="margin-bottom: 150px;">
            <div class="row row-2">
                <h2>Reviews</h2>
            </div>
            <div class="review-row">
                <%
                    if (reviews.size() > 0) {
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
                    } else {
                        %>
                            <div style="display:flex; justify-content:center; align-items:center; width: 100%">
                                <h3 style="color: #111; text-align: center;">
                                    There are no reviews yet for this product.
                                </h3>
                            </div>
                        <%
                    }
                %>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>
