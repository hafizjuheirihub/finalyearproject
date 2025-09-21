<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Cats</title>
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
        			<!-- <li class="dropdown2">
            			<button class="dropbtn2">Questionnaire<span class="caret"></span></button>
            		<div id="myDropdown2" class="dropdown-content2">
                	<a href="addquestion.jsp">Add question</a>
                	<a href="listQuestionController">Manage question</a>
        			</div -->>
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
        <h2>UPDATE PET INFORMATION</h2> 
        <a href="#" class="btn1"><i class='bx bxs-user-circle'></i></a> 
    </div> 
<form action="updatePetsController" method="post" onsubmit="return confirmUpdate()" enctype="multipart/form-data">
    <div class="container-box">        
        PET TYPE: 
        <select name="PetType" class="form-control" required>
            <option value="" disabled>Select Pet's Type</option>
            <option value="Cat" <c:if test="${p.petType == 'Cat'}">selected</c:if>>Cat</option>
            <option value="Dog" <c:if test="${p.petType == 'Dog'}">selected</c:if>>Dog</option>
        </select>
        <br>
        
        NAME: 
        <input type="text" name="PetName" value="<c:out value="${p.petName}"/>"/>
        <br>

        <div class="form-group">
    <label for="dob">3. Date of Birth</label>
    <input 
        type="text" 
        name="PetAge" 
        id="dob"
        class="form-control" 
        value="<c:out value='${p.petAge}'/>" 
        placeholder="Enter Pet's Date of Birth (Example: 25/12/2019)" 
        required
        pattern="\d{2}/\d{2}/\d{4}"
        title="Please enter the date in DD/MM/YYYY format">
</div>

        GENDER: 
        <select name="PetGender" class="form-control" required>
            <option value="" disabled>Select Pet's Gender</option>
            <option value="Male" <c:if test="${p.petGender == 'Male'}">selected</c:if>>Male</option>
            <option value="Female" <c:if test="${p.petGender == 'Female'}">selected</c:if>>Female</option>
        </select>
        <br>

        BREED: 
        <select name="PetBreed" class="form-control" required>
            <option value="" disabled selected>Select Pet's Breed</option>
