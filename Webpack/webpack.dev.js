const path = require('path');
const common = require('./webpack.common');
const merge = require('webpack-merge');

// used for adding the script tag of main.SOME_HASH.js to the bottom
// of the HTML
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = merge(common, {
    mode: 'development',    // default is production
    output: {
        filename: "main.js",
        path: path.resolve(__dirname, 'dist')
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: "./src/index.html"
        })
    ],
    module: {
        rules: [
            {
                test: /\.scss$/,
                use: [
                    "style-loader",     // loads styles from JS to DOM
                    "css-loader",       // loads css from .css files to commonJS
                    "sass-loader",      // generates .css files from .scss files
                ]
            }
        ]
    }
});
