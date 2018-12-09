module.exports = {
	entry: './index.js',//エントリポイントのjsxファイル
	output: {
		filename: 'bundle.js' //出力するファイル名
	},
	module:{
		rules:[{
			test: /\.js?$/,          //拡張子がjsで
			exclude: /node_modules/, //node_modulesフォルダ配下は除外
			loader: 'babel-loader',  //babel-loaderを使って変換する
			query:{
				plugins:["transform-react-jsx"] //transform-react-jsxプラグインを使用
			}
		}]
	}
}
