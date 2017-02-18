require 'spec_helper'
describe 'galera_arbitrator' do

  context 'galera_nodes/galera_group set, defaults for rest of parameters' do
    it { should contain_class('galera_arbitrator') }
  end
end
