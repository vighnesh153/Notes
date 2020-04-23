const fs = require('fs');

// writes to file synchronously
fs.writeFileSync('FILE_NAME', 'FILE_CONTENT');


// Asynchronous write to file
fs.writeFile('FILE_NAME', 'FILE_CONTENT', err => {
  if (err) {
    console.log('Error writing to file.');
  } else {
    console.log('Write to file was successful.');
  }
});

// Similarlly, we have the readFile and readFileSync



// Streaming files: in express
const file = fs.createReadStream('path/to/file');
res.setHeader('Content-Type', 'application/pdf');
res.setHeader(
    'Content-Disposition',
    `attachment; filename="${name_of_file}"`
);
// 'attachment' means it will asked to be downloaded
// 'inline', which is default, will be serverd by browser if it can else asked to be downloaded.
