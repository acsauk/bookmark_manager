feature 'Adding a user' do
  scenario 'adds new user and increases user count by 1' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, joesweeny84@hotmail.com'
    expect(User.first.email).to eq('joesweeny84@hotmail.com')
  end

  scenario 'password matching conflict' do
    expect { sign_up_confirmation }.to change(User, :count).by(0)
  end
end
