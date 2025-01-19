<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Iterator, java.net.URLEncoder" %>

<%
    /* Gets the productId and the quantity user wants */
    String productId = request.getParameter("productId");
    String quantity = request.getParameter("quantity");

    /* Convert to integers */
    int prod_id = Integer.parseInt(productId);
    int productQuantity = Integer.parseInt(quantity);

    ProductService ps = new ProductService();
    Product product = ps.getProductById(prod_id);
    
    // Retrieve the cart from the session (or create a new one if it doesn't exist)
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<Product>();
    }

    // Check if the product already exists in the cart and get the existing quantity
    int existingQuantityInCart = 0;
    for (Product p : cart) {
        if (p.getProductID() == prod_id) {
            existingQuantityInCart = p.getQuantity();
            break;
        }
    }

    // Calculate the total desired quantity
    int totalQuantity = existingQuantityInCart + productQuantity;

    // Validate against stock
    if (totalQuantity > product.getStock()) {
        try {
            session.setAttribute("message", "You chose more than the available stock!");
            String destination = "product-details.jsp?productId=" + URLEncoder.encode(productId, "UTF-8");
            response.sendRedirect(destination);
        } catch (Exception e) {
            throw new Exception("An error occurred while processing your request.");
        }
    } else {
        // Update the cart
        boolean productExists = false;
        for (Product p : cart) {
            if (p.getProductID() == prod_id) {
                // Update the quantity if the product exists
                p.setQuantity(totalQuantity);
                productExists = true;
                break;
            }
        }
        // If the product doesn't exist, add it to the cart
        if (!productExists) {
            product.setQuantity(productQuantity);
            cart.add(product);
        }

        // Update the session with the new cart
        session.setAttribute("cart", cart);

        try {
            session.setAttribute("message", "Product added successfully");
            String destination = "product-details.jsp?productId=" + URLEncoder.encode(productId, "UTF-8");
            response.sendRedirect(destination);
        } catch (Exception e) {
            e.printStackTrace(); // Log the error for debugging
        }
    }
%>
