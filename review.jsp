<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
    String productId = request.getParameter("productId");
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	} else {
        String source = "review.jsp?productId=" + productId;
        session.setAttribute("source", source);
        request.setAttribute("message", "You have to log in to post a review!");
    %>
        <jsp:forward page="login.jsp"/>
    <%
    }
    ProductService ps = new ProductService();
    Product product = ps.getProductById(Integer.parseInt(productId));
    UserService us = new UserService();
    User supplier = us.findUser(product.getSupplier());
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Review Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <!-- Review Product -->
     <div class="review-page">
        <div class="review-page-img">
            <img src="<%= request.getContextPath()%>/<%=product.getImage()%>" alt="">
            <h2><%= product.getName()%></h2>
        </div>
         <div class="review-product">
             <h1>Leave a Review</h1>
             <p>Your review is really valuable. Thanks for leaving one!</p>
             <form action="reviewController.jsp" method="POST">
                <!-- Hidden Input to Pass Product ID -->
                <input type="hidden" name="productId" value="<%= productId %>">
                <input type="hidden" name="companyName" value="<%=supplier.getName()%>">
                <div class="rating">
                    <!-- 5th Star -->
                    <input type="radio" name="rating" id="r5" value="5">
                    <label for="r5"></label>
                    <!-- 4th Star -->
                    <input type="radio" name="rating" id="r4" value="4">
                    <label for="r4"></label>
                    <!-- 3rd Star -->
                    <input type="radio" name="rating" id="r3" value="3">
                    <label for="r3"></label>
                    <!-- 2nd Star -->
                    <input type="radio" name="rating" id="r2" value="2">
                    <label for="r2"></label>
                    <!-- 1st Star -->
                    <input type="radio" name="rating" id="r1" value="1">
                    <label for="r1"></label>
                </div>

                <!-- Text Area -->
                <div class="text-class">
                    <textarea class="text-box" name="reviewMessage" placeholder="Enter a message for us..."></textarea>
                </div>
                <!-- End Text Area --> 
                <!-- 2 buttons: Submit or Cancel -->
                <div class="buttons-after" style="display:flex; gap:35px;">
                    <button type="button" 
                            class="btn btn-primary" 
                            aria-label="Cancel" 
                            onClick="window.location.href='product-details.jsp?productId=<%= productId %>'">
                        Cancel
                    </button>
                    <button type="submit" 
                            aria-label="Submit" 
                            class="btn btn-primary">
                        Submit
                    </button>
                </div>
                <!-- End Submit or Cancel -->  
             </form>
         </div>
     </div>
    <!-- End Review Product -->
    
    <%@ include file="footer.jsp"%>
</body>
</html>