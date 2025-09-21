<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Adopt Pets</title>
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
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

<div class="wrapper"> 
    <form action="listAdoptPetsController" method="get"> 
        <div id="search-container"> 
            <input type="search" name="search" id="search-input" placeholder="Search pet breed here.." value="${param.search != null ? param.search : ''}" title="Please enter the correct spelling of the pet's breed" /> 
            <button type="submit" id="search-button"><i class="fas fa-search"></i></button> 
        </div> 
    </form >  
    <form id="filterForm" action="listAdoptPetsController" method="get"> 
        <div id="filter-section"> 
            <div class="filter-item" id="type"> 
                <h3>Type</h3> 
                <input type="checkbox" name="type" value="Cat"> Cat<br> 
                <input type="checkbox" name="type" value="Dog"> Dog<br> 
            </div> 

            <div class="filter-item" id="gender"> 
                <h3>Gender</h3> 
                <input type="checkbox" name="gender" value="Male"> Male<br> 
                <input type="checkbox" name="gender" value="Female"> Female<br> 
            </div> 

            <div class="filter-item" id="breed"> 
                    <h3>Breed</h3> 
                    <div class="dropdown">
                        <div class="dropdown-btn" onclick="toggleDropdown()">Select Breed</div>
                        <div class="dropdown-content" id="breedDropdown">
                            <label><input type="checkbox" name="breed" value="Abyssinian"> Abyssinian</label>
                            <label><input type="checkbox" name="breed" value="Akita"> Akita</label>
                            <label><input type="checkbox" name="breed" value="Alaskan Malamute"> Alaskan Malamute</label>
                            <label><input type="checkbox" name="breed" value="American Bobtail"> American Bobtail</label>
                            <label><input type="checkbox" name="breed" value="American Curl"> American Curl</label>
                            <label><input type="checkbox" name="breed" value="American Eskimo Dog"> American Eskimo Dog</label>
                            <label><input type="checkbox" name="breed" value="American Pit Bull Terrier"> American Pit Bull Terrier</label>
                            <label><input type="checkbox" name="breed" value="American Shorthair"> American Shorthair</label>
                            <label><input type="checkbox" name="breed" value="American Staffordshire Terrier"> American Staffordshire Terrier</label>
                            <label><input type="checkbox" name="breed" value="Australian Shepherd"> Australian Shepherd</label>
                            <label><input type="checkbox" name="breed" value="Australian Terrier"> Australian Terrier</label>
                            <label><input type="checkbox" name="breed" value="Balinese"> Balinese</label>
                            <label><input type="checkbox" name="breed" value="Basenji"> Basenji</label>
                            <label><input type="checkbox" name="breed" value="Basset Hound"> Basset Hound</label>
                            <label><input type="checkbox" name="breed" value="Beagle"> Beagle</label>
                            <label><input type="checkbox" name="breed" value="Belgian Malinois"> Belgian Malinois</label>
                            <label><input type="checkbox" name="breed" value="Belgian Tervuren"> Belgian Tervuren</label>
                            <label><input type="checkbox" name="breed" value="Bengal"> Bengal</label>
                            <label><input type="checkbox" name="breed" value="Bernese Mountain Dog"> Bernese Mountain Dog</label>
                            <label><input type="checkbox" name="breed" value="Bichon Frise"> Bichon Frise</label>
                            <label><input type="checkbox" name="breed" value="Bichon Havanais"> Bichon Havanais</label>
                            <label><input type="checkbox" name="breed" value="Birman"> Birman</label>
                            <label><input type="checkbox" name="breed" value="Blue Heeler"> Blue Heeler</label>
                            <label><input type="checkbox" name="breed" value="Boerboel"> Boerboel</label>
                            <label><input type="checkbox" name="breed" value="Bombay"> Bombay</label>
                            <label><input type="checkbox" name="breed" value="Border Collie"> Border Collie</label>
                            <label><input type="checkbox" name="breed" value="Borzoi"> Borzoi</label>
                            <label><input type="checkbox" name="breed" value="Boston Terrier"> Boston Terrier</label>
                            <label><input type="checkbox" name="breed" value="Bouvier des Flandres"> Bouvier des Flandres</label>
                            <label><input type="checkbox" name="breed" value="Boxer"> Boxer</label>
                            <label><input type="checkbox" name="breed" value="British Longhair"> British Longhair</label>
                            <label><input type="checkbox" name="breed" value="British Shorthair"> British Shorthair</label>
                            <label><input type="checkbox" name="breed" value="Brittany Spaniel"> Brittany Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Bull Terrier"> Bull Terrier</label>
                            <label><input type="checkbox" name="breed" value="Bulldog"> Bulldog</label>
                            <label><input type="checkbox" name="breed" value="Burmese"> Burmese</label>
                            <label><input type="checkbox" name="breed" value="Cane Corso"> Cane Corso</label>
                            <label><input type="checkbox" name="breed" value="Cavalier King Charles Spaniel"> Cavalier King Charles Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Chartreux"> Chartreux</label>
                            <label><input type="checkbox" name="breed" value="Chihuahua"> Chihuahua</label>
                            <label><input type="checkbox" name="breed" value="Chinese Crested"> Chinese Crested</label>
                            <label><input type="checkbox" name="breed" value="Chow Chow"> Chow Chow</label>
                            <label><input type="checkbox" name="breed" value="Cocker Spaniel"> Cocker Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Cornish Rex"> Cornish Rex</label>
                            <label><input type="checkbox" name="breed" value="Curly-Coated Retriever"> Curly-Coated Retriever</label>
                            <label><input type="checkbox" name="breed" value="Dachshund"> Dachshund</label>
                            <label><input type="checkbox" name="breed" value="Dalmatian"> Dalmatian</label>
                            <label><input type="checkbox" name="breed" value="Devon Rex"> Devon Rex</label>
                            <label><input type="checkbox" name="breed" value="Doberman Pinscher"> Doberman Pinscher</label>
                            <label><input type="checkbox" name="breed" value="Dogo Argentino"> Dogo Argentino</label>
                            <label><input type="checkbox" name="breed" value="Domestic Longhair"> Domestic Longhair</label>
                            <label><input type="checkbox" name="breed" value="Domestic Shorthair"> Domestic Shorthair</label>
                            <label><input type="checkbox" name="breed" value="Egyptian Mau"> Egyptian Mau</label>
                            <label><input type="checkbox" name="breed" value="English Cocker Spaniel"> English Cocker Spaniel</label>
                            <label><input type="checkbox" name="breed" value="English Setter"> English Setter</label>
                            <label><input type="checkbox" name="breed" value="English Springer Spaniel"> English Springer Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Eurasier"> Eurasier</label>
                            <label><input type="checkbox" name="breed" value="Exotic Shorthair"> Exotic Shorthair</label>
                            <label><input type="checkbox" name="breed" value="Field Spaniel"> Field Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Finnish Lapphund"> Finnish Lapphund</label>
                            <label><input type="checkbox" name="breed" value="Finnish Spitz"> Finnish Spitz</label>
                            <label><input type="checkbox" name="breed" value="French Bulldog"> French Bulldog</label>
                            <label><input type="checkbox" name="breed" value="German Pinscher"> German Pinscher</label>
                            <label><input type="checkbox" name="breed" value="German Shepherd"> German Shepherd</label>
                            <label><input type="checkbox" name="breed" value="Golden Retriever"> Golden Retriever</label>
                            <label><input type="checkbox" name="breed" value="Gordon Setter"> Gordon Setter</label>
                            <label><input type="checkbox" name="breed" value="Great Dane"> Great Dane</label>
                            <label><input type="checkbox" name="breed" value="Himalayan"> Himalayan</label>
                            <label><input type="checkbox" name="breed" value="Hovawart"> Hovawart</label>
                            <label><input type="checkbox" name="breed" value="Irish Setter"> Irish Setter</label>
                            <label><input type="checkbox" name="breed" value="Irish Terrier"> Irish Terrier</label>
                            <label><input type="checkbox" name="breed" value="Irish Wolfhound"> Irish Wolfhound</label>
                            <label><input type="checkbox" name="breed" value="Italian Greyhound"> Italian Greyhound</label>
                            <label><input type="checkbox" name="breed" value="Jack Russell Terrier"> Jack Russell Terrier</label>
                            <label><input type="checkbox" name="breed" value="Japanese Bobtail"> Japanese Bobtail</label>
                            <label><input type="checkbox" name="breed" value="Japanese Spitz"> Japanese Spitz</label>
                            <label><input type="checkbox" name="breed" value="Keeshond"> Keeshond</label>
                            <label><input type="checkbox" name="breed" value="Korat"> Korat</label>
                            <label><input type="checkbox" name="breed" value="Kuvasz"> Kuvasz</label>
                            <label><input type="checkbox" name="breed" value="LaPerm"> LaPerm</label>
                            <label><input type="checkbox" name="breed" value="Labrador Retriever"> Labrador Retriever</label>
                            <label><input type="checkbox" name="breed" value="Leonberger"> Leonberger</label>
                            <label><input type="checkbox" name="breed" value="Lhasa Apso"> Lhasa Apso</label>
                            <label><input type="checkbox" name="breed" value="Maine Coon"> Maine Coon</label>
                            <label><input type="checkbox" name="breed" value="Maltese"> Maltese</label>
                            <label><input type="checkbox" name="breed" value="Maltese Shih Tzu"> Maltese Shih Tzu</label>
                            <label><input type="checkbox" name="breed" value="Manx"> Manx</label>
                            <label><input type="checkbox" name="breed" value="Munchkin"> Munchkin</label>
                            <label><input type="checkbox" name="breed" value="Neapolitan Mastiff"> Neapolitan Mastiff</label>
                            <label><input type="checkbox" name="breed" value="Newfoundland"> Newfoundland</label>
                            <label><input type="checkbox" name="breed" value="Norwegian Forest Cat"> Norwegian Forest Cat</label>
                            <label><input type="checkbox" name="breed" value="Ocicat"> Ocicat</label>
                            <label><input type="checkbox" name="breed" value="Old English Sheepdog"> Old English Sheepdog</label>
                            <label><input type="checkbox" name="breed" value="Oriental Shorthair"> Oriental Shorthair</label>
                            <label><input type="checkbox" name="breed" value="Papillon"> Papillon</label>
                            <label><input type="checkbox" name="breed" value="Pekingese"> Pekingese</label>
                            <label><input type="checkbox" name="breed" value="Persian"> Persian</label>
                            <label><input type="checkbox" name="breed" value="Pharaoh Hound"> Pharaoh Hound</label>
                            <label><input type="checkbox" name="breed" value="Plott Hound"> Plott Hound</label>
                            <label><input type="checkbox" name="breed" value="Polish Lowland Sheepdog"> Polish Lowland Sheepdog</label>
                            <label><input type="checkbox" name="breed" value="Pomeranian"> Pomeranian</label>
                            <label><input type="checkbox" name="breed" value="Presa Canario"> Presa Canario</label>
                            <label><input type="checkbox" name="breed" value="Pug"> Pug</label>
                            <label><input type="checkbox" name="breed" value="Pyrenean Shepherd"> Pyrenean Shepherd</label>
                            <label><input type="checkbox" name="breed" value="Ragdoll"> Ragdoll</label>
                            <label><input type="checkbox" name="breed" value="Rhodesian Ridgeback"> Rhodesian Ridgeback</label>
                            <label><input type="checkbox" name="breed" value="Rottweiler"> Rottweiler</label>
                            <label><input type="checkbox" name="breed" value="Russian Blue"> Russian Blue</label>
                            <label><input type="checkbox" name="breed" value="Saint Bernard"> Saint Bernard</label>
                            <label><input type="checkbox" name="breed" value="Saluki"> Saluki</label>
                            <label><input type="checkbox" name="breed" value="Samoyed"> Samoyed</label>
                            <label><input type="checkbox" name="breed" value="Savannah"> Savannah</label>
                            <label><input type="checkbox" name="breed" value="Scottish Fold"> Scottish Fold</label>
                            <label><input type="checkbox" name="breed" value="Scottish Terrier"> Scottish Terrier</label>
                            <label><input type="checkbox" name="breed" value="Selkirk Rex"> Selkirk Rex</label>
                            <label><input type="checkbox" name="breed" value="Shetland Sheepdog"> Shetland Sheepdog</label>
                            <label><input type="checkbox" name="breed" value="Shiba Inu"> Shiba Inu</label>
                            <label><input type="checkbox" name="breed" value="Shih Tzu"> Shih Tzu</label>
                            <label><input type="checkbox" name="breed" value="Siamese"> Siamese</label>
                            <label><input type="checkbox" name="breed" value="Siberian Husky"> Siberian Husky</label>
                            <label><input type="checkbox" name="breed" value="Sphynx"> Sphynx</label>
                            <label><input type="checkbox" name="breed" value="Staffordshire Bull Terrier"> Staffordshire Bull Terrier</label>
                            <label><input type="checkbox" name="breed" value="Standard Poodle"> Standard Poodle</label>
                            <label><input type="checkbox" name="breed" value="Sussex Spaniel"> Sussex Spaniel</label>
                            <label><input type="checkbox" name="breed" value="Tibetan Mastiff"> Tibetan Mastiff</label>
                            <label><input type="checkbox" name="breed" value="Tonkinese"> Tonkinese</label>
                            <label><input type="checkbox" name="breed" value="Turkish Angora"> Turkish Angora</label>
                            <label><input type="checkbox" name="breed" value="Turkish Van"> Turkish Van</label>
                            <label><input type="checkbox" name="breed" value="Vizsla"> Vizsla</label>
                            <label><input type="checkbox" name="breed" value="Weimaraner"> Weimaraner</label>
                            <label><input type="checkbox" name="breed" value="Welsh Corgi"> Welsh Corgi</label>
                            <label><input type="checkbox" name="breed" value="Welsh Terrier"> Welsh Terrier</label>
                            <label><input type="checkbox" name="breed" value="West Highland White Terrier"> West Highland White Terrier</label>
                            <label><input type="checkbox" name="breed" value="Whippet"> Whippet</label>
                            <label><input type="checkbox" name="breed" value="Xoloitzcuintli"> Xoloitzcuintli</label>
                            <label><input type="checkbox" name="breed" value="Yorkshire Terrier"> Yorkshire Terrier</label>
                        </div>
                    </div>
                </div>
                <div id="filter-button-container">
            <button type="submit" id="filter-button">Filter</button> 
        </div>
            </div>
            </form>
        </div>

