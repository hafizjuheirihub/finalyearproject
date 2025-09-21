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
<div class="profile-text"> 
        <h2>VIEW ACCOUNT</h2> 
        <a href="#" class="btn1"><i class='bx bxs-user-circle'></i></a> 
    </div>
    
    <form> 
 <div class="container-box"> 
 <br>
 <input type="hidden" class="form-control" id="cust" name="CustID" value="<c:out value="${sessionScope.CustID}"/>">
 <label for="name">Customer ID: <c:out value="${sessionScope.CustID}"/></label><br><br> 
 <label for="name">Name: <c:out value="${sessionScope.CustName}"/></label><br><br> 
 <label for="phone">Phone Number:  <c:out value="${sessionScope.CustPhoneNum}"/></label><br><br> 
 <label for="email">Email: <c:out value="${sessionScope.CustEmail}"/></label><br><br> 
 <label for="password">Password: <c:out value="${sessionScope.CustPass}"/></label><br> 
 
 <div class="button-wrapper"> 
  <a class="button-container" href="updateCustController?CustID=<c:out value="${sessionScope.CustID}"/>"><i class="fas fa-edit"></i></a> 
  <a class="button-danger" id="<c:out value="${sessionScope.CustID}"/>" onclick="confirmation(this.id)"><i class="fas fa-trash-alt"></i></a>
 </div> 
 </div>                            
</form> 
    
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
function confirmation(CustID) {
	console.log(CustID);
	var r = confirm("Are you sure you want to delete?");
	if (r == true) {
		location.href = 'deleteCustController?CustID=' + CustID;
		alert("Your account successfully deleted");
	} else {
		return false;
	}
}
</script>
<style>
body {
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
    font-size: 30px;
	color: #ad6a6c;
	margin-top: 75px; 
	margin-bottom: -15px; 
	margin-left: 35px; 
	font-weight: bolder;
}

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
    background-color: #f9f9f9;
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
    background-color: #ddd;
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

form {
            max-width: 400px;
            margin-left: 640px;
            margin-top: 15px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }
        
        .container-box label{
         	width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #F9B3A7;
			box-shadow: black 3px 3px 5px; 
			margin-top: -20px
        }  
        

.container-box{
         	width: 100%;
            padding: 30px;
            border-radius: 15px;
            border: 1px solid #f4afab;
			box-shadow: black 0px 1px 12px; 
			margin-bottom: 40px;
			background-color:#f4afab;
        }  
        
        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="name"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 15px;
            border: 1px solid #ccc;
			box-shadow: white 0px 1px 15px; 
        }
        
.button-container {
    		padding: 4px;
    		width: 49%;
            background-color: #0080fe;
            border-color: #0080fe;
            border-radius: 5px;
            color: white;
            text-align: center; /* Center text horizontally */
    		display: flex; /* Enable flexbox */
    		align-items: center; /* Center text vertically */
    		justify-content: center; /* Center text horizontally */
        }

        .button-container:hover{
            background-color: #0071e2;
            border-color: #0071e2;
            color: white; /* Ensure text color stays white */
    		text-decoration: none; /* Remove underline on hover */
        }
        
        .button-danger {
        	width: 49%;
            padding: 10px;
    		background-color: #dc3545; /* Red color for danger */
    		border-color: #dc3545; /* Red color for border */
    		border-radius: 5px;
            color: white;
            text-align: center; /* Center text horizontally */
    		display: flex; /* Enable flexbox */
    		align-items: center; /* Center text vertically */
    		justify-content: center; /* Center text horizontally */
		}

		.button-danger:hover {
    		background-color: #c82333; /* Darker red color on hover */
    		border-color: #bd2130; /* Darker red color for border on hover */
    		color: white; /* Ensure text color stays white */
    		text-decoration: none; /* Remove underline on hover */
		}
		
		.button-wrapper {
            display: flex;
            gap: 8px; /* Optional: adds space between the buttons */
        }
</style>
</html>
