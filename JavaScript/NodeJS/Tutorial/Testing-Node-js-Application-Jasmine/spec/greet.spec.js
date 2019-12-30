"use strict";

const greet = require('../src/greet');

describe('greet', () => {

    it('should greet the given name', () => {
        expect(greet('Vighnesh')).toBe('Hello Vighnesh!');
    });

    it('should greet no-one special if no name is given', () => {
        expect(greet()).toBe('Hello world!');
    });

});