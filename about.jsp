<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
    /* Gets current user for the navbar */
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	}
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>About Cartel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <%@ include file="navbar.jsp"%>
    
     <!-- About Section with blah blah -->
     <div class="container">
        <div class="about">
            <h1>About <span style="color: #3b8e72;">Cartel</span></h1>
            <p class="about-p">
                Welcome to Team Cartel! We’re a team of students 
                working together to create something useful and innovative for 
                our course: "Information Systems Implementation and Architecture". 
                Our project, Cartel, is an online B2B platform 
                designed to help businesses find and purchase the right equipment and 
                resources for their needs. We’re aiming to make the process simple, efficient, 
                and customizable, offering a broad range of products across different price points.
            </p>
            <p class="about-p">
                This project is a collaborative effort where each team member contributes 
                skills in coding, design, and problem-solving. Thanks for 
                visiting, and we hope you enjoy exploring what we’re working on!
            </p>
        </div>
    </div>
    <!-- End About Section with blah blah -->
    <!-- Us Section -->
    <div class="about-people">
        <h2>Contuct us</h2>
        <div class="team-grid">
            <div class="team-card">
                <img src="images/Cartel.png" alt="Cartel" class="member-photo">
                <h3>Cartel</h3>
                <p><a href="mailto:info@cartel.com">info@cartel.com</a></p>
            </div>
            <!-- Team Member 1 -->
            <div class="team-card">
                <img src="images/about/grigorios.jpg" alt="Gregory Photo" class="member-photo">
                <h3>Grigorios Alexandrou</h3>
                <p><a href="mailto:alexandrougrigorios@gmail.com">alexandrougrigorios@gmail.com</a></p>
            </div>
            <!-- Team Member 2 -->
            <div class="team-card">
                <img src="images/about/anastasia.jpg" alt="Anastasia Photo" class="member-photo">
                <h3>Anastasia Lagopanagiotopoulou</h3>
                <p><a href="mailto:anastasialagopan@gmail.com">anastasialagopan@gmail.com</a></p>
            </div>
            <!-- Team Member 3 -->
            <div class="team-card">
                <img src="images/about/chara.jpg" alt="Chara Photo" class="member-photo">
                <h3>Chara Karachaliou</h3>
                <p><a href="mailto:xarakx77@gmail.com ">xarakx77@gmail.com</a></p>
            </div>
        </div>
    </div>
    <!-- End Us Section -->
    
    <%@ include file="footer.jsp"%>

</body>
</html>
