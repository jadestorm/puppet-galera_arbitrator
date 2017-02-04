# == Class: galera_arbitrator::install
class galera_arbitrator::install inherits galera_arbitrator {
  package { $::galera_arbitrator::packagename:
    ensure => $galera_atbitrator::ensure_package,
  }
}
