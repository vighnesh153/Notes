const route = (handle, pathName, response, request) => {
    console.log(`Request received for path: ${pathName}`);

    if (typeof handle[pathName] === 'function') {
        handle[pathName](response, request);
    } else {
        console.log('No request handler found for path: ' + pathName);
        response.writeHead(404, { 'Content-Type': 'text/plain'});
        response.write('404 Not Found');
        response.end();
    }
};

exports.route = route;
