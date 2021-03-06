# Changelog

## 2017-10-27 - Release 1.0.5

* Flagged as tested and supported under Puppet 5.

## 2017-02-17 - Release 1.0.4

* Added some basic spec testing.
* Fixed bugs with the following params: ensure_package, ensure_service, enable_service.
* Added some nifty badges to README that I borrowed from Vox.

## 2017-02-05 - Release 1.0.3

* Switched default systemd name to garb.

## 2017-02-04 - Release 1.0.2

* Restored proper scoping of variables.
* Added example of hiera parameter setting.
* Added support for accepting a string or array for galera_nodes.

## 2017-02-04 - Release 1.0.1

* Added options to provide more control: ensure_package, ensure_service, and enable_service.
* Minor text cleanup here and there.
* Added configs for travis-ci and adjustments to Gemfile to accommodate.
* Added support for Debian/Ubuntu family.
* Fixed an apparent looping bug that I missed previously.

## 2017-02-03 - Release 1.0.0

* Initial release!
