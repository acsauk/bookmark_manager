feature "Visiting the webpage" do
  scenario "you can see a list of links" do
    @tag = Tag.create(:name => 'education')
    @link= Link.create(:title => 'Makers Academy', :url => "http://www.makersacademy.com")
    @link.tags << @tag
    @link.save

    visit "/links"
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario "can see only filtered links by tag" do
    @tag = Tag.create(:name => 'education')
    @link= Link.create(:title => 'Makers Academy', :url => "http://www.makersacademy.com")
    @link.tags << @tag
    @link.save

    @tag = Tag.create(:name => 'bubbles')
    @link= Link.create(:title => 'Google', :url => "http://www.google.com")
    @link.tags << @tag
    @link.save

    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])

    visit "/tags/bubbles"
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to_not have_content('Makers Academy')
    end
  end

end
