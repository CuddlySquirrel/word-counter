require 'rails_helper'

describe Url do
  
  describe 'public_methods' do

    it { expect(subject).to respond_to(:popularities) }
    it { expect(subject).to respond_to(:words) }
    it { expect(subject).to respond_to(:value) }
    it { expect(subject).to respond_to(:most_popular) }
    it { expect(subject).to respond_to(:top_ten_words) }

  end

  describe 'validations' do

    it 'requires value' do 
      url = Url.new(value: '')
      expect(url).to_not be_valid
    end

  end


end
