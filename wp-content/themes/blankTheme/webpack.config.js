const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const AssetsPlugin = require('assets-webpack-plugin');

module.exports = function(env) {
    return {
        entry: {
            main: "./src/app.js",
            page: "./src/entries/page.js",
            home: "./src/entries/home.js",
            brands: "./src/entries/brands.js",
            store: "./src/entries/store.js",
            myaccount: "./src/entries/myaccount.js",
            worknos: "./src/entries/worknos.js",
            nosotros: "./src/entries/nosotros.js",
            financiamiento: "./src/entries/financiamiento.js",
            porquenosotros: "./src/entries/porquenosotros.js",
            anuncia: "./src/entries/anuncia.js",
            conviertete: "./src/entries/conviertete.js",
            preguntasfrecuentes: "./src/entries/preguntasfrecuentes.js",
            activacioncuenta: "./src/entries/activacioncuenta.js",
            passwordolvidada: "./src/entries/passwordolvidada.js",
            informacionlegal: "./src/entries/terminosycondiciones.js"
        },
        target: "web",
        mode: env.NODE_ENV,
        output: {
            path: __dirname + "/dist",
            filename: env.NODE_ENV === "production" ? "[name].[hash].js" : "[name].js"
        },
        module: {
            rules: [
                {
                    test: /\.(svg|png|jpg)$/,
                    use: {
                        loader: 'file-loader',
                        options: {
                            outputPath: 'assets',
                            name: '[name].[hash].[ext]',
                            useRelativePath: true
                        }
                    }
                },
                {
                    test: /\.js$/,
                    exclude: /(node_modules|bower_components)/,
                    use: {
                        loader: 'babel-loader',
                        options: {
                            presets: ['@babel/preset-env']
                        }
                    }
                },
                {
                    test: /\.css$/,
                    use: ExtractTextPlugin.extract({
                        fallback: "style-loader",
                        use: "css-loader"
                    })
                },
                {
                    test: /\.scss$/,
                    use: ExtractTextPlugin.extract({
                        fallback: 'style-loader',
                        use: ['css-loader', 'sass-loader']
                    })
                },
                {
                    test: /\.woff($|\?)|\.woff2($|\?)|\.ttf($|\?)|\.eot($|\?)|\.otf($|\?)/,
                    use: {
                        loader: 'url-loader',
                        options: {
                            limit: 40000,
                            name: "./fonts/[name].[ext]",
                        }
                    }
                }
            ]
        },
        plugins: [
            new ExtractTextPlugin({
                filename: env.NODE_ENV === "production" ? '[name].[hash].css' : '[name].css'
            }),
            new webpack.ProvidePlugin({
                $: "jquery",
                jQuery: "jquery",
                "window.jQuery": "jquery'",
                "window.$": "jquery"
            }),
            new AssetsPlugin({
                filename: "assets.json"
            })
        ]
    }
};