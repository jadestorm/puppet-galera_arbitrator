require 'spec_helper'
describe 'galera_arbitrator' do

  context 'with defaults for all parameters' do
    it { should contain_class('galera_arbitrator') }
  end
end
