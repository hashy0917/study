module.exports = {
	entry: './src/main.js',
	output: {
		filename: './out/bundle.js'
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude:  /node_modules/,
				use: {
					loader: 'babel-loader',
					options: {
						presets:['es2015', 'react']
					}
				}
			}
		]
	}
};
