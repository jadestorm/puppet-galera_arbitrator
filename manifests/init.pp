# == Class: galera_arbitrator
#
# Full description of class galera_arbitrator here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'galera_arbitrator':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
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
