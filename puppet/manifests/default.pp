include java8, git

# Trying to make sur "-Xmx256M" in android-sdk-linux/tools/android is replaced by "-Xmx1G"
# Installation of platform tools / platform / build tools is WAY too long (between 4 and 17hours!!)
exec { 'Increase-maxheapsize-for-android-sdk-manager':
  command    => '/bin/sed -i \'s/Xmx256M/Xmx1G/g\' /opt/android/android-sdk-linux/tools/android',
  before     => Exec['update-android-package-platform-tools'],
  require    => [File['/opt/android/expect-install-platform-tools']]
}

class { 'android':
  installdir => '/opt/android'
}
android::platform { 'android-24' : }
android::build_tools { 'build-tools-24.0.1' : }

# Install nodejs
class { 'nodejs':
  repo_url_suffix => '7.x'
}

# Install cordova
package { 'cordova':
  ensure          => 'present',
  install_options => ['--silent'],
  provider        => 'npm',
} -> # Disable telemetry
  exec { 'disable cordova telemetry':
    environment => ['HOME=/home/vagrant'],
    command     => '/usr/bin/cordova telemetry off'
  }

# Install forcedroid
package { 'forcedroid':
  ensure          => 'present',
  install_options => ['--silent'],
  provider        => 'npm',
}

# set path to android
file { '/etc/profile.d/android_path.sh':
  mode    => '644',
  content => 'export PATH=$PATH:$ANDROID_HOME/tools',
}