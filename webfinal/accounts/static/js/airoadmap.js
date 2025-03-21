function generateRoadmap() {
    const userInput = document.getElementById("user-input").value.trim();
    const roadmapOutput = document.getElementById("roadmap-output");
    const loading = document.getElementById("loading");

    if (!userInput) {
        alert("Please enter a career goal.");
        return;
    }

    loading.classList.remove("hidden");
    roadmapOutput.classList.add("hidden");
    roadmapOutput.innerHTML = ""; 

    fetch("/generate_ai_roadmap/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": getCookie("csrftoken")  
        },
        body: JSON.stringify({ career_goal: userInput })
    })
    .then(response => response.json())
    .then(data => {
        loading.classList.add("hidden");
        roadmapOutput.classList.remove("hidden");

        if (data.error) {
            roadmapOutput.innerHTML = `<p class="error">${escapeHTML(data.error)}</p>`;
        } else {
            roadmapOutput.innerHTML = `
                <h2>Your AI-Generated Roadmap</h2>
                <div class="roadmap-content">${data.roadmap}</div>
            `;
        }
    })
    .catch(error => {
        console.error("Error:", error);
        loading.classList.add("hidden");
        roadmapOutput.innerHTML = `<p class="error">Something went wrong. Please try again.</p>`;
    });
}

function downloadRoadmapAsPDF() {
    const roadmapElement = document.getElementById("roadmap-output");

    if (!roadmapElement.innerHTML.includes("<h2>Your AI-Generated Roadmap</h2>")) {
        alert("No roadmap available to download.");
        return;
    }

    // Ask user for filename
    const filename = prompt("Enter filename for the PDF:", "AI_Roadmap");
    if (!filename) {
        alert("Download cancelled.");
        return;
    }

    const { jsPDF } = window.jspdf;
    const doc = new jsPDF({
        orientation: "p",
        unit: "mm",
        format: "a4"
    });

    doc.setFont("helvetica", "normal");
    doc.setFontSize(12);

    const marginLeft = 10;
    const marginRight = 10;
    const maxWidth = 190; // Max width for A4
    const lineHeight = 7; // Line height for text

    // Convert HTML to plain text while preserving formatting
    let roadmapText = roadmapElement.innerHTML
        .replace(/<br>/g, "\n")
        .replace(/<strong>(.*?)<\/strong>/g, "**$1**")
        .replace(/<\/?[^>]+(>|$)/g, ""); // Remove all other HTML tags

    const lines = doc.splitTextToSize(roadmapText, maxWidth);
    let cursorY = 20;

    // Title
    doc.setFontSize(16);
    doc.text("AI-Generated Roadmap", marginLeft, cursorY);
    cursorY += 10;
    doc.setFontSize(12);

    // Loop through content and add it to pages properly
    for (let i = 0; i < lines.length; i++) {
        if (cursorY + lineHeight > 280) {
            doc.addPage();
            cursorY = 20; // Reset cursor for new page
        }
        doc.text(lines[i], marginLeft, cursorY);
        cursorY += lineHeight;
    }

    // Page numbering
    const totalPages = doc.internal.getNumberOfPages();
    for (let i = 1; i <= totalPages; i++) {
        doc.setPage(i);
        doc.setFontSize(10);
        doc.text(`Page ${i} of ${totalPages}`, 180, 290);
    }

    doc.save(`${filename}.pdf`);
}

// Function to get CSRF token
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.startsWith(name + '=')) {
                cookieValue = decodeURIComponent(cookie.split('=')[1]);
                break;
            }
        }
    }
    return cookieValue;
}

// Escape HTML to prevent XSS
function escapeHTML(str) {
    return str.replace(/</g, "&lt;").replace(/>/g, "&gt;");
}
