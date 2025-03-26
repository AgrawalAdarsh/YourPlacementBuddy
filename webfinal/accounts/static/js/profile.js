document.addEventListener("DOMContentLoaded", function () {
    const profileIcon = document.querySelector(".profile-icon");
    const userDetails = document.getElementById("userDetails");

    // Check login status using the data attribute
    const isLoggedIn = profileIcon.getAttribute("data-logged-in") === "true";

    profileIcon.addEventListener("mouseover", function () {
        userDetails.style.display = "block"; 
    });

    profileIcon.addEventListener("mouseout", function () {
        userDetails.style.display = "none";
    });
});
