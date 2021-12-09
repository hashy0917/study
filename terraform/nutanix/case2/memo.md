# memo
1. nutanixのcvmにsshして
2. `acli image.list` から、ubuntuのqcow2のuuidを調べた。
3. main.tfにubuntuのqcow2のimageのuuidを調べる項目を追加
4. 今までダウンロードしてきたものを設定していた箇所にこのuudiを入れてubuntuのイメージをインストールするようにした
5. `resource "nutanix_virtual_machine" "vm"` に `guest_customization_cloud_init_user_data ="${base64encode("${file("devmin.conf")}")}"` という項目を作成
6. `devmin.conf`というymlファイルを作成し、中にcloud-initのymlを書き込んで設定をできるようにした
7. デフォルトパスワードとデフォルトユーザー名は
    - `ubuntu` 
    - `asdfqwer`
