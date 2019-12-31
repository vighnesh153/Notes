"use strict";

const fs = require("fs");

class FilesizeWatcher {
    constructor(path) {
        this.callbacks = {};
        const self = this;

        if (/^\//.test(path) === false) {
            // We do this because as the time of initialization of the filesizeWatcher object, the 'error' callback is not 
            // assigned to the 'this.callbacks.error' property. It will be done after the initialization of the filesizeWatcher 
            // object is complete. So, we raise the 'error' event in the next tick so that when the event loop's next interation 
            // is started, the 'this.callbacks.error' property would have been defined in the previous interation/tick. So, we wait 
            // for the next tick/iteration to throw error.
            process.nextTick(() => {
                self.callbacks.error('Path does not start with a slash.');
            });
            return;
        }

        fs.stat(path, (err, stats) => {
            self.lastFileSize = stats.size;
        });

        this.interval = setInterval(() => {
            fs.stat(path, (err, stats) => {
                if (stats.size > self.lastFileSize) {
                    if (self.callbacks.grew)
                        self.callbacks.grew(stats.size - self.lastFileSize);
                }
                if (stats.size < self.lastFileSize) {
                    if (self.callbacks.shrank)
                        self.callbacks.shrank(self.lastFileSize - stats.size);
                }
                self.lastFileSize = stats.size;
            })
        }, 1000);
    }

    on(eventName, callback) {
        this.callbacks[eventName] = callback;
    }

    stop() {
        clearInterval(this.interval);
    }
}

module.exports = FilesizeWatcher;