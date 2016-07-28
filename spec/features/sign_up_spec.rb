require_relative 'web_helpers'

feature "Sign up to the webpage" do
  scenario "When a user signs up, the user count increases by 1" do
    visit "/sign-up"
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "abcd1234")
    fill_in("confirmation", with: "abcd1234")
    expect{click_button("Create")}.to change{User.count}.by(1)
  end

  scenario "The page displays a welcome message to the new user" do
    valid_sign_in
    expect(page).to have_content("Welcome, example@gmail.com")
  end

  scenario "The email address for user in the DB is correct" do
    valid_sign_in
    expect(User.last.email).to eq "example@gmail.com"
  end

  scenario "Password must match the confirmation field" do
    visit "/sign-up"
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "abcd1234")
    fill_in("confirmation", with: "1234abcd")
    expect{click_button("Create")}.to change{User.count}.by(0)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content("Password and confirmation password do not match")
    expect(page).to have_field('email', with: 'example@gmail.com')
  end
end
