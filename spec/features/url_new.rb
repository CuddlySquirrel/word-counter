require 'rails_helper'

describe 'new url' do

  let(:new_url){ 'https://www.reddit.com/' }

  it 'does not appear on index page' do
    visit urls_path
    expect(find('.url .list')).to_not have_content(new_url)
  end


  describe 'creation' do

    it 'entire process' do
      visit new_url_path
      within('form') do
        fill_in 'value', :with => new_url
      end
      click_button 'submit'
      expect(find('h1')).to have_content('Showing The Url')
      expect(page).to have_content(new_url)
      visit urls_path
      expect(find('.url .list')).to have_content(new_url)
    end

  end

end

