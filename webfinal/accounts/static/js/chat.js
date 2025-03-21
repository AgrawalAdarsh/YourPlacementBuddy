document.addEventListener("DOMContentLoaded", function () {
    const messageInput = document.getElementById("chat-message-input");
    const sendButton = document.getElementById("chat-message-send");
    const messagesDiv = document.getElementById("chat-box");
    const chatListDiv = document.getElementById("chat-list"); // Chat rooms list
    const username = document.getElementById("logged-in-user").textContent.trim(); // Get the logged-in user
    const roomNameElement = document.getElementById("room-name");
    const roomName = roomNameElement ? roomNameElement.textContent.trim() : "";
    if (!roomName) {
        console.error("❌ Error: Room name is missing.");
    }
    const createRoomButton = document.getElementById("create-room-btn");
    console.log("✅ Create Room Button:", createRoomButton);

    if (!createRoomButton) {
        console.error("❌ Create Room Button Not Found!");
        return; // Stop script execution if button is missing
    }



    // Function to Fetch Chat Rooms
    function fetchChatRooms() {
        fetch("/get_chat_rooms/")
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP Error ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log("✅ Chat rooms loaded:", data.rooms);

                chatListDiv.innerHTML = ""; //  Clear existing rooms
                data.rooms.forEach(room => {
                    const roomElement = document.createElement("div");
                    roomElement.innerHTML = `<a href="/chat/${room.name}/">${room.name}</a>`;
                    roomElement.classList.add("chat-room-item");
                    roomElement.addEventListener("click", () => switchRoom(room.name));
                    chatListDiv.appendChild(roomElement);
                });
            })
            .catch(error => console.error("❌ Error fetching chat rooms:", error));
    }

    //  Create New Chat Room (AJAX)
    document.getElementById("create-room-btn").addEventListener("click", function () {
        let roomNameInput = document.getElementById("new-room-name").value.trim().toLowerCase();
    
        if (!roomNameInput) {
            alert("❌ Room name cannot be empty!");
            return;
        }
    
        console.log("📡 Sending Create Room Request for:", roomNameInput);
    
        fetch("/create_room/", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRFToken": getCSRFToken()
            },
            body: JSON.stringify({ room_name: roomNameInput })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(`✅ Room '${data.room_name}' created successfully!`);
                fetchChatRooms(); // ✅ Refresh room list
            } else {
                alert(`❌ Error: ${data.error}`);
            }
        })
        .catch(error => console.error("❌ Error creating room:", error));
    });
    

    //  Function to Switch Chat Rooms
    function switchRoom(newRoom) {
        console.log(`Switching to room: ${newRoom}`);
        history.pushState(null, "", `/chat/${newRoom}/`); // Change URL without reload
        document.getElementById("room-name-display").textContent = newRoom;
        fetchMessages(newRoom);
        reloadCSS(); // Ensure CSS is reapplied
    }

    // Function to Fetch Messages
    function fetchMessages() {
        fetch(`/get_messages/${roomName}/`)
            .then(response => response.json())
            .then(data => {
                const existingMessages = new Set();
                messagesDiv.querySelectorAll("p").forEach(msg => {
                    existingMessages.add(msg.innerText);
                });

                data.messages.forEach(msg => {
                    const messageText = `${msg.alias}: ${msg.message}`;
                    if (!existingMessages.has(messageText)) {
                        const newMessage = document.createElement("p");
                        newMessage.innerHTML = `<strong>${msg.alias}</strong>: ${msg.message}`;
                        messagesDiv.appendChild(newMessage);
                        messagesDiv.scrollTop = messagesDiv.scrollHeight; // ✅ Auto-scroll
                    }
                });
            })
            .catch(error => console.error("❌ Error fetching messages:", error));
    }

    //  Function to Send Messages
    function sendMessage() {
        const message = messageInput.value.trim();
        if (message === "") {
            alert("Message cannot be empty!");
            return;
        }

        fetch("/send_message/", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRFToken": getCSRFToken(),
            },
            body: JSON.stringify({
                room_name: roomName,
                message: message,
                alias: username,
            }),
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                fetchMessages(); // ✅ Refresh messages after sending
            } else {
                console.error("Error:", data.error);
            }
        })
        .catch(error => console.error("Error sending message:", error));

        messageInput.value = ""; // ✅ Clear input field
    }

    //  Attach Event Listeners for Sending Messages
    sendButton.addEventListener("click", sendMessage);
    messageInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            sendMessage();
        }
    });

    //  Function to Get CSRF Token from Cookies
    function getCSRFToken() {
        const cookies = document.cookie.split(";").map(cookie => cookie.trim());
        for (let cookie of cookies) {
            if (cookie.startsWith("csrftoken=")) {
                return cookie.split("=")[1];
            }
        }
        return "";
    }

    //  Initial Fetch Calls
    fetchChatRooms();
    reloadCSS();
    fetchMessages();
    setInterval(fetchMessages, 3000);

    function reloadCSS() {
        let cssLink = document.querySelector('link[href*="chat.css"]');
        if (cssLink) {
            let newCssLink = document.createElement("link");
            newCssLink.rel = "stylesheet";
            newCssLink.href = cssLink.href.split("?")[0] + "?t=" + new Date().getTime(); // Cache busting
            cssLink.parentNode.replaceChild(newCssLink, cssLink);
        }
    }
    

});
