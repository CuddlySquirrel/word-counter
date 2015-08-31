require 'rails_helper'

describe CreateWordsAndPopularitiesForUrl do

  let(:url_obj){ FactoryGirl.create(:url) }

  let(:service){ CreateWordsAndPopularitiesForUrl.new(url_obj) }

  let(:counted_words_array){ [["f", 3], ["c", 3], ["k", 2], ["m", 2], ["n", 2], ["l", 2], ["i", 2], ["g", 2], ["b", 2], ["a", 2]] }

  describe 'public methods' do
    it { expect(service).to respond_to(:create) }
  end

  it 'creates the right number of words and popularities' do
    service.stub(:counted_words){ counted_words_array }
    service.create
    url = Url.find(url_obj.id)
    expect(url.words.count).to eq(counted_words_array.length)
    expect(url.popularities.count).to eq(counted_words_array.length)
  end

end
