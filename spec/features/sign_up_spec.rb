require_relative 'web_helpers'

feature "Sign up to the webpage" do
  scenario "When a user signs up, the user count increases by 1" do
    expect{ sign_in }.to change{ User.count }.by(1)
  end

  scenario "The page displays a welcome message to the new user" do
    sign_in
    expect(page).to have_content("Welcome, example@gmail.com")
  end

  scenario "The email address for user in the DB is correct" do
    sign_in
    expect(User.last.email).to eq "example@gmail.com"
  end

  scenario "Password must match the confirmation field" do
    expect{ sign_in(confirmation: "1234abcd") }.to change{User.count}.by(0)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content("Password and confirmation password do not match")
    expect(page).to have_field('email', with: 'example@gmail.com')
  end

  scenario "User cannot sign-up with a blank email address" do
    expect { sign_in(email: nil) }.to change{ User.count }.by(0)
  end

  scenario "User cannot sign-up with an invalid email address" do
    expect { sign_in(email: "invalid@email") }.to change{ User.count }.by(0)
  end

end
