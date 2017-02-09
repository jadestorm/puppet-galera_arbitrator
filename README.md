# galera_arbitrator

[![Build Status](https://travis-ci.org/jadestorm/puppet-galera_arbitrator.png?branch=master)](https://travis-ci.org/jadestorm/puppet-galera_arbitrator)
[![Code Coverage](https://coveralls.io/repos/github/jadestorm/puppet-galera_arbitrator/badge.svg?branch=master)](https://coveralls.io/github/jadestorm/puppet-galera_arbitrator)
[![Puppet Forge](https://img.shields.io/puppetforge/v/jadestorm/galera_arbitrator.svg)](https://forge.puppetlabs.com/jadestorm/galera_arbitrator)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/jadestorm/galera_arbitrator.svg)](https://forge.puppetlabs.com/jadestorm/galera_arbitrator)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/jadestorm/galera_arbitrator.svg)](https://forge.puppetlabs.com/jadestorm/galera_arbitrator)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/jadestorm/galera_arbitrator.svg)](https://forge.puppetlabs.com/jadestorm/galera_arbitrator)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with galera_arbitrator](#setup)
    * [What galera_arbitrator affects](#what-galera_arbitrator-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with galera_arbitrator](#beginning-with-galera_arbitrator)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module configures a standalone Galera Arbitrator without touching any
other components of the system.  It is developed for the RedHat family
but should be fairly easy to configure for other distributions.

## Module Description

A Galera Arbitrator acts as a lightweight member of a Galera cluster,
primarily useful when you need another node in the cluster for quorum.
It participates in voting without handling the actual functionality the
cluster provides.  For example if it is part of a MySQL cluster, it would
not serve MySQL at all.

I built this module to be incredibly focused on garbd and not effect
anything else on the system.

## Setup

### What galera_arbitrator affects

* Installs garbd package
* Sets up garbd sysconfig config file

### Setup Requirements

* Depends on puppetlabs-stdlib.
* You *must* have Percona's package repository (or whatever repo contains the packagename specified) configured for this to work, this module does not take care of it for you.

## Usage

### Beginning with galera_arbitrator

If you are running a RedHat based system, all you should have to do
is call the module with the list of nodes and cluster name (referred to
as cluster group by garbd).  Ex:

    class { 'galera_arbitrator':
      galera_nodes => '1.1.1.1:4567,2.2.2.2:4567,3.3.3.3:4567',
      galera_group => 'my_galera_cluster',
    }
    
You can also configure it via hiera and simply `include galera_arbitrator`:

    ---
    galera_arbitrator::galera_nodes: '1.1.1.1:4567,2.2.2.2:4567,3.3.3.3:4567'
    galera_arbitrator::galera_group: 'my_galera_cluster'

### Parameters for the galera_arbitrator class
* `servicename`: The service name used with init.d, systemctl, etc.  Default: `garbd`
* `packagename`: The full package name used with your package manager.  Default: `Percona-XtraDB-Cluster-garbd-57`
* `sysconfig`: Full path to the sysconfig file used by garbd.  Default: `/etc/sysconfig/garbd`
* `ensure_package`: Sets the ensure value of the package resource.  Default: `present`
* `ensure_service`: Sets the ensure value of the service resource.  Default: `running`
* `enable_service`: Sets the enable value of the service resource.  Default: `true`
* `galera_nodes`: Comma separated list, or array, of node IP addresses and optional ports using ipaddr:port. *required*
* `galera_group`: Galera cluster name *required*
* `galera_options`: Optional parameters to pass to garbd
* `galera_logfile`: Optional log file path (defaults to syslog)

## Reference

For more information on how to use the Galera Arbitrator, see:
[Percona's Latest Garbd Howto](https://www.percona.com/doc/percona-xtradb-cluster/latest/howtos/garbd_howto.html)

## Limitations

Out of the box, this only supports RedHat style Linux distributions, and
only those that are supported by Percona.  Most Percona supported Linux
distributions should be fairly easy to support by setting servicename,
packagename, and sysconfig.

## Development

I don't have anything specific to say here aside from, fork it in github.com
and submit a pull request!  Thank you for your help!

## Contributors

* Daniel Henninger, github.com/jadestorm
