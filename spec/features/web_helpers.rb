def valid_sign_in
  visit "/sign-up"
  fill_in("email", with: "example@gmail.com")
  fill_in("password", with: "abcd1234")
  fill_in("confirmation", with: "abcd1234")
  click_button("Create")
end
