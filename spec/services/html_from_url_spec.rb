require 'rails_helper'

describe HTMLFromUrl do

  let(:text){ 'body' }
 
  let(:html){ "<html><body>#{text}</body></html>" }

  let(:service){ HTMLFromUrl.new('url string') }

  let(:nokogiri_html_document){ service.create() }

  describe 'public methods' do
    it { expect(service).to respond_to(:create) }
  end

  it 'returns a nokogiri html object' do
    service.stub(:html_get){ html }
    expect(nokogiri_html_document).to be_a(Nokogiri::HTML::Document)
  end

  it 'has the right content' do
    service.stub(:html_get){ html }
    expect(nokogiri_html_document.text).to eq(text)
  end

end
