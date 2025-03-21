document.addEventListener("DOMContentLoaded", function () {
    function validateEmail(email) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailPattern.test(email) &&
            email.indexOf('@') > 0 &&
            email.indexOf('.') > 1 &&
            email.indexOf('@') === email.lastIndexOf('@');
    }

    function validatePassword(password) {
        return password.length >= 8 &&
            /[A-Z]/.test(password) &&
            /[0-9]/.test(password) &&
            /[@$!%*?&]/.test(password);
    }

    function validateGitHub(github) {
        return /^https?:\/\/(www\.)?github\.com\/[A-Za-z0-9_-]+\/?$/.test(github);
    }

    function validateLinkedIn(linkedin) {
        return !linkedin.trim() || /^https?:\/\/(www\.)?linkedin\.com\/in\/[A-Za-z0-9_-]+\/?$/.test(linkedin);
    }

    function showTooltip(input, message) {
        let tooltip = input.parentNode.querySelector(".tooltip");
        if (!tooltip) {
            tooltip = document.createElement("div");
            tooltip.classList.add("tooltip");
            input.parentNode.appendChild(tooltip);
        }
        tooltip.textContent = message;
        tooltip.classList.add("visible");
        input.classList.add("input-error");
    }

    function hideTooltip(input) {
        let tooltip = input.parentNode.querySelector(".tooltip");
        if (tooltip) {
            tooltip.classList.remove("visible");
        }
        input.classList.remove("input-error");
    }

    function validateField(input) {
        let value = input.value.trim();
        let id = input.id;
    
        if (!value) {
            if (id === "linkedin") {
                hideTooltip(input); 
                return true;
            }
            showTooltip(input, "This field cannot be empty.");
            return false;
        } else {
            hideTooltip(input);
        }
    
        if (id === "email" || id === "login_email") {
            if (!validateEmail(value)) {
                showTooltip(input, "Invalid email format! Must have @ and . symbols, and no spaces.");
                return false;
            }
        }
    
        if (id === "password" || id === "login_password") {
            if (!validatePassword(value)) {
                showTooltip(input, "Password must be 8+ characters, 1 uppercase, 1 number, and 1 special character.");
                return false;
            }
        }
    
        if (id === "confirm_password") {
            let password = document.getElementById("password").value;
            if (value !== password) {
                showTooltip(input, "Passwords do not match.");
                return false;
            }
        }
    
        if (id === "github") {
            if (!validateGitHub(value)) {
                showTooltip(input, "Invalid GitHub URL! Must be a valid profile link.");
                return false;
            }
        }
    
        if (id === "linkedin") { 
            if (!validateLinkedIn(value)) {
                showTooltip(input, "Invalid LinkedIn URL! Must be a valid profile link.");
                return false;
            }
        }
    
        return true;
    }     

    document.querySelectorAll("input").forEach(input => {
        input.addEventListener("blur", function () {
            validateField(input);
        });
    });

    document.getElementById("signupForm")?.addEventListener("submit", function (e) {
        let isValid = true;
        document.querySelectorAll("#signupForm input").forEach(input => {
            if (!validateField(input)) {
                isValid = false;
            }
        });
        if (!isValid) {
            e.preventDefault();
        } else {
            alert("Signup successful! Redirecting to login page...");
        }
    });

    document.getElementById("loginForm")?.addEventListener("submit", function (e) {
        let isValid = true;
        document.querySelectorAll("#loginForm input").forEach(input => {
            if (!validateField(input)) {
                isValid = false;
            }
        });
        if (!isValid) {
            e.preventDefault();
        } else {
            alert("Login successful! Redirecting...");
        }
    });
    // Google Sign-In Initialization
window.onload = function () {
    google.accounts.id.initialize({
        client_id: "488299215874-dnt5s2ipu7gi0vv9t8i8m780gjfc4kvs.apps.googleusercontent.com", // Replace with your Google Client ID
        callback: handleCredentialResponse
    });

    // Render the Google Sign-In button
    google.accounts.id.renderButton(
        document.getElementById("google-signin-button"), 
        { theme: "outline", size: "large" }
    );
};

// Handle Google Login Response
function handleCredentialResponse(response) {
    const googleIdToken = response.credential;

    // Send token to backend for authentication
    fetch("/auth/google/callback/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ token: googleIdToken }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = "/";  // Redirect to homepage
        } else {
            alert("Google login failed.");
        }
    })
    .catch(error => console.error("Google login error:", error));
}

});
