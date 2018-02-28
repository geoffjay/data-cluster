#!/bin/bash

# TODO: dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# TODO: source $dir/logging.sh

# FIXME: Move into logging.sh
__log_setup() {
  local log_path="/var/log/setup"
  mkdir -p $log_path
  touch $log_path/$2.log
  eval "$1=`$log_path/$2.log`"
}

# Update and install dependencies
__common_update() {
  apt update && apt upgrade -y
  apt install -y vim git python3-pip
}

# Docker
__docker_setup() {
  curl -fsSL https://get.docker.com | sh
  usermod -aG docker pi
  pip3 install docker-compose
  systemctl enable docker
  systemctl restart docker
}

#
# TODO: Check for root?
# TODO: Test the logging stuff, all guesses atm
#

local log_file
__log_setup log_file "common"
__common_update >> "$log_file"
__docker_setup >> "$log_file"
