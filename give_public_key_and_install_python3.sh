#!/bin/bash
#
# 形式: give_public_key_and_install_python3.sh 鍵を付与されるユーザ名
#
# 概要: ~/.sshのauthorized_keysに/vagrant以下の公開鍵id_rsa.pubが登録されていなければ、
# 　　　公開鍵id_rsa.pubの内容をauthorized_keysに追記する。
# 　　　その後、最新のpython3をインストールします。
#
#


# --- 定数定義 ---

# リターンコード: 成功
declare -ri RC_SUCCESS=0


# --- 主処理 ---

# vagrantユーザでコマンドを実行する。
# authorized_keysに公開鍵id_rsa.pubを表すフラグis_there_public_key_CM01がなければ
# authorized_keysにid_rsa.pubの内容を追記する。
# その後パッケージのインストールを行う。
su - vagrant -c "
    mkdir -p ~/.ssh

    if ! < ~/.ssh/authorized_keys  grep is_there_public_key_CM01 >> /dev/null 2>&1 ; then
        cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
    fi

    sudo dnf install python3 -y
"


exit ${RC_SUCCESS}