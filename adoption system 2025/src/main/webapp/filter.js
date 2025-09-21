 let list = document.getElementById('list');
let filter = document.querySelector('.filter');
let count = document.getElementById('count');

// Assuming you have obtained the list of pets from the server-side using Java
let petsList = [
    {
        id: 1,
        name: 'Name product white-black',
        price: 205600,
        quantity: 0,
        image: 'img1.jpg',
        nature: {
            color: ['white', 'black'],
            size: ['S', 'M', 'L'],
            type: 'T-shirt'
        }
    },
    // Other pet objects...
];

// Function to render a single pet item
function renderPet(pet) {
    let listItem = document.createElement('div');
    listItem.classList.add('pet');

    // Create and set image element
    let img = document.createElement('img');
    img.src = pet.image;
    img.alt = pet.name;
    listItem.appendChild(img);

    // Create and set name element
    let name = document.createElement('p');
    name.textContent = pet.name;
    listItem.appendChild(name);

    // Create and set price element
    let price = document.createElement('p');
    price.textContent = pet.price + '€';
    listItem.appendChild(price);

    // Create and set description element
    let description = document.createElement('p');
    description.textContent = pet.nature.type;
    listItem.appendChild(description);

    // Append the pet item to the list
    list.appendChild(listItem);
}

// Function to render the list of pets
function renderPets(pets) {
    list.innerHTML = ''; // Clear the list first
    pets.forEach(renderPet); // Render each pet
}

// Render the initial list of pets
renderPets(petsList);

let productFilter = listProducts;
    showProduct(productFilter);
    
    filter.addEventListener('submit', function(event){
        event.preventDefault();
        let valueFilter = event.target.elements;
        productFilter = listProducts.filter(item => {
            // check category
            if(valueFilter.category.value != ''){
                if(item.nature.type != valueFilter.category.value){
                    return false;
                }
            }
            // check color
            if(valueFilter.color.value != ''){
                if(!item.nature.color.includes(valueFilter.color.value)){
                    return false;
                }
            }
            // check name
            if(valueFilter.name.value != ''){
                if(!item.name.includes(valueFilter.name.value)){
                    return false;
                }
            }
            // check min price
            if(valueFilter.minPrice.value != ''){
                if(item.price < valueFilter.minPrice.value){
                    return false;
                }
            }
            //  check max price
            if(valueFilter.maxPrice.value != ''){
                if(item.price > valueFilter.maxPrice.value){
                    return false;
                }
            }
    
    
            return true;
        })
        showProduct(productFilter);
    })
    function showProduct(productFilter){
        count.innerText = productFilter.length;
        list.innerHTML = '';
        productFilter.forEach(item => {
            let newItem = document.createElement('div');
            newItem.classList.add('item');
    
            // create image
            let newImage = new Image();
            newImage.src = item.image;
            newItem.appendChild(newImage);
            // create name product
            let newTitle = document.createElement('div');
            newTitle.classList.add('title');
            newTitle.innerText = item.name;
            newItem.appendChild(newTitle);
            // create price
            let newPrice = document.createElement('div');
            newPrice.classList.add('price');
            newPrice.innerText = item.price.toLocaleString() + ' đ';
            newItem.appendChild(newPrice);
    
            list.appendChild(newItem);
        });
    }