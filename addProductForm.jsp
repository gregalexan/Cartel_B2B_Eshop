<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
    User user = null;
    if (session.getAttribute("currentuser") != null) {
        user = (User) session.getAttribute("currentuser");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="header.jsp"%>
    <title>Add Product - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <div class="small-container single-product">
        <form class="row" action="addProductController.jsp" method="POST">
            <div class="col-2">
                <img id="image goes here" src="images/image.jpg" width="100%"> 
                <p style="text-align: center; color: #AAC6A3">The "add image" feature is not available yet :(
                <br>We are working on it!</p>
                <%-- Hidden pass of the image path --%>
                <input type="hidden" name="myimage" value="images/image.jpg">
            </div>
            <div class="col-2 edit">
                <p>Please fill in all the information below for your product.
                    <select name="category" required>
                        <option value="" disabled selected>Select Category</option>
                        <option value="Bathroom">Bathroom</option>
                        <option value="CleaningSupplies">Cleaning Supplies</option>
                        <option value="Bathroom">Bathroom</option>
                        <option value="FoodSupplies">Food Supplies</option>
                        <option value="Kitchen">Kitchen</option>
                        <option value="Furniture">Furniture</option>
                        <option value="OfficeEquipment">Office Equipment</option>
                        <option value="Stationary">Stationary</option>
                        <option value="Hardware">Hardware</option>
                        <option value="PackagingMaterials">Packaging Materials</option>
                        <option value="Tools">Tools</option>
                        <option value="Lighting">Lighting</option>
                    </select>
                </p>
                <%-- Hidden pass of the supplier username --%>
                <input type="hidden" name="supplier" value="<%= user.getUsername() %>">
                <input type="text" style="font-size: 48px; font-weight: bold;" name="name" placeholder="Name" required>
                <h3>by <%= user.getName() %></h3>
                <div style="display: flex; align-items: center;">
                    <span style="font-size: 20px; font-weight: bold; margin-right: 5px;">$ </span>
                    <input type="number" step="0.01" style="font-size: 20px; font-weight: bold; width: 28%;" name="price" placeholder="Price" required>
                </div>
                <div class="stock">
                    <h5>Stock: </h5>
                    <input type="number" placeholder="Stock" name="stock" required>
                </div>
                <h3>Product Details <i class="fa fa-ident"></i></h3>
                <div class="edit-text-class">
                    <textarea class="edit-text-box" name="description" style="font-family: 'Times New Roman';" placeholder="With every full-stop / period the text will change line" required></textarea>
                </div>
            </div>
            <div class="add-buttons">
                <button class="cancel" type="button" onclick="window.location.href='my-products.jsp'">
                    Cancel
                </button>
                <button class="done" type="submit">
                    Add Product
                </button>
            </div>
        </form>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>

</html>
