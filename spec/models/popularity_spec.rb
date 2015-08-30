describe Popularity do

  describe 'public_methods' do

    it { expect(subject).to respond_to(:word) }
    it { expect(subject).to respond_to(:url) }

  end

  describe 'validations' do

    it 'requires occurrences to be present' do
      popularity = Popularity.new(occurrences: 1)
      expect(popularity).to be_valid
    end
    
    it 'requires occurrences to be greater then zero' do
      popularity = Popularity.new(occurrences: 0)
      expect(popularity).to_not be_valid
    end

    it 'requires occurrences to be an integer' do
      popularity = Popularity.new(occurrences: 1.0)
      expect(popularity).to_not be_valid
    end

    it 'requires words be unique per url' do
      word = FactoryGirl.create(:word)
      url = FactoryGirl.create(:url)
      popularities_count = Popularity.all.count
      popularity = FactoryGirl.create(:popularity, url: url, word: word)
      expect(Popularity.all.count).to eq( popularities_count + 1 )
      popularity = FactoryGirl.build(:popularity, url: url, word: word)
      expect(popularity).to_not be_valid
    end

  end
end
