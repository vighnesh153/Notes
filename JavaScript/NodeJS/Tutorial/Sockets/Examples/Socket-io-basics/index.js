const PORT = 8154;

const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

const path = require('path');

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views/index.html'));
});

io.on('connection', socket => {
    console.log('A new websocket connection has been established.');
});

setInterval(() => {
    const stockPrice = Math.floor(Math.random() * 1000);
    io.emit('stock price update', stockPrice);
}, 50);

http.listen(PORT, () => {
    console.log(`Server is listening at port http://localhost:${PORT}`);
});