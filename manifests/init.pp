# Class: galera_arbitrator
#
# Enable and configure the Galera arbitrator (optional part of a Galera cluster)  See README.md for more details.
#
# @param servicename The service name used with init.d, systemctl, etc.
# @param packagename The full package name used with your package manager.
# @param sysconfig Full path to the sysconfig file used by garbd.
# @param ensure_package Sets the ensure value of the package resource.  Default: `present`
# @param ensure_service Sets the ensure value of the service resource.  Default: `running`
# @param enable_service Sets the enable value of the service resource.  Default: `true`
# @param galera_nodes Comma separated list, or array, of node IP addresses and optional ports using ipaddr:port. *required*
# @param galera_group Galera cluster name *required*
# @param galera_options Optional parameters to pass to garbd
# @param galera_logfile Optional log file path (defaults to syslog)
class galera_arbitrator (
  String            $servicename,
  String            $packagename,
  String            $sysconfig,
  String            $ensure_package,
  String            $ensure_service,
  Boolean           $enable_service,
  Optional[String]  $galera_nodes,
  Optional[String]  $galera_group,
  Optional[String]  $galera_options,
  Optional[String]  $galera_logfile,
) {
  contain 'galera_arbitrator::install'
  contain 'galera_arbitrator::config'
  contain 'galera_arbitrator::service'

  Class['galera_arbitrator::install']
  -> Class['galera_arbitrator::config']
  ~> Class['galera_arbitrator::service']
}
