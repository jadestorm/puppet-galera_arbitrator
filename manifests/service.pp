# == Class: galera_arbitrator::service
class galera_arbitrator::service inherits galera_arbitrator {
  service { $::galera_arbitrator::servicename:
    ensure => 'running',
  }
}
