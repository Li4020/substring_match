#!/bin/bash

# 結果を保存するファイル名
output_file="random_strings.txt"

# 長さの開始値と終了値を設定
start_length=100
end_length=10000

# ファイルを空にする
> $output_file

# 長さを100ずつ変えていき、ランダムな0と1の文字列を生成する
for ((length=start_length; length<=end_length; length+=100)); do
  for i in {1..10}; do
    random_string=$(LC_ALL=C tr -dc '01' < /dev/urandom | fold -w $length | head -n 1)
    echo "$random_string" >> $output_file
  done
done