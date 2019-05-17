// httpモジュールを読み込む
const http = require(`http`)

// webサーバーを実行する
// サーバーを生成
const srv = http.createServer(handler)
srv.listen(80)

// サーバーにアクセスが有った時の処理
function handler(req, res){
	console.log("url:", req.url)
	console.log("method:", req.method)
	// HTTPヘッダーを出力
	res.writeHead(200,{'Content-Type': 'text/html'})
	// レスポンスの本体を出力
	res.end('<h1>Hello,World</h1>\n')
}
