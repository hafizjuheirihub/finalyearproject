<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Pets</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>    
	
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <!-- Company Name on the Left Side -->
            <a class="navbar-brand" href="#">
                <img src="img/logo.png" alt="">
                 PAWTARIAN ADOPTION
            </a>
			<h4>STAFF</h4>
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
        			<!-- <li class="dropdown2">
            			<button class="dropbtn2">Questionnaire<span class="caret"></span></button>
            		<div id="myDropdown2" class="dropdown-content2">
                	<a href="addquestion.jsp">Add question</a>
                	<a href="listQuestionController">Manage question</a>
        			</div> -->
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

    <c:forEach items="${pets}" var="p" varStatus="pets">
        <div class="pets-box">
            <div class="pets-info">
                <div class="details">
                    <input type="hidden" class="form-control" id="pet" name="PetID" value="${p.petID}">
                     <img class="card-img-top" src="data:image/jpg;base64,${p.petImgBase64}" alt="Pet Image" style="object-fit: cover; width: 200px; height: 200px;"><br>
                    <label for="name">ID: ${p.petID}</label><br>
                    <label for="name">Type: ${p.petType}</label><br>
                    <label for="name">Name: ${p.petName}</label><br>
                    <label for="phone">Date of Birth : ${p.petAge}</label><br>
                    <label for="email">Gender : ${p.petGender}</label><br>
                    <label for="password">Breed : ${p.petBreed}</label><br>
                    <label for="name">Behavior: ${p.petBeharvior}</label><br>
                    <label for="name">Favorite Food : ${p.petFavFood}</label><br>
                </div>
                <button class="button-container" onclick="updatePetsController('${p.petID}')"><i class="fas fa-edit"></i></button>
                <button class="button-danger" id="${p.petID}" onclick="confirmation(this.id)"><i class="fas fa-trash-alt"></i></button>
            </div>
        </div>
    </c:forEach>
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

.pets-box {
            /* transition: .2s ease-in-out; */          
            column-gap: 30px;
            float: left;
            width: 28%;
            padding: 30px;
            margin : 30px;
            margin-left: 45px;
            background-color: #cc8b86;
            border-radius: 15px 15px 15px 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.6);
        }
        
        .pets-box:hover {
  box-shadow: black 0px 5px 50px;
}

        .pets-box img{
            display: block;
            margin-left: auto;
            margin-right: auto;
            position: relative;
            border-radius: 15px;
        }

        .details {
            padding: 15px;
            text-align: center;
            color:#f6e9f8;

        }

        .button-container {
            width: 49%;
            padding: 4px;
            background-color: #0080fe;
            border-color: #0080fe;
            border-radius: 5px;
            color: white;
        }

        .button-container:hover{
            background-color: #0071e2;
            border-color: #0071e2;
        }
        
        .button-danger {
        	width: 49%;
            padding: 4px;
    		background-color: #dc3545; /* Red color for danger */
    		border-color: #dc3545; /* Red color for border */
    		border-radius: 5px;
            color: white;
		}

		.button-danger:hover {
    		background-color: #c82333; /* Darker red color on hover */
    		border-color: #bd2130; /* Darker red color for border on hover */
		}
		
		/* CSS styles */


.filter-container {
  margin-bottom: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.filter-container input[type=text] {
  padding: 10px;
  width: 50%;
  margin-bottom: 10px;
}

.filterDiv {
  background-color: #2196F3;
  color: #ffffff;
  width: calc(25% - 8px); /* Four elements per row */
  line-height: 100px;
  text-align: center;
  margin: 2px;
  display: none;
}

.show {
  display: block;
}

.containers {
  margin-top: 20px;
  overflow: hidden;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 20px;
  background-color: #f1f1f1;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myUL {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block;
}

#myUL li a:hover:not(.header) {
  background-color: #eee;
}
    </style>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    function confirmation(petID) {
    	console.log(petID);
    	var r = confirm("Are you sure you want to delete?");
    	if (r == true) {
    		location.href = 'deletePetsController?PetID=' + petID;
    		alert("Pet details successfully deleted");
    	} else {
    		return false;
    	}
    }
    
    function updatePetsController(petID) {
        // Construct the URL
        var url = 'updatePetsController?PetID=' + petID;
        
        // Redirect to the URL
        window.location.href = url;
    }
 // Filter for elements
    function filterSelection(c) {
      var x, i;
      x = document.getElementsByClassName("filterDiv");
      if (c == "all") c = "";
      for (i = 0; i < x.length; i++) {
        w3RemoveClass(x[i], "show");
        if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
      }
    }

    function w3AddClass(element, name) {
      var i, arr1, arr2;
      arr1 = element.className.split(" ");
      arr2 = name.split(" ");
      for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
      }
    }

    function w3RemoveClass(element, name) {
      var i, arr1, arr2;
      arr1 = element.className.split(" ");
      arr2 = name.split(" ");
      for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
          arr1.splice(arr1.indexOf(arr2[i]), 1);
        }
      }
      element.className = arr1.join(" ");
    }

    // Add active class to the current button (highlight it)
    var btnContainer = document.getElementById("myBtnContainer");
    var btns = btnContainer.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
      btns[i].addEventListener("click", function(){
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
      });
    }
    </script>
    </html>