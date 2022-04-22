require 'rails_helper'


RSpec.feature "Vendors", type: :feature do
  scenario "vendor login"do
    vendor = create(:user , :vendor ,password: "654321",)
    visit "users/sign_in"
    fill_in "Account", with: vendor.username
    fill_in "Password", with: "654321"
    click_button "登入"
    expect(page).to have_text("登入成功")  
  end
  
  
  # scenario "vendor can't create resume" do
  #   visit "./resumes/new"

  #   cclick_button "QQ"
  # end
end
