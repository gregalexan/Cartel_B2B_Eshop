<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Navbar -->
    <div class="container">
        <div class="navbar">
            <div class="logo">
                <a href="browse-products.jsp">
                    <img src="images/Cartel.png" width="125px">
                </a>
            </div>
            <!-- Hamburger menu for mobile -->
            <div class="hamburger-menu" onclick="toggleMobileMenu()">
                &#9776; <!-- Hamburger icon -->
            </div>

            <nav>
                <ul class="MenuItems">
                    <div class="menu-items-home-about">
                        <li><a href="browse-products.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                    </div>
                    <li>
                        <button style="font-family: 'Times New Roman', Times, serif; font-size: 16px;" class="dropbtn btnCart btnLogIn" onclick="showCategoriesDropdown()">
                            Categories <i class="fa fa-caret-down"></i>
                        </button>
                        <div id="categoriesDropDown" class="dropdown-content">
                            <a href="browse-products.jsp?category=Bathroom">Bathroom</a>
                            <a href="browse-products.jsp?category=CleaningSupplies">Cleaning Supplies</a>
                            <a href="browse-products.jsp?category=FoodSupplies">Food Supplies</a>
                            <a href="browse-products.jsp?category=Kitchen">Kitchen</a>
                            <a href="browse-products.jsp?category=Furniture">Furniture</a>
                            <a href="browse-products.jsp?category=OfficeEquipment">Office Equipment</a>
                            <a href="browse-products.jsp?category=Stationary">Stationary</a>
                            <a href="browse-products.jsp?category=Hardware">Hardware</a>
                            <a href="browse-products.jsp?category=PackagingMaterials">Packaging Materials</a>
                            <a href="browse-products.jsp?category=Tools">Tools</a>
                            <a href="browse-products.jsp?category=Lighting">Lighting</a>
                        </div>
                    </li>
                    <%
                        if (user != null) {
                    %>
                        <li>
                            <button style="font-family: 'Times New Roman', Times, serif; 
                                            font-size: 16px; z-index:" 
                                    class="dropbtn btnCart btnLogIn" 
                                    onclick="showAccountDropdown()">
                                <!-- Username -->
                                <%= user.getUsername() %>
                                <!-- Dropdown Icon -->
                                <i class="fa fa-caret-down"></i>
                            </button>

                            <div id="accountDropDown" class="dropdown-content">
                                <a href="profile.jsp">Profile</a>
                                <a href="full-orders-history.jsp">Orders</a>
                                <a href="my-products.jsp">Products</a>
                            </div>
                        </li>
                        <li><a class="btnCart btnLogIn" href="logout.jsp"><i class="fa fa-sign-out"></i> Log out</a></li>
                    <%
                        } else {
                            // user == null
                    %>
                        <li><a class="btnCart btnLogIn" href="login.jsp"><i class="fa fa-sign-in"></i> Join Cartel</a></li>
                    <%
                        }
                    %>
                    <li><a href="cart.jsp" class="btnCart"><img src="images/shopping_cart.png" width="20px" height="20px"></a>
                </ul>
            </nav>
        </div>
    </div>
    <!-- End of Navbar -->