<div id="products"> 
    <c:forEach items="${pets}" var="p"> 
        <div class="pets-box"> 
            <div class="pets-info"> 
                <div class="details"> 
                    <input type="hidden" class="form-control" id="pet" name="PetID" value="<c:out value="${p.petID}"/>"> 
                    <img class="card-img-top" src="data:image/jpg;base64,${p.petImgBase64}" alt="Pet Image" style="object-fit: cover; width: 200px; height: 200px;"><br> 
                    <label for="name">Pets ID : <c:out value="${p.petID}"/></label><br> 
                    <label for="name">Type: <c:out value="${p.petType}"/></label><br> 
                    <label for="name">Name: <c:out value="${p.petName}"/></label><br> 
                    <label for="phone">Age :  <c:out value="${p.petAge}"/></label><br> 
                    <label for="email">Gender : <c:out value="${p.petGender}"/></label><br> 
                    <label for="password">Breed : <c:out value="${p.petBreed}"/></label><br> 
                    <label for="name">Behavior: <c:out value="${p.petBeharvior}"/></label><br> 
                    <label for="name">Favorite Food : <c:out value="${p.petFavFood}"/></label><br> 
                </div> 
                <button class="button-container" onclick="adoptPetsController('<c:out value="${p.petID}"/>')">Adopt</button> 
            </div> 
        </div> 
    </c:forEach> 
