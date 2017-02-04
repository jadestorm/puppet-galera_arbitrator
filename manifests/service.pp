# == Class: galera_arbitrator::service
class galera_arbitrator::service inherits galera_arbitrator {
  service { $::galera_arbitrator::servicename:
    ensure  => $galera_arbitrator::ensure_service,
    enabled => $galera_arbitrator::enable_service,
  }
}
