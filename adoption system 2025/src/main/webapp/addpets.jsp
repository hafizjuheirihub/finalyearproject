<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add cats</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
	
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
    
    <form action="addPetController" autocomplete="off"  class="sign-in-form" id="Petform" method="post" enctype="multipart/form-data"  onsubmit="showSuccessMessage()">
    <div class="center-box">
        <div class="column">
            <img src="img/camerarb.png" alt="" class="circle">
            
            <!--<div>
                <input type="file" id="image" name="image" accept="image/jpeg" required>
            </div>-->
			<input type="file" id="image" name="PetImg" accept="image/*" required><br><br>
            <div>
                <img src="img/pets.png" alt="" class="img">
                </div>
        </div>
        <div class="column">
        				 <input type="hidden" class="form-control" id="staff" name="StaffID" value="<c:out value="${sessionScope.StaffID}"/>">
 						<%--<label for="name" class="child" >Staff ID: <c:out value="${sessionScope.StaffID}"/></label><br>
 						<label for="name" class="child" >Staff Name: <c:out value="${sessionScope.StaffName}"/></label><br> --%>
            <div class="form-group">
    			<label for="type">1. Pets Type</label>
    			<select name="PetType" class="form-control"required>
    			<option value="" disabled selected>Select Pet's Type</option>
        		<option value="Cat">Cat</option>
        		<option value="Dog">Dog</option>
    			</select>
			</div>
            <div class="form-group">
                <label for="name">2. Name</label>
                <input type="text" name="PetName" class="form-control" placeholder="Enter Pet's Name" required>
            </div>
            <div class="form-group">
    <label for="dob">3. Date of Birth</label>
    <input 
    	type="text"
        name="PetAge" 
        id="dob" 
        class="form-control" 
        placeholder="Enter Pet's Date of Birth (Example: 25-12-2019)" 
        required
        pattern="\d{2}/\d{2}/\d{4}"
        title="Please enter the date in DD/MM/YYYY format">
</div>
            <div class="form-group">
                <label for="gender">4. Gender</label>
                <select id="breedDropdown" name="PetGender" class="form-control" required>
                <option value="" disabled selected>Select Pet's Gender</option>
        		<option value="Male">Male</option>
        		<option value="Female">Female</option>
        		</select>
            </div>
            <div class="form-group">
    <label for="breed">5. Breed</label>
    <select name="PetBreed" class="form-control" required>
        <option value="" disabled selected>Select Pet's Breed</option>
