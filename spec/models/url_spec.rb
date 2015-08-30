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

    it 'requires unique value' do
      existing = FactoryGirl.create(:url)
      url = Url.new(value: existing.value)
      expect(url).to_not be_valid
    end

    it 'requires a protocol' do
      url_no_protocol = Url.new(value: 'asdf.com')
      expect(url_no_protocol).to_not be_valid
    end

    it 'requires a valid protocol' do
      url_ftp = Url.new(value: 'ftp://asdf.com')
      expect(url_ftp).to_not be_valid
    end

    it 'validates when HTTP protocol' do
      url_http = Url.new(value: 'http://asdf.com')
      expect(url_http).to be_valid
    end

    it 'validates when HTTPS protocol' do
      url_https = Url.new(value: 'https://asdf.com')
      expect(url_https).to be_valid

    end
    
  end
end
