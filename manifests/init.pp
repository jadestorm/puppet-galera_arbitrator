# == Class: galera_arbitrator
class galera_arbitrator(
  String            $servicename    = $galera_arbitrator::params::servicename,
  String            $packagename    = $galera_arbitrator::params::packagename,
  String            $sysconfig      = $galera_arbitrator::params::sysconfig,
  String            $ensure_package = $galera_arbitrator::params::ensure_package,
  String            $ensure_service = $galera_arbitrator::params::ensure_service,
  Boolean           $enable_service = $galera_arbitrator::params::enable_service,
  Optional[String]  $galera_nodes   = $galera_arbitrator::params::galera_nodes,
  Optional[String]  $galera_group   = $galera_arbitrator::params::galera_group,
  Optional[String]  $galera_options = $galera_arbitrator::params::galera_options,
  Optional[String]  $galera_logfile = $galera_arbitrator::params::galera_logfile,
) inherits galera_arbitrator::params {
  anchor{'galera_arbitrator::begin':}
  -> class{'::galera_arbitrator::install':}
  -> class{'::galera_arbitrator::config':}
  ~> class{'::galera_arbitrator::service':}
  -> anchor{'galera_arbitrator::end':}
}
