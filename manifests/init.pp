# == Class: galera_arbitrator
class galera_arbitrator(
  $servicename    = $galera_arbitrator::params::servicename,
  $packagename    = $galera_arbitrator::params::packagename,
  $sysconfig      = $galera_arbitrator::params::sysconfig,
  $galera_nodes   = $galera_artibrator::params::galera_nodes,
  $galera_group   = $galera_artibrator::params::galera_group,
  $galera_options = $galera_artibrator::params::galera_options,
  $galera_logfile = $galera_artibrator::params::galera_logfile,
) inherits galera_arbitrator::params {
  validate_string($servicename)
  validate_string($packagename)
  validate_string($sysconfig)
  if $galera_nodes {
    validate_string($galera_nodes)
  }
  if $galera_group {
    validate_string($galera_group)
  }
  if $galera_options {
    validate_string($galera_options)
  }
  if $galera_logfile {
    validate_string($galera_logfile)
  }

  anchor{'galera_arbitrator::begin':} ->
  class{'::galera_arbitrator::install':} ->
  class{'::galera_arbitrator::config':} ~>
  class{'::galera_arbitrator::service':} ->
  anchor{'galera_arbitrator::end':}
}
