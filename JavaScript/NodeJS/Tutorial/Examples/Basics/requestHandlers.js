const queryString = require('querystring');
const fs = require('fs');
const formidable = require('formidable');

function start(response, request) {
    console.log("Request handler 'start' was called.");

    var body = '<html>'+
                '<head>'+
                '<meta http-equiv="Content-Type" content="text/html; '+
                'charset=UTF-8" />'+
                '</head>'+
                    '<body>'+
                        '<form action="/upload" enctype="multipart/form-data" method="post">'+
                            '<input type="file" name="upload" /><br>' +
                            '<input type="submit" value="Upload" />'+
                        '</form>'+
                    '</body>'+
                '</html>';
    
    response.writeHead(200, { 'Content-Type': 'text/html'});
    response.write(body);
    response.end();
}

function upload(response, request) {
    console.log("Request handler 'upload' was called.");

    // response.write('You have sent: ' + queryString.parse(postData).text);
    // // You have sent: This is a sample test. Signed by RV! 153. Peace!
    // response.write('You have sent (raw): ' + postData);
    // // You have sent (raw): text=This+is+a+sample+test.+Signed+by+RV%21+153.+Peace%21

    const form = new formidable.IncomingForm();

    form.parse(request, (error, fields, files) => {
        console.log('Parsing done.');

        fs.rename(files.upload.path, 'tmp/test.png', error => {
            if (error) {
                fs.unlink('tmp/test.png');
                fs.rename(files.upload.path, "tmp/test.png");
            }
        });
    });

    response.writeHead(200, { 'Content-Type': 'text/html'});
    response.write('Image Received!');
    response.write('<img src=\'/show\' />');
    response.end();
}

function show(response, request) {
    console.log('Request handler \'show\' was called.');
    response.writeHead(200, { 'Content-Type': 'image/png' });
    fs.createReadStream('tmp/test.png').pipe(response);
}

exports.start = start;
exports.upload = upload;
exports.show = show;
