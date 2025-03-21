function init() {
    const $ = go.GraphObject.make;
    const diagram = $(go.Diagram, "roadmapEditor", {
        "undoManager.isEnabled": true,
        layout: $(go.ForceDirectedLayout),
        allowMove: true,
        allowLink: true,
        allowRelink: true
    });

    diagram.nodeTemplate =
        $(go.Node, "Auto",
            { deletable: true, click: onNodeClick },
            $(go.Shape, "RoundedRectangle", { strokeWidth: 0, fill: "lightblue" },
                new go.Binding("fill", "color")
            ),
            $(go.TextBlock, { margin: 8, editable: true, font: "bold 14px Arial" },
                new go.Binding("text", "key"))
        );

    diagram.linkTemplate =
        $(go.Link,
            { routing: go.Link.Normal, relinkableFrom: true, relinkableTo: true },
            $(go.Shape, { stroke: "white", strokeWidth: 2 }),
            $(go.Shape, { toArrow: "Standard", stroke: "white", fill: "white" })
        );

    const firstNode = { key: "Main Topic", color: "#4caf50", isRoot: true };
    diagram.model = new go.GraphLinksModel([firstNode], []);

    window.selectedNode = firstNode;
    window.diagram = diagram;
    window.nodeToConnect = null;
}

function onNodeClick(e, obj) {
    if (window.nodeToConnect) {
        connectNodes(window.nodeToConnect, obj.part.data);
        window.nodeToConnect = null;
    } else {
        window.selectedNode = obj.part.data;
    }
}

function addNode() {
    if (!window.selectedNode) {
        alert("Please select a node first!");
        return;
    }

    const newNodeKey = "Node " + Math.floor(Math.random() * 1000);
    const newNodeData = { key: newNodeKey, color: "#ff9800" };
    window.diagram.model.addNodeData(newNodeData);
    window.diagram.model.addLinkData({ from: window.selectedNode.key, to: newNodeKey });

    window.selectedNode = newNodeData;
}

function deleteNode() {
    if (!window.selectedNode) {
        alert("Please select a node first!");
        return;
    }

    if (window.selectedNode.isRoot) {
        alert("The root node cannot be deleted!");
        return;
    }

    const nodeKey = window.selectedNode.key;

    const linksToRemove = window.diagram.model.linkDataArray.filter(
        link => link.from === nodeKey || link.to === nodeKey
    );

    linksToRemove.forEach(link => {
        window.diagram.model.removeLinkData(link);
    });

    window.diagram.model.removeNodeData(window.selectedNode);
    window.selectedNode = null;
}

function startConnection() {
    if (!window.selectedNode) {
        alert("Please select a node first!");
        return;
    }
    window.nodeToConnect = window.selectedNode;
    alert("Now click on another node to connect them.");
}

function connectNodes(fromNode, toNode) {
    if (!fromNode || !toNode) {
        alert("Invalid connection attempt!");
        return;
    }
    if (fromNode.key === toNode.key) {
        alert("Cannot connect a node to itself!");
        return;
    }
    if (window.diagram.model.linkDataArray.some(link => link.from === fromNode.key && link.to === toNode.key)) {
        alert("These nodes are already connected!");
        return;
    }

    window.diagram.model.addLinkData({ from: fromNode.key, to: toNode.key });
}

function downloadImage() {
    const imgData = window.diagram.makeImageData({
        scale: 1,
        background: "lightgray",
        allParts: true
    });

    const link = document.createElement("a");
    link.href = imgData;
    link.download = "roadmap.png";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function downloadJSON() {
    const json = window.diagram.model.toJson();
    const blob = new Blob([json], { type: "application/json" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "roadmap.json";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function importRoadmap() {
    document.getElementById("importFile").click();
}

document.getElementById("importFile").addEventListener("change", function (event) {
    const file = event.target.files[0];
    if (!file) return;

    const fileType = file.name.split('.').pop().toLowerCase();

    if (fileType === "png") {
        alert("PNG can only be downloaded, not imported for editing!");
    } else if (fileType === "json") {
        const reader = new FileReader();
        reader.onload = function (e) {
            try {
                const jsonData = JSON.parse(e.target.result);
                window.diagram.model = go.Model.fromJson(jsonData);
            } catch (error) {
                alert("Invalid JSON file!");
            }
        };
        reader.readAsText(file);
    } else {
        alert("Only PNG or JSON files are allowed!");
    }
});

function resetRoadmap() {
    window.diagram.model = new go.GraphLinksModel([{ key: "Main Topic", color: "#4caf50", isRoot: true }], []);
}

window.addEventListener('DOMContentLoaded', init);
