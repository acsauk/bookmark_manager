
feature "adding tags" do
  scenario "can add a tag" do
    visit "/links/new"
    fill_in("title", with: "Google")
    fill_in("url", with: "http://www.google.com")
    fill_in("Tag", with: "Search")
    click_button("Submit")

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content("Search")
    end
  end

end
