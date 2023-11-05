// Import required modules
const express = require('express');
const app = express();

// Define a route that logs the current time
app.get('', (req, res) => {
  const currentTime = new Date().toLocaleTimeString();
  console.log(`Current time: ${currentTime}`);
  res.send(`Logged time: ${currentTime}`);
});

// Start the Express server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