<!-- List all breeds and set selected if matched -->
<option value="Abyssinian" <c:if test="${p.petBreed == 'Abyssinian'}">selected</c:if>>Abyssinian</option>
<option value="Akita" <c:if test="${p.petBreed == 'Akita'}">selected</c:if>>Akita</option>
<option value="Alaskan Malamute" <c:if test="${p.petBreed == 'Alaskan Malamute'}">selected</c:if>>Alaskan Malamute</option>
<option value="American Bobtail" <c:if test="${p.petBreed == 'American Bobtail'}">selected</c:if>>American Bobtail</option>
<option value="American Curl" <c:if test="${p.petBreed == 'American Curl'}">selected</c:if>>American Curl</option>
<option value="American Eskimo Dog" <c:if test="${p.petBreed == 'American Eskimo Dog'}">selected</c:if>>American Eskimo Dog</option>
<option value="American Pit Bull Terrier" <c:if test="${p.petBreed == 'American Pit Bull Terrier'}">selected</c:if>>American Pit Bull Terrier</option>
<option value="American Shorthair" <c:if test="${p.petBreed == 'American Shorthair'}">selected</c:if>>American Shorthair</option>
<option value="American Staffordshire Terrier" <c:if test="${p.petBreed == 'American Staffordshire Terrier'}">selected</c:if>>American Staffordshire Terrier</option>
<option value="Australian Shepherd" <c:if test="${p.petBreed == 'Australian Shepherd'}">selected</c:if>>Australian Shepherd</option>
<option value="Australian Terrier" <c:if test="${p.petBreed == 'Australian Terrier'}">selected</c:if>>Australian Terrier</option>
<option value="Balinese" <c:if test="${p.petBreed == 'Balinese'}">selected</c:if>>Balinese</option>
<option value="Basenji" <c:if test="${p.petBreed == 'Basenji'}">selected</c:if>>Basenji</option>
<option value="Basset Hound" <c:if test="${p.petBreed == 'Basset Hound'}">selected</c:if>>Basset Hound</option>
<option value="Beagle" <c:if test="${p.petBreed == 'Beagle'}">selected</c:if>>Beagle</option>
<option value="Belgian Malinois" <c:if test="${p.petBreed == 'Belgian Malinois'}">selected</c:if>>Belgian Malinois</option>
<option value="Belgian Tervuren" <c:if test="${p.petBreed == 'Belgian Tervuren'}">selected</c:if>>Belgian Tervuren</option>
<option value="Bengal" <c:if test="${p.petBreed == 'Bengal'}">selected</c:if>>Bengal</option>
<option value="Bernese Mountain Dog" <c:if test="${p.petBreed == 'Bernese Mountain Dog'}">selected</c:if>>Bernese Mountain Dog</option>
<option value="Bichon Frise" <c:if test="${p.petBreed == 'Bichon Frise'}">selected</c:if>>Bichon Frise</option>
<option value="Bichon Havanais" <c:if test="${p.petBreed == 'Bichon Havanais'}">selected</c:if>>Bichon Havanais</option>
<option value="Birman" <c:if test="${p.petBreed == 'Birman'}">selected</c:if>>Birman</option>
<option value="Blue Heeler" <c:if test="${p.petBreed == 'Blue Heeler'}">selected</c:if>>Blue Heeler</option>
<option value="Boerboel" <c:if test="${p.petBreed == 'Boerboel'}">selected</c:if>>Boerboel</option>
<option value="Bombay" <c:if test="${p.petBreed == 'Bombay'}">selected</c:if>>Bombay</option>
<option value="Border Collie" <c:if test="${p.petBreed == 'Border Collie'}">selected</c:if>>Border Collie</option>
<option value="Borzoi" <c:if test="${p.petBreed == 'Borzoi'}">selected</c:if>>Borzoi</option>
<option value="Boston Terrier" <c:if test="${p.petBreed == 'Boston Terrier'}">selected</c:if>>Boston Terrier</option>
<option value="Bouvier des Flandres" <c:if test="${p.petBreed == 'Bouvier des Flandres'}">selected</c:if>>Bouvier des Flandres</option>
<option value="Boxer" <c:if test="${p.petBreed == 'Boxer'}">selected</c:if>>Boxer</option>
<option value="British Longhair" <c:if test="${p.petBreed == 'British Longhair'}">selected</c:if>>British Longhair</option>
<option value="British Shorthair" <c:if test="${p.petBreed == 'British Shorthair'}">selected</c:if>>British Shorthair</option>
<option value="Brittany Spaniel" <c:if test="${p.petBreed == 'Brittany Spaniel'}">selected</c:if>>Brittany Spaniel</option>
<option value="Bull Terrier" <c:if test="${p.petBreed == 'Bull Terrier'}">selected</c:if>>Bull Terrier</option>
<option value="Bulldog" <c:if test="${p.petBreed == 'Bulldog'}">selected</c:if>>Bulldog</option>
<option value="Burmese" <c:if test="${p.petBreed == 'Burmese'}">selected</c:if>>Burmese</option>
<option value="Cane Corso" <c:if test="${p.petBreed == 'Cane Corso'}">selected</c:if>>Cane Corso</option>
<option value="Cavalier King Charles Spaniel" <c:if test="${p.petBreed == 'Cavalier King Charles Spaniel'}">selected</c:if>>Cavalier King Charles Spaniel</option>
<option value="Chartreux" <c:if test="${p.petBreed == 'Chartreux'}">selected</c:if>>Chartreux</option>
<option value="Chihuahua" <c:if test="${p.petBreed == 'Chihuahua'}">selected</c:if>>Chihuahua</option>
<option value="Chinese Crested" <c:if test="${p.petBreed == 'Chinese Crested'}">selected</c:if>>Chinese Crested</option>
<option value="Chow Chow" <c:if test="${p.petBreed == 'Chow Chow'}">selected</c:if>>Chow Chow</option>
<option value="Cocker Spaniel" <c:if test="${p.petBreed == 'Cocker Spaniel'}">selected</c:if>>Cocker Spaniel</option>
<option value="Cornish Rex" <c:if test="${p.petBreed == 'Cornish Rex'}">selected</c:if>>Cornish Rex</option>
<option value="Curly-Coated Retriever" <c:if test="${p.petBreed == 'Curly-Coated Retriever'}">selected</c:if>>Curly-Coated Retriever</option>
<option value="Dachshund" <c:if test="${p.petBreed == 'Dachshund'}">selected</c:if>>Dachshund</option>
<option value="Dalmatian" <c:if test="${p.petBreed == 'Dalmatian'}">selected</c:if>>Dalmatian</option>
<option value="Devon Rex" <c:if test="${p.petBreed == 'Devon Rex'}">selected</c:if>>Devon Rex</option>
<option value="Doberman Pinscher" <c:if test="${p.petBreed == 'Doberman Pinscher'}">selected</c:if>>Doberman Pinscher</option>
<option value="Dogo Argentino" <c:if test="${p.petBreed == 'Dogo Argentino'}">selected</c:if>>Dogo Argentino</option>
<option value="Domestic Longhair" <c:if test="${p.petBreed == 'Domestic Longhair'}">selected</c:if>>Domestic Longhair</option>
<option value="Domestic Shorthair" <c:if test="${p.petBreed == 'Domestic Shorthair'}">selected</c:if>>Domestic Shorthair</option>
<option value="Egyptian Mau" <c:if test="${p.petBreed == 'Egyptian Mau'}">selected</c:if>>Egyptian Mau</option>
<option value="English Cocker Spaniel" <c:if test="${p.petBreed == 'English Cocker Spaniel'}">selected</c:if>>English Cocker Spaniel</option>
<option value="English Setter" <c:if test="${p.petBreed == 'English Setter'}">selected</c:if>>English Setter</option>
<option value="English Springer Spaniel" <c:if test="${p.petBreed == 'English Springer Spaniel'}">selected</c:if>>English Springer Spaniel</option>
<option value="Eurasier" <c:if test="${p.petBreed == 'Eurasier'}">selected</c:if>>Eurasier</option>
<option value="Exotic Shorthair" <c:if test="${p.petBreed == 'Exotic Shorthair'}">selected</c:if>>Exotic Shorthair</option>
<option value="Field Spaniel" <c:if test="${p.petBreed == 'Field Spaniel'}">selected</c:if>>Field Spaniel</option>
<option value="Finnish Lapphund" <c:if test="${p.petBreed == 'Finnish Lapphund'}">selected</c:if>>Finnish Lapphund</option>
<option value="Finnish Spitz" <c:if test="${p.petBreed == 'Finnish Spitz'}">selected</c:if>>Finnish Spitz</option>
<option value="French Bulldog" <c:if test="${p.petBreed == 'French Bulldog'}">selected</c:if>>French Bulldog</option>
<option value="German Pinscher" <c:if test="${p.petBreed == 'German Pinscher'}">selected</c:if>>German Pinscher</option>
<option value="German Shepherd" <c:if test="${p.petBreed == 'German Shepherd'}">selected</c:if>>German Shepherd</option>
<option value="Golden Retriever" <c:if test="${p.petBreed == 'Golden Retriever'}">selected</c:if>>Golden Retriever</option>
<option value="Gordon Setter" <c:if test="${p.petBreed == 'Gordon Setter'}">selected</c:if>>Gordon Setter</option>
<option value="Great Dane" <c:if test="${p.petBreed == 'Great Dane'}">selected</c:if>>Great Dane</option>
<option value="Himalayan" <c:if test="${p.petBreed == 'Himalayan'}">selected</c:if>>Himalayan</option>
<option value="Hovawart" <c:if test="${p.petBreed == 'Hovawart'}">selected</c:if>>Hovawart</option>
<option value="Irish Setter" <c:if test="${p.petBreed == 'Irish Setter'}">selected</c:if>>Irish Setter</option>
<option value="Irish Terrier" <c:if test="${p.petBreed == 'Irish Terrier'}">selected</c:if>>Irish Terrier</option>
<option value="Irish Wolfhound" <c:if test="${p.petBreed == 'Irish Wolfhound'}">selected</c:if>>Irish Wolfhound</option>
<option value="Italian Greyhound" <c:if test="${p.petBreed == 'Italian Greyhound'}">selected</c:if>>Italian Greyhound</option>
<option value="Jack Russell Terrier" <c:if test="${p.petBreed == 'Jack Russell Terrier'}">selected</c:if>>Jack Russell Terrier</option>
<option value="Japanese Bobtail" <c:if test="${p.petBreed == 'Japanese Bobtail'}">selected</c:if>>Japanese Bobtail</option>
<option value="Japanese Spitz" <c:if test="${p.petBreed == 'Japanese Spitz'}">selected</c:if>>Japanese Spitz</option>
<option value="Keeshond" <c:if test="${p.petBreed == 'Keeshond'}">selected</c:if>>Keeshond</option>
<option value="Korat" <c:if test="${p.petBreed == 'Korat'}">selected</c:if>>Korat</option>
<option value="Kuvasz" <c:if test="${p.petBreed == 'Kuvasz'}">selected</c:if>>Kuvasz</option>
<option value="LaPerm" <c:if test="${p.petBreed == 'LaPerm'}">selected</c:if>>LaPerm</option>
<option value="Labrador Retriever" <c:if test="${p.petBreed == 'Labrador Retriever'}">selected</c:if>>Labrador Retriever</option>
<option value="Leonberger" <c:if test="${p.petBreed == 'Leonberger'}">selected</c:if>>Leonberger</option>
<option value="Lhasa Apso" <c:if test="${p.petBreed == 'Lhasa Apso'}">selected</c:if>>Lhasa Apso</option>
<option value="Maine Coon" <c:if test="${p.petBreed == 'Maine Coon'}">selected</c:if>>Maine Coon</option>
<option value="Maltese" <c:if test="${p.petBreed == 'Maltese'}">selected</c:if>>Maltese</option>
<option value="Maltese Shih Tzu" <c:if test="${p.petBreed == 'Maltese Shih Tzu'}">selected</c:if>>Maltese Shih Tzu</option>
<option value="Manx" <c:if test="${p.petBreed == 'Manx'}">selected</c:if>>Manx</option>
<option value="Munchkin" <c:if test="${p.petBreed == 'Munchkin'}">selected</c:if>>Munchkin</option>
<option value="Neapolitan Mastiff" <c:if test="${p.petBreed == 'Neapolitan Mastiff'}">selected</c:if>>Neapolitan Mastiff</option>
<option value="Newfoundland" <c:if test="${p.petBreed == 'Newfoundland'}">selected</c:if>>Newfoundland</option>
<option value="Norwegian Forest Cat" <c:if test="${p.petBreed == 'Norwegian Forest Cat'}">selected</c:if>>Norwegian Forest Cat</option>
<option value="Ocicat" <c:if test="${p.petBreed == 'Ocicat'}">selected</c:if>>Ocicat</option>
<option value="Old English Sheepdog" <c:if test="${p.petBreed == 'Old English Sheepdog'}">selected</c:if>>Old English Sheepdog</option>
<option value="Oriental Shorthair" <c:if test="${p.petBreed == 'Oriental Shorthair'}">selected</c:if>>Oriental Shorthair</option>
<option value="Papillon" <c:if test="${p.petBreed == 'Papillon'}">selected</c:if>>Papillon</option>
<option value="Pekingese" <c:if test="${p.petBreed == 'Pekingese'}">selected</c:if>>Pekingese</option>
<option value="Persian" <c:if test="${p.petBreed == 'Persian'}">selected</c:if>>Persian</option>
<option value="Pharaoh Hound" <c:if test="${p.petBreed == 'Pharaoh Hound'}">selected</c:if>>Pharaoh Hound</option>
<option value="Plott Hound" <c:if test="${p.petBreed == 'Plott Hound'}">selected</c:if>>Plott Hound</option>
<option value="Polish Lowland Sheepdog" <c:if test="${p.petBreed == 'Polish Lowland Sheepdog'}">selected</c:if>>Polish Lowland Sheepdog</option>
<option value="Pomeranian" <c:if test="${p.petBreed == 'Pomeranian'}">selected</c:if>>Pomeranian</option>
<option value="Poodle" <c:if test="${p.petBreed == 'Poodle'}">selected</c:if>>Poodle</option>
<option value="Presa Canario" <c:if test="${p.petBreed == 'Presa Canario'}">selected</c:if>>Presa Canario</option>
<option value="Pug" <c:if test="${p.petBreed == 'Pug'}">selected</c:if>>Pug</option>
<option value="Pyrenean Shepherd" <c:if test="${p.petBreed == 'Pyrenean Shepherd'}">selected</c:if>>Pyrenean Shepherd</option>
<option value="Ragdoll" <c:if test="${p.petBreed == 'Ragdoll'}">selected</c:if>>Ragdoll</option>
<option value="Rhodesian Ridgeback" <c:if test="${p.petBreed == 'Rhodesian Ridgeback'}">selected</c:if>>Rhodesian Ridgeback</option>
<option value="Rottweiler" <c:if test="${p.petBreed == 'Rottweiler'}">selected</c:if>>Rottweiler</option>
<option value="Russian Blue" <c:if test="${p.petBreed == 'Russian Blue'}">selected</c:if>>Russian Blue</option>
<option value="Saint Bernard" <c:if test="${p.petBreed == 'Saint Bernard'}">selected</c:if>>Saint Bernard</option>
<option value="Saluki" <c:if test="${p.petBreed == 'Saluki'}">selected</c:if>>Saluki</option>
<option value="Samoyed" <c:if test="${p.petBreed == 'Samoyed'}">selected</c:if>>Samoyed</option>
<option value="Savannah" <c:if test="${p.petBreed == 'Savannah'}">selected</c:if>>Savannah</option>
<option value="Scottish Fold" <c:if test="${p.petBreed == 'Scottish Fold'}">selected</c:if>>Scottish Fold</option>
<option value="Scottish Terrier" <c:if test="${p.petBreed == 'Scottish Terrier'}">selected</c:if>>Scottish Terrier</option>
<option value="Selkirk Rex" <c:if test="${p.petBreed == 'Selkirk Rex'}">selected</c:if>>Selkirk Rex</option>
<option value="Shetland Sheepdog" <c:if test="${p.petBreed == 'Shetland Sheepdog'}">selected</c:if>>Shetland Sheepdog</option>
<option value="Shiba Inu" <c:if test="${p.petBreed == 'Shiba Inu'}">selected</c:if>>Shiba Inu</option>
<option value="Shih Tzu" <c:if test="${p.petBreed == 'Shih Tzu'}">selected</c:if>>Shih Tzu</option>
<option value="Siamese" <c:if test="${p.petBreed == 'Siamese'}">selected</c:if>>Siamese</option>
<option value="Siberian Husky" <c:if test="${p.petBreed == 'Siberian Husky'}">selected</c:if>>Siberian Husky</option>
<option value="Sphynx" <c:if test="${p.petBreed == 'Sphynx'}">selected</c:if>>Sphynx</option>
<option value="Staffordshire Bull Terrier" <c:if test="${p.petBreed == 'Staffordshire Bull Terrier'}">selected</c:if>>Staffordshire Bull Terrier</option>
<option value="Standard Poodle" <c:if test="${p.petBreed == 'Standard Poodle'}">selected</c:if>>Standard Poodle</option>
<option value="Sussex Spaniel" <c:if test="${p.petBreed == 'Sussex Spaniel'}">selected</c:if>>Sussex Spaniel</option>
<option value="Tibetan Mastiff" <c:if test="${p.petBreed == 'Tibetan Mastiff'}">selected</c:if>>Tibetan Mastiff</option>
<option value="Tonkinese" <c:if test="${p.petBreed == 'Tonkinese'}">selected</c:if>>Tonkinese</option>
<option value="Turkish Angora" <c:if test="${p.petBreed == 'Turkish Angora'}">selected</c:if>>Turkish Angora</option>
<option value="Turkish Van" <c:if test="${p.petBreed == 'Turkish Van'}">selected</c:if>>Turkish Van</option>
<option value="Vizsla" <c:if test="${p.petBreed == 'Vizsla'}">selected</c:if>>Vizsla</option>
<option value="Weimaraner" <c:if test="${p.petBreed == 'Weimaraner'}">selected</c:if>>Weimaraner</option>
<option value="Welsh Corgi" <c:if test="${p.petBreed == 'Welsh Corgi'}">selected</c:if>>Welsh Corgi</option>
<option value="Welsh Terrier" <c:if test="${p.petBreed == 'Welsh Terrier'}">selected</c:if>>Welsh Terrier</option>
<option value="West Highland White Terrier" <c:if test="${p.petBreed == 'West Highland White Terrier'}">selected</c:if>>West Highland White Terrier</option>
<option value="Whippet" <c:if test="${p.petBreed == 'Whippet'}">selected</c:if>>Whippet</option>
<option value="Xoloitzcuintli" <c:if test="${p.petBreed == 'Xoloitzcuintli'}">selected</c:if>>Xoloitzcuintli</option>
<option value="Yorkshire Terrier" <c:if test="${p.petBreed == 'Yorkshire Terrier'}">selected</c:if>>Yorkshire Terrier</option>

        </select>
        <br>

        BEHAVIOR: 
        <input type="text" name="PetBeharvior" value="<c:out value="${p.petBeharvior}"/>"/>
        <br>

        FAVOURITE FOOD: 
        <select name="PetFavFood" class="form-control" required>
            <option value="" disabled selected>Select Pet's Favourite Food</option>
            <option value="Applesauce" <c:if test="${p.petFavFood == 'Applesauce'}">selected</c:if>>Applesauce</option>
            <option value="Beef" <c:if test="${p.petFavFood == 'Beef'}">selected</c:if>>Beef</option>
            <option value="Bell peppers" <c:if test="${p.petFavFood == 'Bell peppers'}">selected</c:if>>Bell peppers</option>
            <option value="Bone Marrow" <c:if test="${p.petFavFood == 'Bone Marrow'}">selected</c:if>>Bone Marrow</option>
            <option value="Brussels sprouts" <c:if test="${p.petFavFood == 'Brussels sprouts'}">selected</c:if>>Brussels sprouts</option>
            <option value="Cantaloupe" <c:if test="${p.petFavFood == 'Cantaloupe'}">selected</c:if>>Cantaloupe</option>
            <option value="Carob Chips" <c:if test="${p.petFavFood == 'Carob Chips'}">selected</c:if>>Carob Chips</option>
            <option value="Cottage cheese" <c:if test="${p.petFavFood == 'Cottage cheese'}">selected</c:if>>Cottage cheese</option>
            <option value="Cooked Chicken Liver" <c:if test="${p.petFavFood == 'Cooked Chicken Liver'}">selected</c:if>>Cooked Chicken Liver</option>
            <option value="Cooked Turkey Liver" <c:if test="${p.petFavFood == 'Cooked Turkey Liver'}">selected</c:if>>Cooked Turkey Liver</option>
            <option value="Carob Chips" <c:if test="${p.petFavFood == 'Chicken'}">selected</c:if>>Chicken</option>
            <option value="Egg Yolks" <c:if test="${p.petFavFood == 'Egg Yolks'}">selected</c:if>>Egg Yolks</option>
            <option value="Eggs" <c:if test="${p.petFavFood == 'Eggs'}">selected</c:if>>Eggs</option>
            <option value="Fish" <c:if test="${p.petFavFood == 'Fish'}">selected</c:if>>Fish</option>
            <option value="Green beans" <c:if test="${p.petFavFood == 'Green beans'}">selected</c:if>>Green beans</option>
            <option value="Green peas" <c:if test="${p.petFavFood == 'Green peas'}">selected</c:if>>Green peas</option>
            <option value="Lamb" <c:if test="${p.petFavFood == 'Lamb'}">selected</c:if>>Lamb</option>
            <option value="Lentils" <c:if test="${p.petFavFood == 'Lentils'}">selected</c:if>>Lentils</option>
            <option value="Liver" <c:if test="${p.petFavFood == 'Liver'}">selected</c:if>>Liver</option>
            <option value="Mackerel" <c:if test="${p.petFavFood == 'Mackerel'}">selected</c:if>>Mackerel</option>
            <option value="Oatmeal" <c:if test="${p.petFavFood == 'Oatmeal'}">selected</c:if>>Oatmeal</option>
            <option value="Pumpkin" <c:if test="${p.petFavFood == 'Pumpkin'}">selected</c:if>>Pumpkin</option>
            <option value="Quinoa" <c:if test="${p.petFavFood == 'Quinoa'}">selected</c:if>>Quinoa</option>
            <option value="Rice" <c:if test="${p.petFavFood == 'Rice'}">selected</c:if>>Rice</option>
            <option value="Rice cakes" <c:if test="${p.petFavFood == 'Rice cakes'}">selected</c:if>>Rice cakes</option>
            <option value="Salmon" <c:if test="${p.petFavFood == 'Salmon'}">selected</c:if>>Salmon</option>
            <option value="Sardines" <c:if test="${p.petFavFood == 'Sardines'}">selected</c:if>>Sardines</option>
            <option value="Shrimp" <c:if test="${p.petFavFood == 'Shrimp'}">selected</c:if>>Shrimp</option>
            <option value="Sweet potatoes" <c:if test="${p.petFavFood == 'Sweet potatoes'}">selected</c:if>>Sweet potatoes</option>
            <option value="Tofu" <c:if test="${p.petFavFood == 'Tofu'}">selected</c:if>>Tofu</option>
            <option value="Turkey" <c:if test="${p.petFavFood == 'Turkey'}">selected</c:if>>Turkey</option>
            <option value="Vegetables" <c:if test="${p.petFavFood == 'Vegetables'}">selected</c:if>>Vegetables</option>
            <option value="Vegetables" <c:if test="${p.petFavFood == 'Wet food'}">selected</c:if>>Wet food</option>
            <option value="Yogurt" <c:if test="${p.petFavFood == 'Yogurt'}">selected</c:if>>Yogurt</option>
        </select>
        <br>

		<div class="form-group">
                <label for="PetImg">Image:</label>
                <input type="file" class="form-control" id="PetImg" name="PetImg">
            </div>
        <input type="hidden" name="PetID" value="<c:out value="${p.petID}"/>"/>
        

        <div class="btn-container">
            <div class="btn-save">
                <input type="submit" value="Submit">
            </div>
            <div class="btn-cancel">
                <input type="reset" value="Reset">
            </div>
        </div>
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

