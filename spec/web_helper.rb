require 'spec_helper.rb'

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'joesweeny84@hotmail.com'
  fill_in :password, with: 'alex1'
  fill_in :password_confirmation, with: 'alex1'
  click_button 'Sign Up'
end

def sign_up_confirmation
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'joesweeny84@hotmail.com'
  fill_in :password, with: 'alex1'
  fill_in :password_confirmation, with: 'alex2'
  click_button 'Sign Up'
end
