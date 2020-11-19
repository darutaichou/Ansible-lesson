#!/bin/bash
#
# 形式: give_private_key_and_install_ansible.sh 鍵を付与されるユーザ名
#
# 概要: 秘密鍵id_rsaが~/.sshに存在しなければ、/vagrantから秘密鍵id_rsaをコピーし、
# 　　　最新のepel-releaseとansibleをインストールします。
#
# パラメータ:
# 　鍵を付与するユーザ名: 文字列
#
#


# --- 定数定義 ---

# リターンコード: 成功
declare -ri RC_SUCCESS=0


# --- 主処理 ---

# 引数で与えられたユーザに指定したコマンド列を渡す
# 秘密鍵が~/.sshに存在しなければ、/vagrant以下からコピーする。
# その後パッケージのインストールを行う。
su - vagrant -c '
    mkdir -p ~/.ssh

    if [[ ! -f ~/.ssh/id_rsa ]]; then
        cp /vagrant/id_rsa ~/.ssh/
        chmod 600 ~/.ssh/id_rsa
    fi

    sudo dnf install epel-release -y
    sudo dnf install ansible -y
'

exit ${RC_SUCCESS}