.profile-text h2{
    text-align: center;
    font-size: 30px;
	color: #ad6a6c;
	margin-bottom: 30px; 
	margin-top: 20px; 
	font-weight: bold;
}

form {
            width: 30%;
            margin:0 auto;
            
        }

        label {
            display: block;
            margin-bottom: 10px;

        }
.container-box{
         	width: 100%;
            padding: 30px;
            border-radius: 15px;
            background-color: #f4afab;
            border: 1px solid #f4afab;
			box-shadow: black 0px 1px 12px; 
			margin-top: 30px;
			margin-bottom: 40px;
        }   
        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
			margin-top : 10px;
			margin-bottom: 30px;
        }
        
/* Styles for the buttons container */
.btn-container {
    display: flex; /* Use flexbox */
    margin-top: -5px; /* Adjust as needed */
    gap: 8px;
}

/* Styles for the submit button */
.btn-container .btn-save input[type="submit"] {
    background-color: #28a745 ; /* Green */
    border-color: #28a745;
     padding: 4px 70px; /* Increase padding to make the button larger */
    border-radius: 5px;
    color: white;
    text-align: center; /* Center text horizontally */
    display: flex; /* Enable flexbox */
    align-items: center; /* Center text vertically */
    justify-content: center; /* Center text horizontally */
}

