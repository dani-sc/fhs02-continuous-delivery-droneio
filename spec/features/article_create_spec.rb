require "rails_helper"

RSpec.describe "create article process", :type => :feature do
  it "creates an article" do
    visit '/articles'
    click_link 'New Article'
    fill_in 'Title', with: 'test title'
    fill_in 'Body', with: 'test body'
    click_button 'Create Article'

    expect(page).to have_content 'Article was successfully created.'
    expect(page).to have_content 'Title: test title'
    expect(page).to have_content 'Body: test body'
  end
end
