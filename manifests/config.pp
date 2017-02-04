# == Class: galera_arbitrator::config
class galera_arbitrator::config inherits galera_arbitrator {
  file { $sysconfig:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('galera_arbitrator/garb.erb'),
  }
}
