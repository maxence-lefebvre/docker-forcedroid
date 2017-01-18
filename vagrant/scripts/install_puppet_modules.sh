#!/bin/bash

mkdir -p /etc/puppet/modules
# module dependency for "validate_re" function (used by java module)
puppet module install --force puppetlabs-stdlib
# module dependency for wget (...)
puppet module install --force maestrodev-wget
puppet module install --force puppetlabs-apt
puppet module install --force puppet-nodejs
puppet module install --force puppetlabs-java
puppet module install --force maestrodev-android
