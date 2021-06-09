# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include podman::install
class podman::install {

  case $::facts['os']['name'] {
    'Ubuntu': {
      include podman::repo::ubuntu
    }
    'RedHat', 'CentOS': {
    }
    default: {
      fail("${::facts['os']['name']} is not supported")
    }
  }

  package { 'slirp4netns':
    ensure => present,
  }

  package { 'containernetworking-plugins':
    ensure => present,
  }

  package { 'podman':
    ensure => present,
  }
}