</div>

<script>
function redirectToController(type) {
    window.location.href = 'listAdoptPetsController?type=' + type;
}

function redirectToController(type) {
    var form = document.getElementById('searchForm');
    var searchInput = document.getElementById('search-input');
    
    if (type === 'all') {
        form.setAttribute('action', 'listAdoptPetsController');
        searchInput.value = '';
        document.querySelectorAll('#filterForm input[type=checkbox]').forEach(checkbox => checkbox.checked = false);
        document.querySelector('#filterForm select').selectedIndex = -1;
    } else {
        form.setAttribute('action', 'listAdoptPetsController?type=' + type);
    }

    form.submit();
}
</script>


<script src="filter.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
$(document).ready(function () {
    $('#example').DataTable();
});
</script>
    </body>
    <style>
/* General styles */
body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background-image: url('img/bgg.jpg');
    background-size: cover;
    background-attachment: fixed;
    color: #333;
}

.wrapper {
    max-width: 900px;
    margin: 30px auto;
    margin-bottom: 20px;
    padding: 20px;
    background: #FFF0F3;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
}

#search-container {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

#search-input {
    flex: 1;
    padding: 5px;
    border: 2px solid #ccc;
    border-radius: 8px;
    font-size: 18px;
}

#search-input:hover::before {
    content: attr(title);
    position: absolute;
    top: -30px;
    left: 0;
    background: #000;
    color: #fff;
    padding: 5px;
    border-radius: 5px;
    font-size: 12px;
    white-space: nowrap;
    z-index: 1;
    opacity: 0.8;
    transition: opacity 0s;
}

