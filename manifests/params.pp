# == Class: galera_arbitrator::params
class galera_arbitrator::params {
  $galera_nodes   = undef
  $galera_group   = undef
  $galera_options = undef
  $galera_logfile = undef
  
  $ensure_package = 'present'
  $ensure_service = 'running'
  $enable_service = true

  case $::osfamily {
    'RedHat': {
      $servicename = 'garb'
      $packagename = 'Percona-XtraDB-Cluster-garbd-57'
      $sysconfig   = '/etc/sysconfig/garbd'
    }
    'Debian': {
      $servicename = 'garbd'
      $packagename = 'percona-xtradb-cluster-garbd-5.7'
      $sysconfig   = '/etc/default/garbd'
    }
    default: {
      fail { "This operating system family (${::osfamily}) is not supported.": }
    }
  }
}
