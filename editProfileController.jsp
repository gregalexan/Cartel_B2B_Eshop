<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*, java.util.HashMap, java.util.Map, java.util.stream.*" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
    if (user == null) {
        session.setAttribute("source", "profile.jsp");
        request.setAttribute("message", "You have to log in to view your profile!");
        %>
        <jsp:forward page="login.jsp"/>
        <%
    }
    /* Get the fields */
    String phone = request.getParameter("phone");
    String city = request.getParameter("city");
    String address = request.getParameter("address");
    String zip = request.getParameter("zip");

    /* No empty values */
    String[] fields = {"phone", "city", "address", "zip"};
    Map<String, Boolean> conditionsMap = new HashMap();
    // Phone must be 10 characters
    conditionsMap.put("phone", phone.length() == 10);
    // City must be filled
    conditionsMap.put("city", !city.equals(""));
    // Address must be filled
    conditionsMap.put("address", !address.equals(""));
    // ZIP must be 5 characters
    conditionsMap.put("zip", zip.length() == 5);

    boolean allTrue = true;
    for (String field : fields) {
        if (!conditionsMap.get(field)) {
            allTrue = false;
            break;
        }
    }
    if (!allTrue) {
        request.setAttribute("editController", "Edit Profile Form has errors. Please try again.");
    %>
        <jsp:forward page="profile.jsp"/>
    <%
    }

    try {
        UserService us = new UserService();
        us.editProfile(user.getSSN(), user, phone, city, address, zip);
        request.setAttribute("editController", "Changes saved successfully!");
%>
    <jsp:forward page="profile.jsp"/>
<%
    } catch (Exception e) {
        request.setAttribute("editController", e.getMessage());
%>
    <jsp:forward page="profile.jsp"/>
<%
    }
%>