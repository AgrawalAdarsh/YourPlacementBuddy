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
        if (!linkedin.trim()) return true; // LinkedIn is optional
        return /^https?:\/\/(www\.)?linkedin\.com\/in\/[A-Za-z0-9_-]+\/?$/.test(linkedin);
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

        if (id === "linkedin" && value) { // Only validate if LinkedIn field is not empty
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
});
