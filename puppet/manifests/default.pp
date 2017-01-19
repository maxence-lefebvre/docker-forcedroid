# Install java 8 & android SDK
class { 'java': } ->
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
    command => '/usr/bin/cordova telemetry off'
  }

# Install forcedroid
package { 'forcedroid':
  ensure          => 'present',
  install_options => ['--silent'],
  provider        => 'npm',
}

include git

# set path to android
file { '/etc/profile.d/android_home.sh':
  mode    => '644',
  content => 'export ANDROID_HOME=/opt/android/android-sdk-linux',
} -> file { '/etc/profile.d/android_path.sh':
  mode    => '644',
  content => 'export PATH=$PATH:$ANDROID_HOME/tools',
}