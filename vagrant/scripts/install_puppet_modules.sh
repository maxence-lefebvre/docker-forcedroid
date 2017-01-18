#!/bin/bash

mkdir -p /etc/puppet/modules
puppet module install --force puppetlabs-apt
puppet module install --force puppet-nodejs
puppet module install --force puppetlabs-java
puppet module install --force maestrodev-android
