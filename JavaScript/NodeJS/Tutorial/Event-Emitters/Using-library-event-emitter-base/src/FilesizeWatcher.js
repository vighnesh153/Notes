"use strict";

const fs = require("fs");
const EventEmitter = require('events').EventEmitter;

class FilesizeWatcher extends EventEmitter {
    constructor(path) {
        const self = this;

        if (/^\//.test(path) === false) {
            process.nextTick(() => {
                self.emit('error', 'Path does not start with a slash.');
            });
            return;
        }

        fs.stat(path, (err, stats) => {
            self.lastFileSize = stats.size;
        });

        this.interval = setInterval(() => {
            fs.stat(path, (err, stats) => {
                if (stats.size > self.lastFileSize) {
                    self.emit('grew', stats.size - self.lastFileSize);
                }
                if (stats.size < self.lastFileSize) {
                    self.emit('shrank', self.lastFileSize - stats.size);
                }
                self.lastFileSize = stats.size;
            })
        }, 1000);
    }

    stop() {
        clearInterval(this.interval);
    }
}

module.exports = FilesizeWatcher;