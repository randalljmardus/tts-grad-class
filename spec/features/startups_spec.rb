require 'rails_helper'

describe "Startups", :type => :feature do
  
  let(:user){ create(:user) }
  
  before(:each) do
    create(:startup)
  end

  it "lets me view them" do
    visit startups_path 
    expect(page).to have_content 'Abbeydale'
  end
  
  it "lets me start to create one" do
    visit "/"
    click_link "Startups"
    expect(page).to have_link 'New Startup'
  end
  
  it "let me create one" do
    visit "/"
    click_link "Startups"
    click_link 'New Startup'
    within("#new_startup") do
      fill_in "Name", with: "AddShoppers"
      fill_in "Url", with: "http://www.addshoppers.com/"
      click_button 'Create Startup'
    end
    expect(page).to have_content("AddShoppers")
  end
end