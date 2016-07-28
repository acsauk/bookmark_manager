def sign_in(email: "example@gmail.com",
            password: "abcd1234",
            confirmation: "abcd1234")

  visit "/sign-up"
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("confirmation", with: confirmation)
  click_button("Create")
end
