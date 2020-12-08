#!/bin/bash

# $1=length, default 10
function mutant-encrypt-random-hash {
  local size
  local out
  [ -z "$1" ] && size=10 || size=$1
  out=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $size ; echo '')
  echo "$out"
}

function mutant-ssh-generate-key {
  local random_num
  random_num="$(mutant-encrypt-random-hash 10)"
  filename="/home/$USER/.ssh/$random_num"
  ssh-keygen -t rsa -b 4096 -f "$filename" -q -N ""
  echo "Key Generated: $random_num and $random_num.pub"
}

# $1=git message
function mutant-git-push-all {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}


