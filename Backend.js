const express = require('express');
const app = express();
const port = 3000;

// Dummy bus data (replace with actual data retrieval logic)
const availableBuses = [
  { id: 1, route: 'Route A', availableSeats: 20 },
  { id: 2, route: 'Route B', availableSeats: 15 },
  // Add more bus data as needed
];

// Route to handle bus search request
app.get('/searchBuses', (req, res) => {
  const { source, destination } = req.query;

  // Dummy logic to filter buses based on source and destination
  const filteredBuses = availableBuses.filter(bus => (
    bus.route.includes(source) && bus.route.includes(destination)
  ));

  res.json(filteredBuses);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
