document.addEventListener("DOMContentLoaded", function () {
    const profileIcon = document.querySelector(".profile-icon");
    const userDetails = document.getElementById("userDetails");

    profileIcon.addEventListener("mouseover", function () {
        userDetails.style.display = "block";
    });

    profileIcon.addEventListener("mouseout", function () {
        userDetails.style.display = "none";
    });
});
