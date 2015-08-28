require 'rails_helper'

describe Url do
  
  describe 'public_methods' do
    it { expect(subject).to respond_to(:value) }
    it { expect(subject).to respond_to(:most_popular) }
    it { expect(subject).to respond_to(:top_ten) }
  end


end
