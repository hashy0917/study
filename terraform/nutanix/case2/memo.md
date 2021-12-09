# memo
nutanixのcvmにsshして
`acli image.list` から、ubuntuのqcow2のuuidを調べた。
main.tfにubuntuのqcow2のimageのuuidを調べる項目を追加し、今までダウンロードしてきたものを設定していた箇所にこのuudiを入れてubuntuのイメージをインストールするようにした
`resource "nutanix_virtual_machine" "vm"` に `guest_customization_cloud_init_user_data ="${base64encode("${file("devmin.conf")}")}"` という項目を作成し、 `devmin.conf`というymlファイルを作成し、
中にcloud-initのymlを書き込んで設定をできるようにした
デフォルトパスワードとデフォルトユーザー名は
`ubuntu` `asdfqwer`
