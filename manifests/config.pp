# == Class: galera_arbitrator::config
class galera_arbitrator::config inherits galera_arbitrator {
  file { $galera_arbitrator::sysconfig:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('galera_arbitrator/garb.erb'),
  }
}
