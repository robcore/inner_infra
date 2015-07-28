#!/bin/bash
\curl -sSL https://github.com/ermaker/bootstrap/raw/master/vagrant.sh | bash
sudo cp -f /usr/share/ca-certificates/infra.crt /opt/vagrant/embedded/cacert.pem
