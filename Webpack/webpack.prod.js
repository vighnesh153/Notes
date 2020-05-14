const path = require('path');
const common = require('./webpack.common');
const merge = require('webpack-merge');
const CleanWebpackPlugin = require('clean-webpack-plugin');     // clears dist before building
const MiniCssExtractPlugin = require('mini-css-extract-plugin');    // extracts css into files from commonJs
const OptimizeCssAssetsPlugin = require("optimize-css-assets-webpack-plugin");  // minification of css

// Already exists in node modules because webpack needs it
const TerserPlugin = require('terser-webpack-plugin');
// minimization of JS


// used for adding the script tag of main.SOME_HASH.js to the bottom
// of the HTML
const HtmlWebpackPlugin = require('html-webpack-plugin');


module.exports = merge(common, {
    mode: 'production',
    output: {
        filename: "main.[contentHash].js",  // File name with hash, based on content
        path: path.resolve(__dirname, 'dist')
    },
    optimization: {
        minimizer: [
            new OptimizeCssAssetsPlugin(),
            new TerserPlugin(),
            new HtmlWebpackPlugin({
                template: "./src/index.html",
                minify: {
                    removeAttributeQuotes: true,
                    collapseWhitespace: true,
                    removeComments: true
                }
            })
        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: "[name].[contentHash].css"
        }),
        new CleanWebpackPlugin(),
    ],
    module: {
        rules: [
            {
                test: /\.scss$/,
                use: [
                    MiniCssExtractPlugin.loader,   // Extract css to file
                    "css-loader",       // loads css from .css files to commonJS
                    "sass-loader",      // generates .css files from .scss files
                ]
            }
        ]
    }
});
