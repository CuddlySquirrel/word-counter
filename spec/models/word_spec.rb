require 'rails_helper'

describe Word do
  
  describe 'public_methods' do
    it { expect(subject).to respond_to(:popularities) }
    it { expect(subject).to respond_to(:urls) }
    it { expect(subject).to respond_to(:value) }
  end


  describe 'validations' do

    it 'requires value' do 
      word = Word.new(value: '')
      expect(word).to_not be_valid
    end

    it 'requires unique value' do
      existing = FactoryGirl.create(:word)
      word = Word.new(value: existing.value)
      expect(word).to_not be_valid
    end

  end
end
