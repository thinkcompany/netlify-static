const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, 'dist')));

app.get('/', (req,res) => {
    res.sendFile(path.join(__dirname + '/src/index.html'));
});

app.listen(PORT, () => {
    console.log(`Server running at: http://localhost:${PORT}/`);
});
