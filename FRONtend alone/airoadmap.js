function generateRoadmap() {
    let userInput = document.getElementById("userPrompt").value;
    let outputDiv = document.getElementById("roadmap-output");

    if (userInput.trim() === "") {
        outputDiv.innerHTML = "<p>Please enter a valid field of interest.</p>";
        return;
    }

    outputDiv.innerHTML = `<p>Generating roadmap for: <strong>${userInput}</strong>...</p>`;
    
    // Placeholder for AI roadmap (Replace this with API calls later)
    setTimeout(() => {
        outputDiv.innerHTML += "<ul><li>Step 1: Learn the Basics</li><li>Step 2: Work on Projects</li><li>Step 3: Apply for Jobs</li></ul>";
    }, 1000);
}
