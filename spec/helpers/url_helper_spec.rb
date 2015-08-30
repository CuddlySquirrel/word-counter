require 'rails_helper'

describe UrlHelper do

  describe '#helper_most_popular_word' do
    before(:all) do
      @url_with_popularities = FactoryGirl.create(:url_with_popularities)
    end

    let(:data){ helper_most_popular_word(@url_with_popularities) }
    
    it 'returns a hash' do
      expect(data).to be_a(Hash)
    end

    it 'has a key named "value" with a string value' do
      expect(data[:value]).to be_a(String)
    end
    
    it 'has a key named "occurrences" with an integer value' do
      expect(data[:occurrences]).to be_an(Integer)
    end

  end
  
  describe '#helper_top_ten_words' do
    before(:all) do
      @url_with_popularities = FactoryGirl.create(:url_with_popularities)
    end

    let(:data){ helper_top_ten_words(@url_with_popularities) }
    
    it 'returns an Array' do
      expect(data).to be_an(Array)
    end

    it 'length of 10' do
      expect(data.length).to eq(10) 
    end

    it 'elements are hashes' do
      expect(data[0]).to be_a(Hash)
    end

    it 'hash elements have keys named "value" with string values' do
      expect(data[0][:value]).to be_a(String)
    end

    it 'hash elements have keys named "occurrences" with integer values' do
      expect(data[0][:occurrences]).to be_an(Integer)
    end

  end
  
end
