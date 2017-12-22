module.exports = {
  entry: __dirname + "/js/app.js",
  output: {
    path: __dirname + "/../priv/static/js",
    filename: "app.js"
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
      }
    ]

  }
};
