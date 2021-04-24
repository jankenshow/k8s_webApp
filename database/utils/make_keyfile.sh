#!/bin/bash

KEY_FILE_DIR=$(dirname $(cd $(dirname $0); pwd))

## ランダム文字列生成 | 改行削除 | 必要サイズにカット
openssl rand -base64 1024 | tr -d '\r\n' | cut -c 1-1024 > ${KEY_FILE_DIR}/keyfile