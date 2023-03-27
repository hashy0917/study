#!/bin/python3

#必要なライブラリをインポート
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

#ヘッドレスの設定をするため、Optionsクラスのインポートを行う
# ドライバーの準備(CUIだと非表示モードでしか起動不可なため)
#変数optionsに格納するためOptionsのインスタンスを生成する。
options = webdriver.ChromeOptions()

#headlessの設定をTrueにする
options.add_argument('--headless')
#options.add_argument('--no-sandbox')
#options.add_argument('--disable-dev-shm-usage')

#ここで、バージョンなどのチェックをします。
#webdriverを起動する
driver = webdriver.Chrome(ChromeDriverManager().install(),options=options)

#URLを開く（下記はYahoo!天気）
driver.get("https://weather.yahoo.co.jp/weather/")

# ウィンドウサイズをWEBサイトに合わせて変更(全画面化)
width = driver.execute_script("return document.body.scrollWidth;")
height = driver.execute_script("return document.body.scrollHeight;")
driver.set_window_size(width,height)

#画面キャプチャを取得
driver.save_screenshot('conoha.png')

#クロームの終了処理
driver.close()
