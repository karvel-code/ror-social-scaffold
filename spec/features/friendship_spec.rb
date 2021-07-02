require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  before :each do
    @user = User.create!(name: 'elvis', email: 'elvis@gmail.com', password: 'elvis123')
    @user2 = User.create!(name: 'leon', email: 'leon@gmail.com', password: 'leon123')
  end

  scenario 'user logs in and both their posts and their friends in the homepage' do
    visit root_path
    fill_in 'Email', with: 'elvis@gmail.com'
    fill_in 'Password', with: 'elvis123'
    click_button 'Log in'
    expect(page).to have_content('Recent posts')
  end

  scenario 'visits all users page' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'leon@gmail.com'
    fill_in 'Password', with: 'leon123'
    click_button 'Log in'
    visit users_path
    expect(page).to have_text('user')
    expect(page).to have_link('See Profile')
  end

  scenario 'sends an invite to friendship to pal' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'elvis@gmail.com'
    fill_in 'Password', with: 'elvis123'
    click_button 'Log in'
    visit users_path
    expect(page).to have_link('Send Friend Request')
    click_link 'Send Friend Request'
  end
end
