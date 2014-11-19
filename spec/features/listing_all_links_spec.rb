require 'spec_helper'

feature "User browses the list of links" do
  
  before(:each) {
    Link.create(:title => "Makers Academy", 
                :url => "http://wwww.makersacademy.com/")
  }

  scenario "when opening the homepage" do
    visit '/'
    expect(page).to have_content('Current Links')
    expect(page).to have_content("Makers Academy")
  end
end
