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

  context 'creating posts when logged in' do

    before do
      visit('/')
      click_link('Sign Up')
      fill_in('Username', with: 'testname')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'prompts user to fill out a form, then displays the new post' do
      click_link ('New Post')
      fill_in 'Title', with: 'CP Test Title'
      fill_in 'Description', with: 'CP Test Description'
      click_button 'Create Post'
      expect(page).to have_content('CP Test Title')
      expect(page).to have_content('CP Test Description')
      expect(page).to have_content('testname')
      expect(current_path).to eq '/'
    end
  end

end