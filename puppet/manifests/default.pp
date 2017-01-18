# Install java 8 & android SDK
class { 'java': } ->
  class { 'android': }

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
} -> # Disable telemtry
  exec { 'disable cordova telemetry':
    command => '/usr/bin/cordova telemetry off',
    user    => root
  }

# Install forcedroid
package { 'forcedroid':
  ensure          => 'present',
  install_options => ['--silent'],
  provider        => 'npm',
}

include git
