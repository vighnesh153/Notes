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
