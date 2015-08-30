require 'rails_helper'

describe TextFromHTML do
 
  let(:html){ ' <html><body><script>script</script><style>style</style>[ ]-+b@o%*(d^~!#y</body></html>  ' }

  let(:nokogiri_html_document){ Nokogiri::HTML(html) }

  let(:service){ TextFromHTML.new(nokogiri_html_document) }

  let(:text){ service.create }

  describe 'public methods' do
    it { expect(service).to respond_to(:create) }
  end

  it 'has the right content' do
    expect(text).to eq('b o d y')
  end

end
