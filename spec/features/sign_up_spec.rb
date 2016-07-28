feature "Sign up to the webpage" do
  scenario "When a user signs up, the user count increases by 1" do
    visit "/sign-up"
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "abcd1234")
    expect{click_button("Create")}.to change{User.count}.by(1)
  end

  scenario "The page displays a welcome message to the new user" do
    visit "/sign-up"
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "abcd1234")
    click_button("Create")
    expect(page).to have_content("Welcome, example@gmail.com")
  end

  scenario "The email address for user in the DB is correct" do
    visit "/sign-up"
    fill_in("email", with: "example@gmail.com")
    fill_in("password", with: "abcd1234")
    click_button("Create")
    expect(User.last.email).to eq "example@gmail.com"
  end
end
