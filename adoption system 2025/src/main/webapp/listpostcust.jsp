<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Staff Page</title>
    <!-- Bootstrap CSS -->
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet">
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

<section id="customerTable">
        <div id="ApproveList" class="tab-content">
            <div class="table-responsive">
                <h2>Post Adoption List</h2>
                <table id="example" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Cust Name</th>
                            <th>Pets Name</th>
                            <th>Activity</th>
                            <th>Image</th>
                            <th>Created at</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${postadopts}" var="pa">
                            <tr>
                                <td><c:out value="${pa.custName}"/></td>
                                <td><c:out value="${pa.petName}"/></td>
                                <td><c:out value="${pa.postActivity}"/></td>
                                <td><img src="data:image/jpeg;base64,${pa.postImgBase64}" style="width: 150px; height: 150px;"/></td>
                                <td><c:out value="${pa.submissionTime}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
  <!-- Modal content -->

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
	<script>
	
	 $(document).ready(function () {
         $('#example').DataTable();
     });
	 
	 function confirmation(postID) {
	    	console.log(postID);
	    	var r = confirm("Are you sure you want to delete?");
	    	if (r == true) {
	    		location.href = 'deletePostAdoptionController?PostID=' + postID;
	    		alert("Post Adoption details successfully deleted");
	    	} else {
	    		return false;
	    	}
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
	 
	 .button-danger {
        	width: 30%;
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


	 .about-img img {
	 	max-width: 100%;
	   	height: auto;
	 }

	 section{
	 	padding: 30px 5% 60px;
	 }

	 .table-responsive{
	 	width: 100%;

	 }

	 .table-responsive h2{
	     text-align: center;
	     font-size: 40px;
	 	color: black;
	 	margin-bottom: 30px; 
	 	margin-top: 20px; 
	 	font-weight: bold;
	 }


	 .table {
	     margin-top: 70px;
	 	width: 100%;
	 	margin-bottom: 1rem;
	 	color: black;
	 	background-color: var(--bg-color);
	 }

	 th {
	 	font-weight: 400;
	 	color: black;
	 }

	 .table th, .table td {
	 	padding: 0.75rem;
	 	vertical-align: top;
	 	border: 2px solid black;
	 	text-align: center;
	 }
	
	/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #FFC0CB;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  margin-bottom: 30px;
}

/* The Close Button */
.close {
  color: black;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

select{
padding: 10px 25px; 
}
	 </style>
</html>