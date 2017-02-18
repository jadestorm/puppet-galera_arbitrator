# == Class: galera_arbitrator
class galera_arbitrator(
  $servicename    = $galera_arbitrator::params::servicename,
  $packagename    = $galera_arbitrator::params::packagename,
  $sysconfig      = $galera_arbitrator::params::sysconfig,
  $ensure_package = $galera_arbitrator::params::ensure_package,
  $ensure_service = $galera_arbitrator::params::ensure_service,
  $enable_service = $galera_arbitrator::params::enable_service,
  $galera_nodes   = $galera_arbitrator::params::galera_nodes,
  $galera_group   = $galera_arbitrator::params::galera_group,
  $galera_options = $galera_arbitrator::params::galera_options,
  $galera_logfile = $galera_arbitrator::params::galera_logfile,
) inherits galera_arbitrator::params {
  validate_string($servicename)
  validate_string($packagename)
  validate_string($sysconfig)
  validate_string($ensure_package)
  validate_string($ensure_service)
  validate_bool($enable_service)
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
