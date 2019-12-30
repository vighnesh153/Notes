// Handling multipart requests
    // Multipart requests are used for large data transfer like files, music, large text, etc. If we send 
    // te large data in just one single request, it will be a blocking operation.
    // To make the whole process non-blocking, Node.js serves our code the POST data in small chunks,
    // callbacks that are called upon certain events. These events are 'data' (a new chunk of POST data
    // arrives) and 'end' (all chunks have been received).
    // server = http.createServer((request, response) => {
    //     let postData = "";
    //     const pathname = url.parse(request.url).pathname;
        
    //     console.log("Request for " + pathname + " received.");
        
    //     request.setEncoding("utf8");
        
    //     request.addListener("data", (postDataChunk) => {
    //         postData += postDataChunk;
    //     });

    //     request.addListener("end", () => {
    //         route(handle, pathname, response, postData);
    //     });
    // });


const http = require('http');
const url = require('url');

const PORT = 15315;
let server;

const start = (route, handle) => {
    server = http.createServer((request, response) => {
        const pathname = url.parse(request.url).pathname;
        console.log("Request for " + pathname + " received.");
        
        route(handle, pathname, response, request);
    });

    server.on('error', (e) => {
        console.log(e);
    });

    server.listen(PORT, () => {
        console.log(`Server listening on port: ${PORT}`);
    });
};

exports.start = start;
