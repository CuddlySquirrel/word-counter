require 'rails_helper'

describe MostPopularWordsInText do
 
  let(:text){ 'a a b b c c d e f f g g h i i j k k l l m m n n o p' }

  let(:service_double){ instance_double('CountWordsAtUrl') }

  let(:service){ service_double.new('url string') }

  describe 'public methods' do
    it { expect(service).to respond_to(:create) }
  end

  it 'returns the right content' do
    service.stub(:text_from_url){ text }
    puts service.create
  end

end
