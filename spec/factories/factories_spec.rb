require 'rails_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "factory #{factory_name}" do
     it 'is valid' do
      build(factory_name).should be_valid
     end
  end
end
