<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.ArrayList, java.util.List"%>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    List<String> keywords = new ArrayList<String>(); /* Keywords to filter which products to show */
    String category = request.getParameter("category"); /* What category user chose*/
    boolean categoryFlag = false;
    if (category == null) {
        category = "all";
    } else {
        keywords.add(category);
        categoryFlag = true;

    }
    String searchQuery = request.getParameter("search"); /* The search query user typed */
    if (searchQuery == null || searchQuery.trim().isEmpty()) { /* Default to 'all' if no search query is provided */
        searchQuery = "all";
    } else {
        /* Split the search query on every space and add them in the keywords */
        String[] words = searchQuery.split("\\s+"); /* Split by spaces */
        for (String word : words) {
            keywords.add(word.trim()); /* Add each word to the keywords list */
        }
    }
    /* Neither category is selected nor a search query is provided */
    if (keywords.isEmpty()) {
        keywords.add("all");
    }
    /* Get the products based on the keywords */
    List<Product> products_before = null;
    ProductService ps = new ProductService();
    try {
        products_before = ps.viewProducts(keywords, categoryFlag);
    } catch (Exception e) {
        throw new Exception(e.getMessage());
    }
    /* Sort the products */
    String sort = request.getParameter("sort"); /* How user chose to browse products (Default, Price, Rating) */
    if (sort == null) {
        sort = "default";
    }
    /* Final List of the Products based on sorting */
    List<Product> products = null;
    products = ps.sortProducts(products_before, sort);
    /* Set up pagination */
    int currentPage = 0;
    int itemsPerPage = 8; /* 8 Products on every page */
    String pageParam = request.getParameter("page"); /* Current page */
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }
    int start = currentPage * itemsPerPage;
    int end = Math.min(start + itemsPerPage, products.size());
    List<Product> paginatedProducts = products.subList(start, end);
    /* Review service will be used later inside the html/jsp */
    ReviewService rs = new ReviewService();
%>
<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Home - Cartel</title>
    <style>
        .pagination-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px; /* Spacing between elements */
        }
        .pagination-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: var(--primary-color);
            background-color: var(--background-color); /* Bootstrap blue */
            border: none;
            border-radius: 5px;
            text-decoration: none; /* Remove underline */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .pagination-button:hover {
            background-color: var(--light-color); /* Darker blue on hover */
            transform: scale(1.05); /* Slight zoom effect */
        }
        .pagination-button:active {
            background-color: var(--light-color); /* Even darker blue for active state */
            transform: scale(0.95); /* Slight shrink effect */
        }
        .page-number {
            font-size: 18px;
            font-weight: bold;
            color: var(--primary-color);
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="small-container">
        <div class="row row-2">
            <h2>All Products</h2>
            <!-- Search Bar -->
            <div class="search">
                <div class="container-lg">
                    <form action="browse-products.jsp" method="GET" class="search-bar">
                        <!-- The input value will appear in the URL as the 'search' parameter -->
                        <input type="text" placeholder="Search Anything" name="search" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                        <button class="search-button" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
             <div class="filters">
                <select id="sort-options" onchange="updateSortParameter()">
                    <option value="default" class="filters-option">Default Sorting</option>
                    <option value="price" class="filters-option">Sorting by Price</option>
                    <option value="rating" class="filters-option">Sorting by Rating</option>
                </select>
            </div>
        </div>
        <!-- Product List Rendering -->
        <div class="row" id="product-list">
            <% if (paginatedProducts.size() > 0) {
                for (Product product : paginatedProducts) {
                    int reviewAverage = ps.getProductRating(product.getProductID());
                    %>
                        <div class="col-4">
                            <img src="<%=request.getContextPath()%>/<%= product.getImage() %>" onClick="window.location.href='product-details.jsp?productId=<%= product.getProductID() %>'" style="cursor: pointer;">
                            <h4><%= product.getName() %></h4>
                            <div class="rating">
                                <% for (int i = 0; i < reviewAverage; i++) { %>
                                    <i class="fa fa-star"></i>
                                <% } %>
                                <% for (int i = reviewAverage; i < 5; i++) { %>
                                    <i class="fa fa-star-o"></i>
                                <% } %>
                            </div>
                            <p><%= product.getPrice() %>$</p>
                            <%
                                if (product.getStock() == 0) {
                                    %>
                                        <p style="color: red;">Out of Stock!</p> <!-- Show message if the stock is 0 -->
                                    <%
                                } 
                            %>
                        </div>
                    <%
                }
            } else {
                %>
                    <div style="text-align:center;">
                        <%
                            if (searchQuery.equals("all")) {
                                %>
                                    <h3>No products found</h3>
                                <%
                            } else {
                                %>
                                    <h3>No products found matching: <%= searchQuery%></h3>
                                <%
                            }
                        %>
                        <img src="images/no-products-icon.png" style="align: center; margin-top: 30px; margin-bottom: 30px;">
                    </div>
                <%
            }
            %>
        </div>
        <!-- Pagination Controls -->
        <%
            if (!paginatedProducts.isEmpty()) {
                %>
                    <div class="pagination-controls" style="text-align: center; margin-top: 20px; margin-bottom: 50px;">
                        <% String sortParam = request.getParameter("sort"); %> <!-- Retrieve the sort parameter -->
                        <% if (currentPage > 0) { %>
                            <a href="?category=<%= category %>&page=<%= currentPage - 1 %><%= (sortParam != null ? "&sort=" + sortParam : "") %>" 
                            id="prev" 
                            class="pagination-button">Back</a>
                        <% } %>
                        <span id="page-number" class="page-number">Page <%= currentPage + 1 %></span>
                        <% if (end < products.size()) { %>
                            <a href="?category=<%= category %>&page=<%= currentPage + 1 %><%= (sortParam != null ? "&sort=" + sortParam : "") %>" 
                            id="next" 
                            class="pagination-button">Next</a>
                        <% } %>
                    </div>
                <%
            }
        %>
    </div>
    <%@ include file="footer.jsp"%>
    <script>
        function updateSortParameter() {
            const sortValue = document.getElementById('sort-options').value;
            const currentUrl = new URL(window.location.href);

            /* Always set the 'sort' parameter, even for default */
            currentUrl.searchParams.set('sort', sortValue);

            /* Redirect to the updated URL */
            window.location.href = currentUrl.toString();
        }
        /* Set the selected option based on the current URL when the page loads */
        document.addEventListener("DOMContentLoaded", () => {
            const currentUrl = new URL(window.location.href);
            const sortValue = currentUrl.searchParams.get('sort');

            if (sortValue) {
                const sortOptions = document.getElementById('sort-options');
                sortOptions.value = sortValue; /* Set the dropdown value */
            }
        });
    </script>
</body>
</html>