#!/bin/bash

mkdir -p /etc/puppet/modules
# module dependency for "validate_re" function (used by java module)
puppet module install --force puppetlabs-stdlib > /dev/null 2>&1
# module dependency for wget (...)
puppet module install --force maestrodev-wget > /dev/null 2>&1
# module dependency for java mod
puppet module install puppet-archive > /dev/null 2>&1

# Our dependencies
puppet module install --force puppetlabs-apt > /dev/null 2>&1
puppet module install --force puppet-nodejs > /dev/null 2>&1
puppet module install --force spantree-java8 > /dev/null 2>&1
# puppet module install --force puppetlabs-java
puppet module install --force maestrodev-android > /dev/null 2>&1

# needed for forcedroid create
puppet module install --force puppetlabs-git > /dev/null 2>&1