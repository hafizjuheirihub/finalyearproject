<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Customer Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <!-- Company Name on the Left Side -->
            <a class="navbar-brand" href="#">
                <img src="img/logo.png" alt="">
                 PAWTARIAN ADOPTION
            </a>

            <!-- Toggler/collapsibe Button for Small Screens -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links on the Right Side -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="dropdown1">
            			<button class="dropbtn1">Adopt<span class="caret"></span></button>
            		<div id="myDropdown1" class="dropdown-content1">
                	<a href="adoptpolicy.jsp">Adoption Policy</a>
                	<a href="adoptpolicy.jsp">Adoption Instructions</a>
        			</div>
                    <li class="nav-item">
                        <a class="nav-link" href="contactus.jsp">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logincust.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signupcust.jsp">Signup</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Container for the image gallery -->
<div class="container">

  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext">1 / 5</div>
      <img src="img/aboutus4.jpg" width="1661" height="550">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 5</div>
      <img src="img/aboutus6.jpg" width="1661" height="550">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 5</div>
      <img src="img/aboutus5.jpg" width="1661" height="550">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">4 / 5</div>
      <img src="img/aboutus2.jpg" width="1661" height="550">
  </div>
  
  <div class="mySlides">
    <div class="numbertext">5 / 5</div>
      <img src="img/aboutus3.jpg" width="1661" height="550">
  </div>
  
  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
  </div>
  <br><br><br>
  
  <h1>CONTACT DETAILS</h1><br>
  <h3>PAWTARIAN ADOPTION CENTRE</h3>
  <section>
  <p class="contact">
       <img src="img/clock.png" alt="">
       MONDAY - SUNDAY (10:00am - 10pm)
    </p>
    
    <p class="contact">
       <img src="img/call.png" alt="">
       0129228374 (NAVWINDERAN)
    </p>
  
    <p class="contact">
       <img src="img/location.png" alt="">
       NO 15-G, JALAN BAYU LAUT 1/KS09
 	KOTA BAYUEMAS <br><span class="bottom">PANDAMARAN 
 	41200 KLANG SELANGOR DARUL EHSAN</span>
    </p>
    </section><br><br><br>
  
    </body>
    <style>
    body {
            margin:0;
            font-family: Arial, sans-serif;
            background-color: #cfc6c6; 
            background-image: url('img/bgg.jpg');
   			background-size: cover; /* Cover the entire background */ 
        }
        .navbar {
            background-color: #ad6a6c; /* Dark color for the navbar */
            padding: 15px 10px;
        }
        .navbar-brand {
            color: #e8d6cb; /* White color for the brand name */
            font-weight: bold;
        }

        .navbar-brand img {
            width: 40px; /* Adjust the width of the logo */
            margin-right: 10px; /* Adjust the spacing between logo and brand name */
        }

        .navbar-nav .nav-link {
            color: #e8d6cb; /* White color for the links */
            margin-left: 20px; /* Adjust spacing between links */
            font-size: larger;
            font-weight: bold;
        }
        .navbar-nav .nav-link:hover {
            color: #ffffff; /* White color on hover */
        }
		.nav{
	display: flex;
}

.nav i{
	display: inline-flex;
	font-size: 40px;
    margin-top: -05px;
    align-items: end;
}

.nav a{
	color: #e8d6cb;
	font-size: var(--p-font);
	font-weight: 600;
	margin: 0 13px;
	transition: all .50s ease;
	align-items: center;
	padding: 8px 15px;
	background: var(--main-color);
	border-radius: 3rem;
	box-shadow: black 0px 1px 5px;
	margin-left: 65px; 
}

.nav a:hover {
	background-color: var(--bg-color);
	color: var(--bg-color);
	box-shadow: black 0px 1px 12px;
  }

#menu-icon{
	font-size: 32px;
	color: #ff9f0d;
	z-index: 10001;
	cursor: pointer;
	padding: 8px 15px;
	display: none;
}
.nav a:hover{
	transform: scale(1.1);
	color: white;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
  max-width: 100%;
  height: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
  max-width: 100%;
  height: auto;
  margin-left: -40px;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  transition: all .50s ease;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translate(-50%, -50%);
}

h1{
	color: #ad6a6c;
    font-weight: bold;
    margin-left: 100px;
}

h3{
	color: #ad6a6c; 
   
    margin-left: 100px;
    margin-bottom: 20px;
}

.last{
 margin-left:100px;
  margin-right:100px;
  text-align: justify;
  text-justify: inter-word;
 }
 
 /* Dropdown button */
.dropbtn1 {
    background-color:  var(--bg-color);
    color: white;
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    color: #e8d6cb; /* White color for the links */
            margin-left: 20px; /* Adjust spacing between links */
            font-size: larger;
            font-weight: bold;
}

/* Dropdown button hover effect */
.dropbtn1:hover {
    background-color:  var(--bg-color);
    color: white;
}

/* Dropdown container */
.dropdown1 {
    position: relative;
    display: inline-block;
}

/* Dropdown content */
.dropdown-content1 {
    display: none;
    position: absolute;
    background-color: #e8d6cb;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content1 a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content1 a:hover {
    background-color: #d0ada7;
}

/* Show the dropdown menu */
.show1 {
    display: block;
}

.dropdown-content1 a:hover {
color: white
}

.dropdown1:hover .dropdown-content1 {display: block;}

.dropdown1:hover .dropbtn1 {
background-color: var(--bg-color);
}

.containers {
  text-align: center; /* Center the image horizontally */
  display: flex;
  text-align: center;
  margin-left: 200px;
  width: 1000px;
  height: 600px;
  
}

.contact img {
            width: 20px; /* Adjust the width of the logo */
            margin-right: 10px; /* Adjust the spacing between logo and brand name */
			color: black;
}

section{
margin-left:100px;
}

.bottom{
margin-left:35px;
}

    </style>
    <script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}    
        slides[slideIndex-1].style.display = "block";  
        setTimeout(showSlides, 1250); // Change image every seconds
    }

    function plusSlides(n) {
        slideIndex += n;
        if (slideIndex > slides.length) {slideIndex = 1}
        if (slideIndex < 1) {slideIndex = slides.length}
        showSlides();
    }
    </script>
    </html>
    