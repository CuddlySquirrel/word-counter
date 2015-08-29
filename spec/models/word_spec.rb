require 'rails_helper'

describe Word do
  
  describe 'public_methods' do
    it { expect(subject).to respond_to(:popularities) }
    it { expect(subject).to respond_to(:urls) }
    it { expect(subject).to respond_to(:value) }
  end


end
