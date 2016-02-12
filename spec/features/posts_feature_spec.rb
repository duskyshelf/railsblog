require 'rails_helper'

feature 'posts' do

  context 'posts have not been added' do

    scenario 'displays notification saying no posts added' do
      visit '/'
      expect(page).to have_content('No posts yet')
    end
  end



  context 'posts have been added' do
    before do
      Post.create(title: 'Post Title', description: 'Description Example', username: 'Person')
    end

    scenario 'display posts' do
      visit '/'
      expect(page).not_to have_content('No posts yet')
      expect(page).to have_content('Post Title')
      expect(page).to have_content('Description Example')
      expect(page).to have_content('Person')
    end
  end

end