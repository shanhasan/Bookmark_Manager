require 'spec_helper'

feature "User browses the list of links" do
  
  before(:each) {
    Link.create(:title => "Makers Academy", 
                :url => "http://wwww.makersacademy.com/",
                :tags => [Tag.first_or_create(:text => 'education')])
    Link.create(:title => "Google",
                :url => "http://www.google.co.uk",
                :tags => [Tag.first_or_create(:text => 'search')])
    Link.create(:title => "Bing",
                :url => "htt[://www.bing.com",
                :tags => [Tag.first_or_create(:text => 'search')])
    Link.create(:title => "code.org",
                :url => "http://www.code.org",
                :tags => [Tag.first_or_create(:text => 'education')])
  }

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content("Makers Academy")
  end

  scenario "filter by a tag" do
    visit '/tags/search'
    expect(page).not_to have_content("Makers Academy")
    expect(page).not_to have_content("Code.org")
    expect(page).to have_content("Google")
    expect(page).to have_content("Bing")
  end
end
