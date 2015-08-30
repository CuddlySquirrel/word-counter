require 'rails_helper'

describe 'factory url' do

   describe 'with popularities' do
      before(:all) do
        @url_with_popularities = FactoryGirl.create(:url_with_popularities)
      end

      let(:popularities){ @url_with_popularities.popularities }

      let(:popularity){ popularities[0] }

      it 'creates 10 popularities' do
        expect(popularities.count).to eq(10)
      end 

      it 'they are the right type' do
        expect(popularity).to be_a(Popularity)
      end 

      it 'they have a url' do
        expect(popularity.url).to be_a(Url)
      end 

      it 'they have a word' do
        expect(popularity.word).to be_a(Word)
      end 

    end
end
