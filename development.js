import path from 'path'

const src  = path.resolve(__dirname, 'src')
const dist = path.resolve(__dirname, 'dist')

export default {
  mode: 'development',
  entry: src + '/main.js',

  output: {
    path: dist,
    filename: 'bundle.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
        {
            test: /\.css/,
            exclude: /node_modules/,
            loader: 'css-loader'
        }
    ]
  },

  resolve: {
    extensions: ['.js', '.jsx']
  },

  plugins: []
}
