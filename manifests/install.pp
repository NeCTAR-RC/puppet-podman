# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include podman::install
class podman::install {

  $version = $facts['os']['release']['full']
  if (versioncmp($version, '20.10') < 0) {
    case $::osfamily {
      'Debian': {
        apt::source { 'podman':
          location => "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${version}/",
          repos    => '/',
          release  => '',
        } -> Package['podman']
      }
    }
  }

  package { 'slirp4netns':
    ensure => present,
  }
  package { 'podman':
    ensure => present,
  }
}
