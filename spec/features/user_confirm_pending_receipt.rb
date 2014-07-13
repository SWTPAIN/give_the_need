require 'rails_helper'

feature 'User reuqests a post' do
  scenario 'user successfully requestsa a post' do
    alice = Fabricate(:user)
    bob = Fabricate(:user)
    post = Fabricate(:post, user: bob)
    visit '/users/sign_in'
    fill_in 'Email', with: alice.email
    fill_in 'Password', with: alice.password
    click_button 'Sign in'
    click_link('Request')
    fill_in 'request_body', with: 'I want this one.'
    click_button 'Submit'
    expect(page).to have_content "I want this one"
    click_link 'Account'
    expect(page).to have_content '1 Requests'
  end
end