# == Class: galera_arbitrator::service
class galera_arbitrator::service inherits galera_arbitrator {
  service { $servicename:
    ensure  => $ensure_service,
    enabled => $enable_service,
  }
}
