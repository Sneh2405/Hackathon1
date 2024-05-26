// server.js
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Handle root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.post('/generate-resume', (req, res) => {
    const { name, email, skills } = req.body;
    const resume = `
        Name: ${name}\n
        Email: ${email}\n
        Skills:\n${skills.split('\n').map(skill => `- ${skill}`).join('\n')}
    `;
    res.send({ resume });
});

const reminders = [];

app.post('/set-reminder', (req, res) => {
    const { jobTitle, deadline } = req.body;
    reminders.push({ jobTitle, deadline });
    res.send({ message: 'Reminder set successfully', reminders });
});

app.get('/reminders', (req, res) => {
    res.send(reminders);
});

app.get('/networking', (req, res) => {
    res.send({ message: 'Networking opportunities will be available soon!' });
});

app.get('/courses', (req, res) => {
    res.send({ message: 'Courses and preparation tools will be available soon!' });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