#search-button {
    padding: 12px 25px;
    border: none;
    background-color: #0080fe;
   border-color: #0080fe;
    color: white;
    font-size: 18px;
    border-radius: 8px;
    margin-left: 10px;
    cursor: pointer;

}

#search-button:hover {
    background-color: #0071e2;
    border-color: #0071e2;
}

#buttons {
    text-align: center;
    margin-bottom: 20px;
}

.button-value {
    padding: 12px 25px;
    border: none;
    background-color: #f0ad4e;
    color: white;
    font-size: 18px;
    border-radius: 8px;
    margin: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.button-value:hover {
    background-color: #ec971f;
}

#filterForm {
    background-color: #e6a19f;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

#filter-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 100%;
}

#filter-section h3 {
    margin-top: 0;
    color: #fff;
}

.filter-item {
    flex: 1 1 30%;
    margin-bottom: 20px;
}

.filter-item:last-child {
    margin-right: 0;
    align-self: flex-end;
}

#filter-button-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin-top: 20px;
}

#filter-button {
    width: 100%;
    padding: 10px;
    border: none;
    background-color: #0080fe;
    border-color: #0080fe;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

#filter-button:hover {
    background-color: #0071e2;
    border-color: #0071e2;
}

select {
    width: 100%;
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 8px;
    font-size: 16px;
    background-color: #fff;
}

        .dropdown {
            position: relative;
            width: 100%;
        }
        .dropdown-btn {
            width: 100%;
            padding: 10px;
            cursor: pointer;
            border: 1px solid #ccc;
            background-color: #fff;
            text-align: left;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            width: 100%;
            max-height: 200px;
            overflow-y: auto;
            z-index: 1;
        }
        .dropdown-content label {
            display: block;
            padding: 10px;
            cursor: pointer;
        }
        .dropdown-content label:hover {
            background-color: #f1f1f1;
        }
        .dropdown.show .dropdown-content {
            display: block;
        }

