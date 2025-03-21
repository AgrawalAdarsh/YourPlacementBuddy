document.addEventListener("DOMContentLoaded", function () {
    const cards = document.querySelectorAll(".roadmap-card");

    cards.forEach((card) => {
        card.addEventListener("mouseenter", () => {
            card.style.backgroundColor = getRandomColor();
        });

        card.addEventListener("mouseleave", () => {
            card.style.backgroundColor = "#ecf0f1";
        });
    });

    function getRandomColor() {
        const colors = ["#ff6b6b", "#1abc9c", "#3498db", "#f39c12", "#9b59b6"];
        return colors[Math.floor(Math.random() * colors.length)];
    }
});
