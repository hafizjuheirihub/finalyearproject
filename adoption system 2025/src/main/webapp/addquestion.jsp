<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <!-- Company Name on the Left Side -->
            <a class="navbar-brand" href="#">
                <img src="img/logo.png" alt="">
                 PAWTARIAN ADOPTION
            </a>
			<h4 class="first">STAFF</h4>
            <!-- Toggler/collapsibe Button for Small Screens -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links on the Right Side -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="homepagestaff.jsp">Home</a>
                    </li>
                    <li class="dropdown">
            			<button class="dropbtn" onclick="toggleDropdown()">Account<span class="caret"></span></button>
            		<div id="myDropdown" class="dropdown-content">
                	<a href="listCustController">Customer</a>
                	<a href="listStaffController">Staff</a>
        			</div>
             		</li>
                   <li class="dropdown1">
            			<button class="dropbtn1">Pets<span class="caret"></span></button>
            		<div id="myDropdown1" class="dropdown-content1">
                	<a href="addpets.jsp">Add pets</a>
                	<a href="listPetsController">Manage pets</a>
        			</div>
        			 <li class="dropdown2">
            			<button class="dropbtn2">Questionnaire<span class="caret"></span></button>
            		<div id="myDropdown2" class="dropdown-content2">
                	<a href="addquestion.jsp">Add question</a>
                	<a href="listQuestionController">Manage question</a>
        			</div>
        			<li class="nav-item"> 
                        <a class="nav-link" href="listRequestController">Approval</a>
                    </li>
                    <li class="dropdown1">
            <button class="dropbtn1">Post Adoption<span class="caret"></span></button>
            <div id="myDropdown1" class="dropdown-content1">
                <a href="viewPostAdoptionController">Second Vaccination</a>
                <a href="viewPostAdoptionController2">Pet's Current Condition</a>
            </div>
        </li>
                </ul>
                
                <div class="nav">
					<a href="viewstaff.jsp" class="btn" style='margin-left:100px'><i class="fas fa-user-circle"></i></a>
				<div class="bx bx-menu" id="menu-icon"></div>
                <div class="nav"> 
  					<a href="loginstaff.jsp" class="btn"><i class="fas fa-sign-out-alt"></i></a> 
  				<div class="bx bx-menu" id="menu-icon"></div>  
            </div>
            </div>
            </div>
            </div>
    </nav>
    
    <div class="profile-text"> 
        <h2>ADD QUESTION</h2> 
        <a href="#" class="btn1"><i class='bx bxs-user-circle'></i></a> 
    </div>
    <p style="margin-left: 467px">* Please enter the question that you want to ask in the questionnaire form</p>
    <form action="addQuestionController" method="post" autocomplete="off"  class="sign-in-form">
    <div class="center-box">
        <div class="column">
            <div class="form-group">
                <label for="type">What question would you like to ask your customers?</label><br>
                <input type="text" name="QuestionExample" class="form-control" placeholder="Enter the question" required>
            </div>
         </div>   
        <button type="submit" id="button-container">Save</button>
    </div>
    </form>

</body>
<style>
body {
            margin: 0;
            font-family: Arial, sans-serif;
            /* background-color: #cfc6c6;  */
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
            font-size: 17px;
            font-weight: bold;
        }
        .navbar-nav .nav-link:hover {
            color: #ffffff; /* White color on hover */
        }
		.nav{
	display: flex;
}

       .container {
  		position: relative;
  		max-width: 100%;
  		height: auto;
		}
        
        h4{
    		color: #e8d6cb;
    		margin-left: 10px;
    		margin-top: 5px;
    		font-size: var(--p-font);
    		background: var(--other-color);
    		font-weight: 500;
    		letter-spacing: 1px;
    		border-radius: 3rem;
    		box-shadow: black 0px 1px 5px;
    		padding: 4px 10px;
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
	margin: 0 7px;
	transition: all .50s ease;
	align-items: center;
	padding: 8px 15px;
	background: var(--main-color);
	border-radius: 3rem;
	box-shadow: black 0px 1px 5px;
	margin-left: 10px; 
	transform: scale(0.85);
}

.nav a:hover {
	background-color: var(--bg-color);
	color: var(--bg-color);
	box-shadow: black 0px 1px 12px;  }

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

/* Dropdown button */
.dropbtn {
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
.dropbtn:hover {
    background-color:  var(--bg-color);
    color: white;
}

/* Dropdown container */
.dropdown {
    position: relative;
    display: inline-block;
    font-size: 14px;
}

/* Dropdown content */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #e8d6cb;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: #d0ada7;
}

/* Show the dropdown menu */
.show {
    display: block;
}

.dropdown-content a:hover {
color: white
}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {
background-color: var(--bg-color);
}

/* Dropdown button */
.dropbtn1 {
    background-color:  var(--bg-color);
    color: white;
    padding: 10px 15px;
    font-size: 14px;
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
    font-size: 14px;
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
    background-color: #d0ada7;;
}

/* Show the dropdown menu */
.show1 {
    display: block;
}

.dropdown-content1 a:hover {
color: white
}

.dropdown1:hover 

.dropdown-content1 {display: block;}

.dropdown1:hover .dropbtn1 {
background-color: var(--bg-color);
}

/* Dropdown button */
.dropbtn2 {
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
.dropbtn2:hover {
    background-color:  var(--bg-color);
    color: white;
}

/* Dropdown container */
.dropdown2 {
    position: relative;
    display: inline-block;
    font-size: 14px;
}

/* Dropdown content */
.dropdown-content2 {
    display: none;
    position: absolute;
    background-color: #e8d6cb;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content2 a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content2 a:hover {
    background-color: #d0ada7;
}

/* Show the dropdown menu */
.show2 {
    display: block;
}

.dropdown-content2 a:hover {
color: white
}

.dropdown2:hover .dropdown-content2 {display: block;}

.dropdown2:hover .dropbtn2 {
background-color: var(--bg-color);
}

.about-img img {
	max-width: 100%;
  	height: auto;
}

.container {
  position: relative;
  max-width: 100%;
  height: auto;
}

.profile-text h2{
    text-align: center;
    margin-top: 100px;
    font-size: 30px;
    color: #ad6a6c;
    font-weight: bolder;
}

.center-box {
   padding: 30px 30px;
   margin: 50px;
   margin-right: 25%;
   margin-left: 25%;
  background-color: #f4afab;
     border-radius: 15px;
   box-shadow: 0 0 15px rgba(0, 0, 0, 0.6);
   overflow: hidden; /* Clear floats within the center box */
}

.column {
   width: 100%; /* Each column takes half the width */
   float: left; /* Float the columns to align them side by side */
   padding: 20px; /* Add padding for spacing */
   box-sizing: border-box; /* Include padding in the width */
}

.form-group {
   width: 100%; /* Set the width of the form group to 100% */
   margin-bottom: 20px; /* Add space between form groups */
}

        
       
        #button-container {
            background-color: #0080fe;
            border-color: #0080fe;
            border-radius: 5px;
            color: white;
            padding: 5px 40px;
            margin-top: 10px;
            margin-left: 40%;
        }

        #button-container:hover{
            background-color: #0071e2;
            border-color: #0071e2;
        }
</style>
</html>