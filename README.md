# Forcedroid development environment

The purpose of this repository is to provide developers with fully working development environments by ensuring all dependencies (JDK, Android SDKs, Cordova, etc...) are correctly installed in an isolated environment.

To accomplish this, two ways are proposed :
 * Vagrant box
 * Docker image
 
## I. Vagrant box

### I.1 Vagrant box dependencies

To use this vagrant box, ensure that you have vagrant and virtualbox installed.
On Windows, you can install them by installing chocolatey then running

```
cinst -y vagrant virtualbox
```

### I.2 In case of proxy

If you are running behind a proxy, you should install vagrant plugin "vagrant-proxyconf" by running
```
set http_proxy=http://my.proxy:8080/
set https_proxy=%http_proxy%
vagrant plugin install vagrant-proxyconf
```

This plugin will configure the proxy inside the guest OS and supports multiple targets, such as docker, apt, yum, etc...

### I.3 Using the vagrant box

```
vagrant init #....
```