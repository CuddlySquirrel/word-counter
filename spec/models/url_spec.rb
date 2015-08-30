require 'rails_helper'

describe Url do
  
  describe 'public_methods' do

    it { expect(subject).to respond_to(:popularities) }
    it { expect(subject).to respond_to(:words) }
    it { expect(subject).to respond_to(:value) }

  end

  describe 'validations' do

    it 'requires value' do 
      url = Url.new(value: '')
      expect(url).to_not be_valid
    end

  end


end
