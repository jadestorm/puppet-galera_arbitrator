# == Class: galera_arbitrator::params
class galera_arbitrator::params inherits galera_arbitrator {
  $galera_nodes   = undef
  $galera_group   = undef
  $galera_options = undef
  $galera_logfile = undef

  case $::osfamily {
    'RedHat': {
      $servicename = 'garbd'
      $packagename = 'Percona-XtraDB-Cluster-garbd-57'
      $sysconfig   = '/etc/sysconfig/garbd'
    }
    default: {
      fail { "This operating system family (${::osfamily}) is not supported.": }
    }
  }
}
