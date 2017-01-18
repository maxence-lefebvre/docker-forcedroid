# Install java 8 & android SDK
class { 'java': } ->
  class { 'android': }

android::platform { 'android-24' :}
android::build_tools {'build-tools-24.0.1' :}

# Install nodejs
class { 'nodejs': }

# Install cordova
package { 'cordova':
  ensure   => 'present',
  provider => 'npm',
}

# Disable telemtry
exec { 'disable cordova telemetry':
  command => 'cordova telemetry off',
  path    => ['/usr/bin', '/usr/sbin']
}

# Install forcedroid
package { 'forcedroid':
  ensure   => 'present',
  provider => 'npm',
}
