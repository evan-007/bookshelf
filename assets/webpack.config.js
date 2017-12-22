const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: [__dirname + "/js/app.js", __dirname + "/css/app.css"],
  output: {
    path: __dirname + "/../priv/static/",
    filename: "js/app.js"
  },
  resolve: {
    modules: [ "node_modules", __dirname + "/web/static/js"  ]
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            "presets": [
              ['@babel/preset-env', {
                "shippedProposals": true
              }],
              ["@babel/preset-react"]
            ]
          }
        }
      },
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: ExtractTextPlugin.extract({ fallback: "style-loader", use: "css-loader" })
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin("css/app.css"),
  ]
};
