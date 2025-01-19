<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cartel.*"%>
<%@ page import="java.util.HashMap, java.util.Map, java.util.stream.*" %>

<%
//get parameters from request
String name = request.getParameter("company_name");
String email = request.getParameter("email");
String ssn = request.getParameter("ssn");
String username = request.getParameter("register_username");
String password = request.getParameter("register_password");
String confirm = request.getParameter("confirm");
String conditions = request.getParameter("conditions");

name = new String(name.getBytes("ISO-8859-1"), "UTF-8");

String[] fields = {"name", "email", "ssn","username", "password", "confirm", "conditions"};

Map<String, Boolean> conditionsMap = new HashMap();
// Name must be filled
conditionsMap.put("name", !name.equals(""));
// Email must be filled
conditionsMap.put("email", !email.equals(""));
// SSN must be 9 numeric characters long
conditionsMap.put("ssn", (ssn.length() == 9 && ssn.matches("\\d+")));
// Username must be at least 4 characters long
conditionsMap.put("username", username.length() >= 4);
// Password must be at least 8 characters long
conditionsMap.put("password", password.length() >= 8);
// Confirmation password does not match the password
conditionsMap.put("confirm", password.equals(confirm) && confirm.length() >= 8);
// CheckBox
conditionsMap.put("conditions", conditions != null);

Map<String, String> errMessages = new HashMap();
errMessages.put("name", "Please fill in your company's name");
errMessages.put("email", "Please fill in a valid email address");
errMessages.put("ssn", "SSN must be 9 numeric characters long");
errMessages.put("username", "Username must be at least 4 characters long");
errMessages.put("password", "Password must be at least 8 characters long");
errMessages.put("confirm", "Confirmation password does not match your password");
errMessages.put("conditions", "You must agree to terms and conditions");

Map<String, String> types = new HashMap();
types.put("name", "text");
types.put("email", "email");
types.put("ssn", "text");
types.put("username", "text");
types.put("password", "password");
types.put("confirm", "password");
types.put("conditions", "checkbox");

Map<String, String> names = new HashMap();
names.put("name", "company_name");
names.put("email", "email");
names.put("ssn", "ssn");
names.put("username", "register_username");
names.put("password", "register_password");
names.put("confirm", "confirm");
names.put("conditions", "conditions");

Map<String, String> placeholders = new HashMap();
placeholders.put("name", "Company Name");
placeholders.put("email", "Email");
placeholders.put("ssn", "Company SSN");
placeholders.put("username", "Username");
placeholders.put("password", "Password");
placeholders.put("confirm", "Confirm your Password");
placeholders.put("conditions", "");

Map<String, String> values = new HashMap();
values.put("name", name);
values.put("email", email);
values.put("ssn", ssn);
values.put("username", username);
values.put("password", password);
values.put("confirm", confirm);
values.put("conditions", conditions);

// Check if all values are true
boolean allTrue = true;
for (String field : fields) {
    if (!conditionsMap.get(field)) {
        allTrue = false;
        break;
    }
}

User user = null;
boolean dbError = false;
try {
    if (allTrue) {
        user = new User(name, email, ssn, username, password);
        UserService us = new UserService();
        us.register(user);
        session.setAttribute("currentuser", user);
        // Get the source
        String source = (String) session.getAttribute("source");
        if (source == null) {
            source = "profile.jsp";
        }
        response.sendRedirect(source);
    }
} catch (Exception e) {
    dbError = true;
    allTrue = false;
}

%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Login/Register - Cartel</title>
</head>

<body>
    <%@ include file="navbar.jsp"%>

    <%-- Alert Danger DB ERROR --%>
    <%
    if (dbError) {
    %>
    <div class="errormessage" role="alert">
        Username, Email or SSN already exists!
    </div>
    <%
    }
    %>
    <!--account page-->
    <div class="account-page">
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
                            <hr id="regIndicator">
                        </div>
                        <form id="regLoginForm" action="loginController.jsp" method="POST">
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
<%
if (allTrue == false) {
%>
    <form id="regRegForm" action="registerController.jsp" method="POST">
<%
    for (String field : fields) {
        if (field == "conditions") {
            if (!conditionsMap.get(field)) {
%>
                <label class="checkbox-inline">
                    <input type="checkbox" id="conditions" value="on" name="conditions">I agree to the terms and conditions
                </label>
                <p class="register-error">You must agree to terms and conditions</p>
<%
            } else {
%>
                <label class="checkbox-inline">
                    <input type="checkbox" id="conditions" value="on" name="conditions" checked>I agree to the terms and conditions
                </label>
<%
            }
        } else {
            if (!conditionsMap.get(field)) {
%>
                <input type="<%= types.get(field)%>" name="<%= names.get(field)%>" placeholder="<%= placeholders.get(field)%>">
                <p class="register-error"><%= errMessages.get(field) %></p>
<%
            } else {
%>
                <input type="<%= types.get(field)%>" name="<%= names.get(field)%>" value="<%=values.get(field)%>">
<%
            }
        }
    }
%>
    <button type="submit" class="btn">Register</button>
    </form>
<%
}
%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>
    
    <script>

        var regLoginForm = document.getElementById("regLoginForm");
        var regRegForm = document.getElementById("regRegForm");
        var regIndicator = document.getElementById("regIndicator");
        
        function register(){
            regLoginForm.style.transform = "translateX(400px)";
            regRegForm.style.transform = "translateX(0px)";
            regIndicator.style.transform = "translateX(0px)";
        }
        function login(){
            regLoginForm.style.transform = "translateX(0px)";
            regRegForm.style.transform = "translateX(-400px)";
            regIndicator.style.transform = "translateX(100px)";
        }

    </script>
</body>
</html>