.btn-container .btn-save input[type="submit"]:hover {
    background-color: #45a049; /* Darker green */
	border-color: #45a049;
    color: white; /* Ensure text color stays white */
}

/* Styles for the reset button */
.btn-container .btn-cancel input[type="reset"] {
    padding: 4px 70px; /* Increase padding to make the button larger */
    		background-color: #dc3545; /* Red color for danger */
    		border-color: #dc3545; /* Red color for border */
    		border-radius: 5px;
            color: white;
            text-align: center; /* Center text horizontally */
    		display: flex; /* Enable flexbox */
    		align-items: center; /* Center text vertically */
    		justify-content: center; /* Center text horizontally */
}

.btn-container .btn-cancel input[type="reset"]:hover {
    background-color: #d32f2f; /* Darker red */
    border-color: #d32f2f; /* Darker red color for border on hover */
    		color: white; /* Ensure text color stays white */
}
    </style>
 <script>
 function confirmUpdate() {
     // Display a confirmation message using the built-in confirm dialog
     var confirmation = confirm("Are you sure you want to update the pet details?");
     // If the user confirms, show the success message
     if (confirmation) {
         // Show the success message after a short delay to ensure form submission
         setTimeout(function() {
             alert("Pet details successfully updated");
         }, 100);
     }
     return confirmation; // Return true or false based on user's confirmation
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
</html>