<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="listCust2.css">
    <!---box icons--->   
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!---google fonts--->   
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">   
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
                    <li class="nav-item">
                        <a class="nav-link" href="homepagecust.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listAdoptPetsController">Pets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="requestController">Pets Request</a>
                    </li>
                    <li class="dropdown1">
            <button class="dropbtn1">Post Adoption<span class="caret"></span></button>
            <div id="myDropdown1" class="dropdown-content1">
                <a href="listPostAdoptionController">Second Vaccination</a>
                <a href="listPostAdoptionController2">Pet's Current Condition</a>
            </div>
            </li>
                </ul>
                
  				<div class="nav">
					<a href="viewCustController" class="btn" style='margin-left:100px'><i class="fas fa-user-circle"></i></a>
				<div class="bx bx-menu" id="menu-icon"></div>
                <div class="nav"> 
  					<a href="logincust.jsp" class="btn" style='margin-left:10px'><i class="fas fa-sign-out-alt"></i></a> 
  				<div class="bx bx-menu" id="menu-icon"></div> 
			</div>
            </div>
            </div>
        </div>
    </nav>
    <div class="form">
        <div class="bg-pattern"></div>
        <h2>Pre-Adoption Questionnaire</h2>
        <form action="addRequestController" autocomplete="off" method="post" onsubmit="myFunction2()">
        
        				<input type="hidden" class="form-control" id="pet" name="PetID" value="<c:out value="${p.petID}"/>">
        				<input type="hidden" class="form-control" id="cust" name="CustID" value="<c:out value="${sessionScope.CustID}"/>">
 						<label for="name" class="child">Pet Name: <c:out value="${p.petName}"/></label><br>
 						<label for="name" class="child">Pet Type: <c:out value="${p.petType}"/></label><br>
 						<label for="name" class="child" >Customer ID: <c:out value="${sessionScope.CustID}"/></label><br>
 						<label for="name" class="child" >Customer Name: <c:out value="${sessionScope.CustName}"/></label><br>	
 						
 						
                        <div><label for="children" class="form-label">How many children do you have?</label></div>
                        <div class="input-group mb-3">
                            <select name="Answer1" id="children" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="None">None</option>
                                <option value="1-2">1-2</option>
                                <option value="3-4">3-4</option>
                                <option value="5 or more">5 or more</option>
                            </select>
                        </div><br>
                        <div><label for="home" class="form-label">What type of home do you live in?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer2" id="home" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="Apartment/Condominium">Apartment/Condominium</option>
                                <option value="Terrace/Townhouse">Terrace/Townhouse</option>
                                <option value="Semi-D/Bungalow">Semi-D/Bungalow</option>
                            </select>
                        </div><br>
                        <div><label for="home" class="form-label">Do you have access to outdoor space (yard, garden, etc.) for a pet?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer3" id="home" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="No outdoor space">No outdoor space</option>
                                <option value="Small balcony or patio">Small balcony or patio</option>
                                <option value="Medium-sized yard">Medium-sized yard</option>
                                <option value="Large yard or garden">Large yard or garden</option>	
                            </select>
                        </div><br>
                        <div><label for="allergy" class="form-label">How many in the family have a known allergy to dogs/cats?</label></div>
                        <div class="input-group mb-3">
                            <select name="Answer4" id="allergy" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="None">None</option>
                                <option value="1-2">1-2</option>
                                <option value="3-4">3-4</option>
                                <option value="5 or more">5 or more</option>
                            </select>
                        </div><br>
                        <div><label for="agreement" class="form-label">How many are in agreement with the decision to adopt a dog/cat?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer5" id="agreement" class="form-option" required>
                            	<option value="" disabled selected>Please select one option</option>
                                <option value="None">None</option>
                                <option value="Some">Some</option>
                                <option value="Most">Most</option>
                                <option value="All">All</option>
                            </select>
                        </div><br>
                        <div><label for="attention" class="form-label">How many times can you provide adequate love and attention?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer6" id="attention" class="form-option" required>
                            	<option value="" disabled selected>Please select one option</option>
                                <option value="Rarely">Rarely</option>
                                <option value="Occasionally">Occasionally</option>
                                <option value="Most">Most</option>
                                <option value="All">All</option>
                            </select>
                        </div><br>
                        <div><label for="pets" class="form-label">How many pets do you have currently?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer7" id="pets" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="None">None</option>
                                <option value="1">1</option>
                                <option value="2-3">2-3</option>
                                <option value="4 or more">4 or more</option>
                            </select>
                        </div><br>
                        <div><label for="alone" class="form-label">The number of hours (average) the dog/cat will spend alone?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer8" id="alone" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="Less than 1 hour">Less than 1 hour</option>
                                <option value="1-3 hours">1-3 hours</option>
                                <option value="4-6 hours">4-6 hours</option>
                                <option value="More than 6 hours">More than 6 hours</option>
                            </select>
                        </div><br>
                        <div><label for="health" class="form-label">Do you agree to provide regular health care by a Licensed Veterinarian?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer9" id="health" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                        </div><br>
                        <div><label for="contact" class="form-label">Do you agree to contact PAWTARIAN if you can no longer keep this dog/cat?</label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="Answer10" id="contact" class="form-option" required>
                                <option value="" disabled selected>Please select one option</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                        </div>
                        <div class="input-box">

                    <input type="hidden" class="form-control" for="password" value="<c:out value="${sessionScope.CustPass}"/>">
                    <input type="hidden" id="PetID" name="PetID" value="<%= request.getParameter("PetID") %>">
                    <input type="hidden" id="CustID" name="CustID" value="<c:out value="${sessionScope.CustID}"/>">
                </div>
                            <div class="text-center">
                                <button type="submit">SUBMIT</button>
                            </div>
                    </form>
                </div>
         


    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
