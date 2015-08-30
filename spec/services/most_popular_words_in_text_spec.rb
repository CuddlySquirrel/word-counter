require 'rails_helper'

describe MostPopularWordsInText do
 
  let(:text){ 'a a z b b r c c c d e f f f g g h i i j l l n n m m k k o p' }

  let(:expected_result){ [["f", 3], ["c", 3], ["k", 2], ["m", 2], ["n", 2], ["l", 2], ["i", 2], ["g", 2], ["b", 2], ["a", 2]] }

  let(:service){ MostPopularWordsInText.new(text) }

  describe 'public methods' do
    it { expect(service).to respond_to(:create) }
  end

  it 'returns the right content' do
    expect(service.create).to eq(expected_result)
  end

end
