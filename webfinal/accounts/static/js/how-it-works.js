document.addEventListener("DOMContentLoaded", function () {
    // "How It Works" Section Interaction
    function highlightStep(step) {
        step.style.backgroundColor = "#81C784";
        step.style.transform = "scale(1.1)";
    }

    function removeHighlight(step) {
        step.style.backgroundColor = "";
        step.style.transform = "scale(1)";
    }

    // Attach event listeners to steps
    let steps = document.querySelectorAll(".step");
    steps.forEach(step => {
        step.addEventListener("mouseover", function () {
            highlightStep(step);
        });
        step.addEventListener("mouseout", function () {
            removeHighlight(step);
        });
    });
});
