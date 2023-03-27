#!/usr/bin/python3

#必要なライブラリをインポート
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

from time import sleep

#from bs4 import BeautifulSoup


#ヘッドレスの設定をするため、Optionsクラスのインポートを行う
# ドライバーの準備(CUIだと非表示モードでしか起動不可なため)
#変数optionsに格納するためOptionsのインスタンスを生成する。
options = webdriver.ChromeOptions()

#headlessの設定をTrueにする
options.add_argument('--headless')
#options.add_argument("--start-maximized")
#options.add_argument('--no-sandbox')
#options.add_argument('--disable-dev-shm-usage')

#ここで、バージョンなどのチェックをします。
#webdriverインスタンスを起動する
driver = webdriver.Chrome(ChromeDriverManager().install(),options=options)
#指定したドライバーが見つかるまで待機
driver.implicitly_wait(10)

url = "https://my.freenom.com/clientarea.php"#使えない
#URLを開く
driver.get(url)

# ウィンドウサイズをWEBサイトに合わせて変更(全画面化)
width = driver.execute_script("return document.body.scrollWidth;")
height = driver.execute_script("return document.body.scrollHeight;")
driver.set_window_size(width,height)

#要素を選択して操作
# idで指定
#driver.find_element_by_id("id").text
# classで指定
#driver.find_element_by_class_name("className").text
# xpathで指定
#driver.find_element_by_xpath("xpath").text

## ボタンを選択してクリック
button = driver.find_element_by_id("btn")
button.click()

## パスワード要素にテキストを入力
password = driver.find_element_by_id("passwd")
password = password.send_keys("text_password")

#ブラウザの更新
#driver.refresh()

#ブラウザを最大化する
#driver.maximize_window()

# ウィンドウを閉じる
#driver.close()
# すべてのウィンドウを閉じる
#driver.quit()

sleep(10)

#画面キャプチャを取得
driver.save_screenshot('image.png')
#driver.get_screenshot_as_file("image.png")

#サイトのタイトルを表示
print("サイトのタイトル：", driver.title)
#print("URLを表示:", driver.current_url)

#beautifulsoupで解析
#html = driver.page_source
#BeautifulSoup(html,"lxml")

# リンクテキストの完全一致で取得する
#driver.find_elements_by_link_text('リンクテキスト')
# リンクテキストの部分一致で取得する
#driver.find_elements_by_partial_link_text('リンクテキスト')

#クロームの終了処理
driver.quit()
