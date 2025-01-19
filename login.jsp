<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    String errorMessage = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Login/Register - Cartel</title>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <!--account page-->
    <div class="account-page">
                <% if(errorMessage != null) { %>		
                    <div class="errormessage" role="alert">
                        <%= errorMessage %>
                    </div>
                <% } %>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <img src="images/Cartel.png" width="100%">
                </div>
                <div class="col-2">
                    <div class="form-container">
                        <div class="form-btn">
                            <span onclick="register()">Register</span>
                            <span onclick="login()">Login</span>
                            <hr id="Indicator">
                        </div>
                        <form id="LoginForm" action="loginController.jsp" method="POST">
                            <input type="text" name="login_username" placeholder="Username">
                            <input type="password" name="login_password" placeholder="Password">
                            <button type="submit" class="btn">Login</button>
                            <a href="#didyoureallythinkthiswouldwork?">Forgot password</a>
                            <div class="help"><strong>Help:</strong>
                                <ul>
                                    <li>For Luxe Loom: luxeloom 1111</li>
                                    <li>For Paper Charm: paperCharm 2222</li>
                                </ul>
                            </div>
                        </form>

                        <form id="RegForm" action="registerController.jsp" method="POST">
                            <input type="text" name="company_name" placeholder="Company name">
                            <input type="email" name="email" placeholder="Email">
                            <input type="text" name="ssn" placeholder="Company SSN">
                            <input type="text" name="register_username" placeholder="Username">
                            <input type="password" name="register_password" placeholder="Password">
                            <input type="password" name="confirm" placeholder="Confirm password">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="conditions" value="on" name="conditions">I agree to the terms and conditions
                            </label>
                            <button type="submit" class="btn">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>
    
    <script>

        var LoginForm = document.getElementById("LoginForm");
        var RegForm = document.getElementById("RegForm");
        var Indicator = document.getElementById("Indicator");
        
        function register(){
            LoginForm.style.transform = "translateX(400px)";
            RegForm.style.transform = "translateX(400px)";
            Indicator.style.transform = "translateX(0px)";
        }
        function login(){
            LoginForm.style.transform = "translateX(0px)";
            RegForm.style.transform = "translateX(0px)";
            Indicator.style.transform = "translateX(100px)";
        }
    
    </script>
</body>
</html>