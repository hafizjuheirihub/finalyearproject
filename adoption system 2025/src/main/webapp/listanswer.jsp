<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Answer Page</title>
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
</head>
<body>
  <!-- Modal content -->
   <div class="modal-content">
   <form action="updateStatusController" method="post" onsubmit="return confirmUpdate()">
    <h3>Answer of Questionnaire</h3>
    <table border="1" id="example" class="table table-striped">
    <thead>
		<tr>
			<th>Question</th>
			<th>Answer</th>

		</tr>
		</thead>
		<tbody>
                <tr>
                	
                    <td class="question">How many children do you have?</td>
                    <td id="Answer1"><c:out value="${r.answer1}"/></td>
                </tr>
                <tr>
                    <td class="question">What type of home do you live in?</td>
                    <td id="Answer2"><c:out value="${r.answer2}"/></td>
                </tr>
                <tr>
                    <td class="question">Do you have access to outdoor space (yard, garden, etc.) for a pet?</td>
                    <td id="Answer3"><c:out value="${r.answer3}"/></td>
                </tr>
                <tr>                    
                <td class="question">How many in the family have a known allergy to dogs/cats?</td>
                    <td id="Answer4"><c:out value="${r.answer4}"/></td>
                </tr>
                <tr>
                    <td class="question">How many are in agreement with the decision to adopt a dog/cat?</td>
                    <td id="Answer5"><c:out value="${r.answer5}"/></td>
                </tr>
                <tr>
                    <td class="question">How many times can you provide adequate love and attention?</td>
                    <td id="Answer6"><c:out value="${r.answer6}"/></td>
                </tr>
                <tr>
                    <td class="question">How many pets do you have currently?</td>
                    <td id="Answer7"><c:out value="${r.answer7}"/></td>
                </tr>
                <tr>
                    <td class="question">The number of hours (average) the dog/cat will spend alone?</td>
                    <td id="Answer8"><c:out value="${r.answer8}"/></td>
                </tr>
                <tr>
                    <td class="question">Do you agree to provide regular health care by a Licensed Veterinarian?</td>
                    <td id="Answer9"><c:out value="${r.answer9}"/></td>
                </tr>
                <tr>
                    <td class="question">Do you agree to contact PAWTARIAN if you can no longer keep this dog/cat?</td>
                    <td id="Answer10"><c:out value="${r.answer10}"/></td>
                </tr>
            </tbody>
		</table><br>
    <div class="column">
            <div class="form-group">
    			<label for="status" style="font-weight: bold;">Status</label>
    			<select name="Status" class="form-control"required>
    			<option value="" disabled selected>Please select one option</option>
        		<option value="Approve">Approve</option>
        		<option value="Reject">Reject</option>
    			</select>
			</div>
    <div class="form-group">
                <label for="remarks" style="font-weight: bold;">Remarks</label>
                <input type="text" name="Remarks" class="form-control" placeholder="Please enter the remarks if any">
            </div>
           <input type="hidden" class="form-control" id="request" name="RequestID" value="<c:out value="${r.requestID}"/>">
           <button type="submit" id="button-container">Save</button>                   
    </div>
    </form>
    </div>
 

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
	<script>
	 $(document).ready(function () {
         $('#example').DataTable();
     });
	
	 function confirmUpdate() {
	     // Display a confirmation message using the built-in confirm dialog
	     var confirmation = confirm("Are you sure you want to update status and remarks");
	     // If the user confirms, show the success message
	     if (confirmation) {
	         // Show the success message after a short delay to ensure form submission
	         setTimeout(function() {
	             alert("Status and remarks successfully updated");
	         }, 100);
	     }
	     return confirmation; // Return true or false based on user's confirmation
	 }
	 </script>
	 <style>
	 .form-group {
   width: 100%; /* Set the width of the form group to 100% */
   margin-bottom: 20px; /* Add space between form groups */
	}
	
	.column {
   width: 50%; /* Each column takes half the width */
   float: left; /* Float the columns to align them side by side */
   padding: 20px; /* Add padding for spacing */
   box-sizing: border-box; /* Include padding in the width */
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
  margin-top: 50px;
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