require 'spec_helper'

describe 'galera_arbitrator' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      context 'galera_nodes/galera_group set, defaults for rest of parameters' do
        let(:params) do
          {
            :galera_nodes => '1.1.1.1,2.2.2.2,3.3.3.3',
            :galera_group => 'nonexistent_test_group',
          }
        end
        it { is_expected.to contain_class('galera_arbitrator') }
        it { is_expected.to contain_class('galera_arbitrator::install') }
        it { is_expected.to contain_class('galera_arbitrator::config') }
        it { is_expected.to contain_class('galera_arbitrator::service') }
        case facts[:osfamily]
        when 'RedHat'
          it { is_expected.to contain_package('Percona-XtraDB-Cluster-garbd-57') }
          it { is_expected.to contain_service('garb') }
          it { is_expected.to contain_file('/etc/sysconfig/garb') }
        when 'Debian'
          it { is_expected.to contain_package('percona-xtradb-cluster-garbd-5.7') }
          it { is_expected.to contain_service('garbd') }
          it { is_expected.to contain_file('/etc/default/garbd') }
        end 
      end
    end
  end
end
