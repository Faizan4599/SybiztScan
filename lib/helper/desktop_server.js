const net = require('net');
const fs = require('fs');

const server = net.createServer(socket => {
    console.log('Client connected');

    socket.on('data', data => {
        const id = data.toString();
        console.log('Received ID:', id);

        //Write ID to text file
        fs.writeFileSync('note.txt', id);
        console.log('ID Written to file Successfully.');
        socket.end();
    });

    socket.on('end', () => {
        console.log('Client disconnected');
    });

    const PORT = 3000;
    server.listen(PORT, () => {
        console.log(`server listening on port ${PORT}`);

    });
});

