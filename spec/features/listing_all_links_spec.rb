require 'spec_helper'

feature "User browses the ist of links" do
  
  before(:each) {
    Link.create(:url => "http://wwww.makersacademy.com",
                :title => "Makers Academy")
  }

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content("Makers Academy")
  end
end