require 'rails_helper'

feature 'homepage' do
  context 'on load' do
    scenario "contains the title 'Blog'" do
      visit '/'
      expect(page).to have_content 'Blog'
    end
  end

end