input[type="checkbox"] {
    margin-right: 10px;
}

/* Responsive design */
@media (max-width: 768px) {
    .filter-item {
        flex: 1 1 100%;
        margin-bottom: 20px;
    }

    .filter-item:last-child {
        margin-bottom: 0;
    }

    #filterForm {
        flex-direction: column;
    }

    #search-container {
        flex-direction: column;
    }

    #search-button {
        margin-top: 10px;
    }

    #buttons {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .button-value {
        flex: 1 1 30%;
        margin: 5px;
    }
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
/* Dropdown button */
.dropbtn {
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
.dropbtn:hover {
    background-color:  var(--bg-color);
    color: white;
}

/* Dropdown container */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown content */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
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

/* Dropdown button */
.dropbtn2 {
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
.dropbtn2:hover {
    background-color:  var(--bg-color);
    color: white;
}

/* Dropdown container */
.dropdown2 {
    position: relative;
    display: inline-block;
}

/* Dropdown content */
.dropdown-content2 {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
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
    background-color: #ddd;
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
            color:#f7ede2;
        }

        .button-container {
            width: 100%;
            padding: 4px;
            background-color: #0080fe;
            border-color: #0080fe;
            border-radius: 5px;
            color: white;
             text-align: center;
        }

        .button-container:hover{
            background-color: #0071e2;
            border-color: #0071e2;
            }
            
.containers{
    background-color: #E9E0F7;
    width: 1000px;
    max-width:  100%;
    margin: 50px auto 0;
    border-radius: 10px;
}
.filter{
    padding: 20px;
    display: grid;
    grid-template-columns: 32.666% 32.666% 32.666%;
    column-gap: 1%;
    row-gap: 10px;
}
.filter .item{
    background-color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
}
.filter .item select,
.filter .item input,
.filter .item button{
    width: 100%;
    padding: 5px;
    border: none;
    background-color: transparent;
    border-left: 1px solid #ddd;
    outline: none;
}
.filter .item label{
    display: block;
    width: 40%;
    padding: 0 10px;
}
.filter .item.submit button{
    background-color: #AA82ED;
    color: #fff;
}
.countResults{
    font-size: xx-large;
    text-align: center;
    padding: 20px;
}
#list{
    padding: 20px;
    display: grid;
    column-gap: 1%;
    grid-template-columns: 32.66% 32.66% 32.66%;
    row-gap: 10px;
}
#list .item img{
    width: 90%;
    height:300px;
    object-fit: cover;
    margin: 20px 0;
    border-radius: 10px;
}
#list .item{
    background-color: #fff5;
    text-align: center;
    border-radius: 10px;
}
#list .item .title{
    font-weight: bold;
}
#list .item .price{
    color: #F5B976;
    letter-spacing: 1px;
    padding: 20px;
}
    </style>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    
    function adoptPetsController(petID) {
        // Construct the URL
        var url = 'adoptPetsController?PetID=' + petID;
        
        // Redirect to the URL
        window.location.href = url;
    }
    
    </script>
    </html>