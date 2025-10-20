// DOM elements
const loadingBar = document.getElementById('loadingBar');
const successMessage = document.getElementById('successMessage');
const body = document.getElementById('main');
const Message = document.getElementById('pressSpacebar');
const wheal = document.getElementById('img4');

// Flags and counters
let canButtonClick = true;
let progress = 1;
let isKeyPressed = true;
let consecutiveSecondsInRange = 0;
let circle = false;

// Event listener for messages
window.addEventListener('message', function(event) {
    let data = event.data;

    // Check for show action
    if (event.data.action == "show") {
        canButtonClick = true;
        progress = 0;
        
        // Display loading bars and messages
        displayLoadingBars();

        // Display main container
        body.style.display = "block";

        // Display additional image
        showAdditionalImage('img3');
    }
});

// Event listener for keydown events (spacebar)
document.addEventListener('keydown', function (event) {
    if (event.code === 'Space') {
        increaseLoadingBar();
    }
});

// Event listener for button click
document.addEventListener('DOMContentLoaded', function () {
    let container = document.getElementById("main");
    let toggleButton = document.getElementById("toggleButton");
    let input = false;

    // Hide success message on load
    successMessage.style.display = 'none';

    toggleButton.addEventListener('click', function () {
        // Check if button click is allowed
        if (canButtonClick) {
            // Toggle main container and related elements
            toggleMainContainer(container, 'img2', input);
        }
    });
});

// Function to increase loading bar progress
function increaseLoadingBar() {
    progress = (progress + Math.floor(Math.random() * 13)) <= 100 ? (progress + Math.floor(Math.random() * 13)) : 100;
    updateLoadingBar();

    // Handle special case when circle is false
    if (circle === false) {
        circle = true;
        animateProgressCircle();
    }
}

// Function to update loading bar visuals
function updateLoadingBar() {
    loadingBar.style.width = progress/2 + '%';
    wheal.style.transform = 'translate(-50%, -50%) rotate(' + progress + 'deg)';
}

// Function to show success message
function showSuccessMessage() {
    canButtonClick = false;
    showAdditionalImage('img2');
    hideElement('img3');
    Message.style.display = 'none';
    successMessage.style.display = 'block';
    loadingBar.style.width = 0;
    hideLoadingBars();

    // Delay before hiding elements and sending post request
    setTimeout(function() {
        hideElement('img2');
        hideElement('main');
        hideElement('successMessage');
        progress = 0;
        $.post("https://d_labs_oil/d-labs:nuiclose", JSON.stringify({ turnOff: true }));
    }, 1500);
}

// Function to display loading bars and messages
function displayLoadingBars() {
    displayElement('loadingBar');
    displayElement('radius');
    displayElement('loadingRange2');
    displayElement('loadingRange');
    displayElement('pressSpacebar');
}

// Function to toggle the main container and related elements
function toggleMainContainer(container, imgId, input) {
    if (container.style.display === "block") {
        container.style.display = "none";
        hideElement(imgId);
        progress = 0;
        $.post("https://d_labs_oil/d-labs:nuiclose", JSON.stringify({ turnOff: input }));
    } else {
        container.style.display = "block";
    }
}

// Function to animate progress circle
function animateProgressCircle() {
    if (progress > 0) {
        const intervalId = setInterval(function () {
            progress = progress - Math.floor(Math.random() * 4);

            if (progress <= 0) {
                progress = 0;
                updateLoadingBar();
                clearInterval(intervalId);
                circle = false; 
                return;
            }

            updateLoadingBar();

            // Handle special case for consecutive seconds in range
            handleConsecutiveSecondsInRange(intervalId);
        }, 100);
    } else {
        circle = false;
    }
}

// Function to handle consecutive seconds in range
function handleConsecutiveSecondsInRange(intervalId) {
    if (progress >= 60 && progress <= 80) {
        loadingBar.style.backgroundColor = 'rgba(219, 52, 52, 0.5)';
        consecutiveSecondsInRange++;

        if (consecutiveSecondsInRange === 20) {
            showSuccessMessage();
            clearInterval(intervalId);
            circle = false;
        }
    } else {
        consecutiveSecondsInRange = 0;
        loadingBar.style.backgroundColor = '';
    }
}

// Utility function to display an element
function displayElement(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'block';
    }
}

// Utility function to hide an element
function hideElement(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'none';
    }
}

// Function to show an additional image
function showAdditionalImage(imgId) {
    const img = document.getElementById(imgId);
    if (img) {
        img.style.display = 'block';
    }
}

// Function to hide loading bars
function hideLoadingBars() {
    hideElement('loadingBar');
    hideElement('radius');
    hideElement('loadingRange2');
    hideElement('loadingRange');
}
