#!/bin/bash

sudo tee /etc/default/docker > /dev/null <<-EOS
export http_proxy=http://168.219.61.252:8080/
export ftp_proxy=ftp://168.219.61.252:8080/
export https_proxy=http://168.219.61.252:8080/
export no_proxy=qb.sec.samsung.net,165.213.180.100,127.0.0.1,localhost
export SSL_CERT_FILE=/usr/share/ca-certificates/samsung.crt
EOS
