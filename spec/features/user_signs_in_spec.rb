require 'spec_helper'

feature 'User signs in', :js => true do
  scenario 'with valid email and password' do
    sign_in_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_in_with(email, password)
    visit user_session_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_on 'Sign in'
  end
end