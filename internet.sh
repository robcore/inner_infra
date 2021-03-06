#!/bin/bash

# Does not work, but it is more effective
# sudo http_proxy=http://168.219.61.252:8080/ apt-get install -y libglib2.0-bin
# gsettings set org.gnome.system.proxy autoconfig-url "'http://168.219.61.251:8088/samsungcs.pac'"
# gsettings set org.gnome.system.proxy mode "'auto'"

ENVIRONMENT=/etc/environment
ENVIRONMENT_VALUES=`grep -vE "^(https?|ftp|no)_proxy=" $ENVIRONMENT`
sudo tee $ENVIRONMENT > /dev/null <<-EOS
$ENVIRONMENT_VALUES
http_proxy=http://168.219.61.252:8080/
ftp_proxy=ftp://168.219.61.252:8080/
https_proxy=http://168.219.61.252:8080/
no_proxy=qb.sec.samsung.net,165.213.180.100,127.0.0.1,localhost
EOS

sudo tee /usr/share/ca-certificates/infra.crt > /dev/null <<-EOS
-----BEGIN CERTIFICATE-----
MIIDvzCCAyigAwIBAgIJALMR2x1a2FCBMA0GCSqGSIb3DQEBBQUAMIGcMQswCQYD
VQQGEwJLUjEUMBIGA1UECBMLR3llb25nZ2ktZG8xDjAMBgNVBAcTBVN1d29uMRww
GgYDVQQKExNTQU1TVU5HIEVsZWN0cm9uaWNzMRwwGgYDVQQLExNTQU1TVU5HIEVs
ZWN0cm9uaWNzMSswKQYDVQQDEyJEaWdpdGFsIENpdHkgKFNBTVNVTkcgRWxlY3Ry
b25pY3MpMB4XDTEwMTIyNzEwNDYxMloXDTIwMTIyNDEwNDYxMlowgZwxCzAJBgNV
BAYTAktSMRQwEgYDVQQIEwtHeWVvbmdnaS1kbzEOMAwGA1UEBxMFU3V3b24xHDAa
BgNVBAoTE1NBTVNVTkcgRWxlY3Ryb25pY3MxHDAaBgNVBAsTE1NBTVNVTkcgRWxl
Y3Ryb25pY3MxKzApBgNVBAMTIkRpZ2l0YWwgQ2l0eSAoU0FNU1VORyBFbGVjdHJv
bmljcykwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALNFkjpgHZONlwoxdKZa
i4ovlxgC+6vpRp9KThJJLR3aoA6QI2gDTAXPRpApK17CWFfiI3BKhXweFSV2Iqn1
H+D1YfkpA2VFc40TPM9NoCZkTMbC3/bz+xiuvK3m9IKTqz2CfqPP4IQzoKvJBdws
FNDs3m2da26DbLfL8Zs0uv7nAgMBAAGjggEFMIIBATAdBgNVHQ4EFgQUFHdG9RXt
IxpAben7fc25moiAn+0wgdEGA1UdIwSByTCBxoAUFHdG9RXtIxpAben7fc25moiA
n+2hgaKkgZ8wgZwxCzAJBgNVBAYTAktSMRQwEgYDVQQIEwtHeWVvbmdnaS1kbzEO
MAwGA1UEBxMFU3V3b24xHDAaBgNVBAoTE1NBTVNVTkcgRWxlY3Ryb25pY3MxHDAa
BgNVBAsTE1NBTVNVTkcgRWxlY3Ryb25pY3MxKzApBgNVBAMTIkRpZ2l0YWwgQ2l0
eSAoU0FNU1VORyBFbGVjdHJvbmljcymCCQCzEdsdWthQgTAMBgNVHRMEBTADAQH/
MA0GCSqGSIb3DQEBBQUAA4GBAErvOYZf2fDS6W0qWEO9FFd69/KU/sxjWkK79FEZ
InhR9Wi5A+Drx+HoScy9fiY54qN/JudFjn+6tIjHoqM9PLplrM8S61RFDmOSSFW9
rX98JthZZyy7bISU8/wmbBvo13Zs8O4vzEaPfmZr8p9JQOT5YGLvZlvUl7u29M8v
ww1V
-----END CERTIFICATE-----
EOS
echo infra.crt | sudo tee -a /etc/ca-certificates.conf > /dev/null
sudo update-ca-certificates