function myFunction2() {
	   alert("Your request has been submitted!");
	 }
</script>
<style>
/* Dropdown button */
.dropbtn1 {
    background-color:  var(--bg-color);
    color: white;
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    color: #282e82; /* White color for the links */
            margin-left: 20px; /* Adjust spacing between links */
            font-size: larger;
            font-weight: bold;
}

/* Dropdown button hover effect */
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
	     font-size: 17px;
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

.container {
  position: relative;
  max-width: 100%;
  height: auto;
}

.profile-text h2{
    text-align: center;
    margin-top: 30px;
    font-size: 30px;
    color: #282e82;
    font-weight: bold;
}

        .form {
            background-color: #f4afab;
            border-radius: 10px;
            box-shadow: black 0px 1px 15px;
            padding: 40px 100px;
            margin: 50px 25%;
        }

        .form-control{
            background-color: #ae8557;
            border-color: #ae8557;
        }

        .bg-pattern {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://pngtree.com/freebackground/minimalist-cream-pastel-floral-background-wallpaper_1441632.html');
            /* opacity: 0.1; */
            pointer-events: none;
            z-index: -1;
        }

        h2 {
            color: #343a40;
            text-align: center;
            margin: 40px auto;
        }

        .section {
            margin-bottom: 35px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 30px;
            font-size: medium;
        }

        textarea.form-control {
            resize: none;
        }

        button[type="submit"] {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
        }
        
        .container-box label{
         	width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #dfac7a;
			box-shadow: black 3px 3px 5px; 
			margin-top: -20px
        }  
        
        
        .form-option{
         width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
			box-shadow: white 0px 1px 15px; 
        }

.child {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid black;
        }
        
    </style>
    <script>
    function listAnswerController(answerID) {
        // Construct the URL
        var url = 'listAnswerController?AnswerID' + answerID;
        
        // Redirect to the URL
        window.location.href = url;
    }
    </script>
   
</html>
