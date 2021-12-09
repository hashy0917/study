# memo
nutanixのcvmにsshして
`acli image.list` から、ubuntuのqcow2のuuidを調べた。
main.tfにubuntuのqcow2のimageのuuidを調べる項目を追加し、今までダウンロードしてきたものを設定していた箇所にこのuudiを入れてubuntuのイメージをインストールするようにした
`resource "nutanix_virtual_machine" "vm"` に `guest_customization_cloud_init_user_data ="${base64encode("${file("devmin.conf")}")}"` という項目を作成し、 `devmin.conf`というymlファイルを作成し、
中にcloud-initのymlを書き込んで設定をできるようにした
デフォルトパスワードとデフォルトユーザー名は
`ubuntu` `asdfqwer`


## memo
使い方
`ansible-playbook -i ./inventry.sh ./site.yml -u ubuntu`
ansibleがlocalhostに接続して[terraform_module](https://docs.ansible.com/ansible/2.9/modules/terraform_module.html)から `terraform apply`を実行。
インスタンスが立ち上がったらダイナミックインベントリのスクリプト(inventry.sh)からインベントリ情報を取得し、ansible playbook

