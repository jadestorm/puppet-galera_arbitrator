# == Class: galera_arbitrator::install
class galera_arbitrator::install inherits galera_arbitrator {
  package { $packagename:
    ensure => $ensure_package,
  }
}
