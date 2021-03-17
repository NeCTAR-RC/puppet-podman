class podman::repo::ubuntu {

  $version = $::facts['os']['release']['full']

  if (versioncmp($version, '20.10') < 0) {
    include apt
    apt::key { 'kubic':
      id     => '2472D6D0D2F66AF87ABA8DA34D64390375060AA4',
      source => "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${version}/Release.key",
    }
    -> apt::source { 'podman':
      location => "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${version}/",
      repos    => '/',
      release  => '',
    }
    -> Package['podman']
  }
}
