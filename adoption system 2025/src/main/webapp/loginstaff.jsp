<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Staff Page</title>
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
            <h4>STAFF</h4>

            <!-- Toggler/collapsibe Button for Small Screens -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links on the Right Side -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">        
                    <li class="nav-item">
                        <a class="nav-link" href="loginstaff.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signupstaff.jsp">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="login-container">
        <div class="form_area">
            <p class="title">LOGIN</p>
            <form action="loginStaffController" method="post"  autocomplete="off" class="sign-in-form" onsubmit="return validateLogin()">
                <div class="form_group">
                    <label for="username">Username</label>
                    <input type="text" name="StaffName" id="username" class="form_style" placeholder="Enter your username" required>
                </div>
                <div class="form_group">
                    <label for="password">Password</label>
                    <input type="password" name="StaffPass" id="password" class="form_style" placeholder="Enter your password" required>
                </div>
                <div>
    			<button class="btn">LOGIN</button><br>
<!--                     Did'nt have an account? <a class="link" href="signupstaff.jsp">Sign up Here!</a><br>
 -->                    If you're customer, <a class="link" href="logincust.jsp">Click here!</a><br><br>
                </div>
            </form>
            </div>
            </div>
    
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
    function validateLogin() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "loginStaffController", false);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        var username = document.getElementById("username").value;
        var password = document.querySelector("input[name='StaffPass']").value;
        var params = "StaffName=" + username + "&StaffPass=" + password;

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText === "valid") {
                    alert("Login successfully!");
                    window.location.href = "homepagestaff.jsp"; // Redirect to homecust.jsp
                    return true;
                } else {
                    alert("Invalid username or password.");
                    return false;
                }
            }
        };

        xhr.send(params);
        return false;
    }
</script>
<style>
                   body {
           margin:0;
            font-family: Arial, sans-serif;
/*          background-color: #cfc6c6;  */        
			background-image: url('img/back.jpg');
   			background-size: cover; /* Cover the entire background */
   			background-position: center -160px; /* Center the background image */
   			background-repeat: no-repeat; /* Prevent the background image from repeating */
   			 background-attachment: fixed;
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
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            margin: 30px 0;
            margin-top: 110px;
        }

        .form_area {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: #EDDCD9;
            height: auto;
            width: auto;
            border: 2px solid #264143;
            border-radius: 20px;
            box-shadow: 3px 4px 0px 1px #E99F4C;
            padding: 0 20px;
        }

        .title {
            color: #264143;
            font-weight: 900;
            font-size: 1.5em;
            margin-top: 20px;
        }

        .sub_title {
            font-weight: 600;
            margin: 5px 0;
        }

        .form_group {
            display: flex;
            flex-direction: column;
            align-items: baseline;
            margin: 10px;
        }

        .form_style {
            outline: none;
            border: 2px solid #264143;
            box-shadow: 3px 4px 0px 1px #E99F4C;
            width: 290px;
            padding: 12px 10px;
            border-radius: 4px;
            font-size: 15px;
        }

        .form_style:focus, .btn:focus {
            transform: translateY(4px);
            box-shadow: 1px 2px 0px 0px #E99F4C;
        }

        .btn {
            padding: 15px;
            margin: 25px 0px;
            width: 290px;
            font-size: 15px;
            background: #DE5499;
            border-radius: 10px;
            font-weight: 800;
            box-shadow: 3px 3px 0px 0px #E99F4C;
        }

        .btn:hover {
            opacity: .9;
        }

        .link {
            font-weight: 800;
            color: #264143;
            padding: 5px;
        }
        
        .container {
  		position: relative;
  		max-width: 100%;
  		height: auto;
		}

</style>
</html>