<option value="Abyssinian">Abyssinian</option>
<option value="Akita">Akita</option>
<option value="Alaskan Malamute">Alaskan Malamute</option>
<option value="American Bobtail">American Bobtail</option>
<option value="American Curl">American Curl</option>
<option value="American Eskimo Dog">American Eskimo Dog</option>
<option value="American Pit Bull Terrier">American Pit Bull Terrier</option>
<option value="American Shorthair">American Shorthair</option>
<option value="American Staffordshire Terrier">American Staffordshire Terrier</option>
<option value="Australian Shepherd">Australian Shepherd</option>
<option value="Australian Terrier">Australian Terrier</option>
<option value="Balinese">Balinese</option>
<option value="Basenji">Basenji</option>
<option value="Basset Hound">Basset Hound</option>
<option value="Beagle">Beagle</option>
<option value="Belgian Malinois">Belgian Malinois</option>
<option value="Belgian Tervuren">Belgian Tervuren</option>
<option value="Bengal">Bengal</option>
<option value="Bernese Mountain Dog">Bernese Mountain Dog</option>
<option value="Bichon Frise">Bichon Frise</option>
<option value="Bichon Havanais">Bichon Havanais</option>
<option value="Birman">Birman</option>
<option value="Blue Heeler">Blue Heeler</option>
<option value="Boerboel">Boerboel</option>
<option value="Bombay">Bombay</option>
<option value="Border Collie">Border Collie</option>
<option value="Borzoi">Borzoi</option>
<option value="Boston Terrier">Boston Terrier</option>
<option value="Bouvier des Flandres">Bouvier des Flandres</option>
<option value="Boxer">Boxer</option>
<option value="British Longhair">British Longhair</option>
<option value="British Shorthair">British Shorthair</option>
<option value="Brittany Spaniel">Brittany Spaniel</option>
<option value="Bull Terrier">Bull Terrier</option>
<option value="Bulldog">Bulldog</option>
<option value="Burmese">Burmese</option>
<option value="Cane Corso">Cane Corso</option>
<option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option>
<option value="Chartreux">Chartreux</option>
<option value="Chihuahua">Chihuahua</option>
<option value="Chinese Crested">Chinese Crested</option>
<option value="Chow Chow">Chow Chow</option>
<option value="Cocker Spaniel">Cocker Spaniel</option>
<option value="Cornish Rex">Cornish Rex</option>
<option value="Curly-Coated Retriever">Curly-Coated Retriever</option>
<option value="Dachshund">Dachshund</option>
<option value="Dalmatian">Dalmatian</option>
<option value="Devon Rex">Devon Rex</option>
<option value="Doberman Pinscher">Doberman Pinscher</option>
<option value="Dogo Argentino">Dogo Argentino</option>
<option value="Domestic Longhair">Domestic Longhair</option>
<option value="Domestic Shorthair">Domestic Shorthair</option>
<option value="Egyptian Mau">Egyptian Mau</option>
<option value="English Cocker Spaniel">English Cocker Spaniel</option>
<option value="English Setter">English Setter</option>
<option value="English Springer Spaniel">English Springer Spaniel</option>
<option value="Eurasier">Eurasier</option>
<option value="Exotic Shorthair">Exotic Shorthair</option>
<option value="Field Spaniel">Field Spaniel</option>
<option value="Finnish Lapphund">Finnish Lapphund</option>
<option value="Finnish Spitz">Finnish Spitz</option>
<option value="French Bulldog">French Bulldog</option>
<option value="German Pinscher">German Pinscher</option>
<option value="German Shepherd">German Shepherd</option>
<option value="Golden Retriever">Golden Retriever</option>
<option value="Gordon Setter">Gordon Setter</option>
<option value="Great Dane">Great Dane</option>
<option value="Himalayan">Himalayan</option>
<option value="Hovawart">Hovawart</option>
<option value="Irish Setter">Irish Setter</option>
<option value="Irish Terrier">Irish Terrier</option>
<option value="Irish Wolfhound">Irish Wolfhound</option>
<option value="Italian Greyhound">Italian Greyhound</option>
<option value="Jack Russell Terrier">Jack Russell Terrier</option>
<option value="Japanese Bobtail">Japanese Bobtail</option>
<option value="Japanese Spitz">Japanese Spitz</option>
<option value="Keeshond">Keeshond</option>
<option value="Korat">Korat</option>
<option value="Kuvasz">Kuvasz</option>
<option value="LaPerm">LaPerm</option>
<option value="Labrador Retriever">Labrador Retriever</option>
<option value="Leonberger">Leonberger</option>
<option value="Lhasa Apso">Lhasa Apso</option>
<option value="Maine Coon">Maine Coon</option>
<option value="Maltese">Maltese</option>
<option value="Maltese Shih Tzu">Maltese Shih Tzu</option>
<option value="Manx">Manx</option>
<option value="Munchkin">Munchkin</option>
<option value="Neapolitan Mastiff">Neapolitan Mastiff</option>
<option value="Newfoundland">Newfoundland</option>
<option value="Norwegian Forest Cat">Norwegian Forest Cat</option>
<option value="Ocicat">Ocicat</option>
<option value="Old English Sheepdog">Old English Sheepdog</option>
<option value="Oriental Shorthair">Oriental Shorthair</option>
<option value="Papillon">Papillon</option>
<option value="Pekingese">Pekingese</option>
<option value="Persian">Persian</option>
<option value="Pharaoh Hound">Pharaoh Hound</option>
<option value="Plott Hound">Plott Hound</option>
<option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option>
<option value="Pomeranian">Pomeranian</option>
<option value="Poodle">Poodle</option>
<option value="Presa Canario">Presa Canario</option>
<option value="Pug">Pug</option>
<option value="Pyrenean Shepherd">Pyrenean Shepherd</option>
<option value="Ragdoll">Ragdoll</option>
<option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option>
<option value="Rottweiler">Rottweiler</option>
<option value="Russian Blue">Russian Blue</option>
<option value="Saint Bernard">Saint Bernard</option>
<option value="Saluki">Saluki</option>
<option value="Samoyed">Samoyed</option>
<option value="Savannah">Savannah</option>
<option value="Scottish Fold">Scottish Fold</option>
<option value="Scottish Terrier">Scottish Terrier</option>
<option value="Selkirk Rex">Selkirk Rex</option>
<option value="Shetland Sheepdog">Shetland Sheepdog</option>
<option value="Shiba Inu">Shiba Inu</option>
<option value="Shih Tzu">Shih Tzu</option>
<option value="Siamese">Siamese</option>
<option value="Siberian Husky">Siberian Husky</option>
<option value="Sphynx">Sphynx</option>
<option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option>
<option value="Standard Poodle">Standard Poodle</option>
<option value="Sussex Spaniel">Sussex Spaniel</option>
<option value="Tibetan Mastiff">Tibetan Mastiff</option>
<option value="Tonkinese">Tonkinese</option>
<option value="Turkish Angora">Turkish Angora</option>
<option value="Turkish Van">Turkish Van</option>
<option value="Vizsla">Vizsla</option>
<option value="Weimaraner">Weimaraner</option>
<option value="Welsh Corgi">Welsh Corgi</option>
<option value="Welsh Terrier">Welsh Terrier</option>
<option value="West Highland White Terrier">West Highland White Terrier</option>
<option value="Whippet">Whippet</option>
<option value="Xoloitzcuintli">Xoloitzcuintli</option>
<option value="Yorkshire Terrier">Yorkshire Terrier</option>

    </select>
