require 'rails_helper'

describe HTMLFromUrl do
 
  let(:html){ '<html><body>body</body></html>' }

  let(:html_from_url_service){ HTMLFromUrl.new('url string') }

  let(:nokogiri_html_document){ html_from_url_service.create() }

  describe 'public methods' do
    it { expect(html_from_url_service).to respond_to(:create) }
  end

  it 'returns a nokogiri html object' do
    html_from_url_service.stub(:html_get){ html }
    expect(nokogiri_html_document).to be_a(Nokogiri::HTML::Document)
  end

  it 'has the right content' do
    html_from_url_service.stub(:html_get){ html }
    expect(nokogiri_html_document.text).to eq('body')
  end

end
