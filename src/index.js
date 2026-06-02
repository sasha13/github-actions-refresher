// Import the express framework
const express = require("express");

// Initialize the express application
const app = express();

// Define the port number for the server
const PORT = 3000;

// Middleware to parse incoming JSON payloads
app.use(express.json());

// Define a basic route for the root URL ('/')
app.get("/", (req, res) => {
  res.send("Welcome to your sample Node.js application!");
});

// Define an API endpoint that returns JSON data
app.get("/api/status", (req, res) => {
  res.json({
    status: "online",
    timestamp: new Date(),
  });
});

// Start the server and listen on the defined port
app.listen(PORT, () => {
  console.log(`Server is successfully running at http://localhost:${PORT}`);
});