</div>
            <div class="form-group">
                <label for="beharvior">6. Beharviour</label>
                <input type="text" name="PetBeharvior" class="form-control" placeholder="Enter Pet's Beharvior" required>
            </div>
            <div class="form-group">
    <label for="food">7. Favourite food</label>
    <select name="PetFavFood" class="form-control" required>
         <option value="" disabled selected>Select Pet's Favorite Food</option>
        <option value="Applesauce">Applesauce</option>
        <option value="Beef">Beef</option>
        <option value="Bell peppers">Bell peppers</option>
        <option value="Bone Marrow">Bone Marrow</option>
        <option value="Brussels sprouts">Brussels sprouts</option>
        <option value="Cantaloupe">Cantaloupe</option>
        <option value="Carob Chips">Carob Chips</option>
        <option value="Cottage cheese">Cottage cheese</option>
        <option value="Cooked Chicken Liver">Cooked Chicken Liver</option>
        <option value="Cooked Turkey Liver">Cooked Turkey Liver</option>
        <option value="Egg Yolks">Egg Yolks</option>
        <option value="Eggs">Eggs</option>
        <option value="Fish">Fish</option>
        <option value="Green beans">Green beans</option>
        <option value="Green peas">Green peas</option>
        <option value="Lamb">Lamb</option>
        <option value="Lentils">Lentils</option>
        <option value="Liver">Liver</option>
        <option value="Mackerel">Mackerel</option>
        <option value="Oatmeal">Oatmeal</option>
        <option value="Pumpkin">Pumpkin</option>
        <option value="Quinoa">Quinoa</option>
        <option value="Rice">Rice</option>
        <option value="Rice cakes">Rice cakes</option>
        <option value="Salmon">Salmon</option>
        <option value="Sardines">Sardines</option>
        <option value="Shrimp">Shrimp</option>
        <option value="Sweet potatoes">Sweet potatoes</option>
        <option value="Tofu">Tofu</option>
        <option value="Turkey">Turkey</option>
        <option value="Vegetables">Vegetables</option>
        <option value="Yogurt">Yogurt</option>
    </select>
    
    
</div>
        </div>
        <button type="submit" id="button-container"><i class="bi bi-save"></i></button>
    </div>
    </form>

</body>
 <script>
        function showSuccessMessage() {
            alert("Pet added successfully!");
        }

        document.getElementById('dob').addEventListener('blur', function() {
            // Get the value entered by the user
            const enteredDate = this.value;

            // Validate format DD/MM/YYYY
            const isValidFormat = /^\d{2}\/\d{2}\/\d{4}$/.test(enteredDate);
            if (!isValidFormat) {
                alert('Please enter a date in DD/MM/YYYY format.');
                this.value = ''; // Clear the input
                return;
            }

            // Extract DD, MM, YYYY
            const [dd, mm, yyyy] = enteredDate.split('/');

            // Convert parts to numbers
            const day = parseInt(dd, 10);
            const month = parseInt(mm, 10);
            const year = parseInt(yyyy, 10);

            // Validate DD, MM, YYYY limits
            if (day > 31 || month > 12 || year > 2024) {
                alert('Please enter a valid date within the specified limits.');
                this.value = ''; // Clear the input
                return;
            }

            // Create Date objects for comparison
            const enteredDateObj = new Date(year, month - 1, day); // month is 0-indexed
            const currentDate = new Date();

            // Validate date not in the future
            if (enteredDateObj > currentDate) {
                alert('Date of Birth cannot be in the future.');
                this.value = ''; // Clear the input
                return;
            }
        });
    </script>
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

.center-box {
            padding: 30px 30px;
            margin: 50px;
            margin-right: 25%;
            margin-left: 25%;
            background-color: #f4afab;
            border-radius: 15px;
            box-shadow: black 0px 1px 12px;
            overflow: hidden; /* Clear floats within the center box */
        }

        .column {
            width: 50%; /* Each column takes half the width */
            float: left; /* Float the columns to align them side by side */
            padding: 20px; /* Add padding for spacing */
            box-sizing: border-box; /* Include padding in the width */
        }

        .circle {
            width: 200px;
            height: 200px;
            background-color: #e8d6cb;
            border-radius: 50%;
            margin: 70px auto; /* Center the circle horizontally */
            margin-bottom: 20px; /* Add space below the circle */
            margin-left: 35px; /* Add space below the circle */
        }

        .form-group {
            width: 100%; /* Set the width of the form group to 100% */
            margin-bottom: 20px; /* Add space between form groups */
        }

        #image {
            margin-left: 50px ;
        }
       
        #button-container {
            background-color: #0080fe;
            border-color: #0080fe;
            border-radius: 5px;
            color: white;
            padding: 10px 80px;
            margin-top: 10px;
            margin-left: 40%;
        }

        #button-container:hover{
            background-color: #0071e2;
            border-color: #0071e2;
        }

        .img{
            width: 230px;
            height: 230px;
            margin-top: 50px;
            margin-left: 40px;
        }
</style>
</html>
    