class podman::repo::ubuntu {

  $version = $::facts['os']['release']['full']

  if (versioncmp($version, '20.10') < 0) {
    apt::source { 'podman':
      location => "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${version}/",
      repos    => '/',
      release  => '',
    } -> Package['podman']
  }
}
