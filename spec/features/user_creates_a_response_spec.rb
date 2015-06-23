require 'rails_helper'

# [x] I must be on the question detail page
# [x] I must provide a description that is at least 50 characters long
# [x] I must be presented with errors if I fill out the form incorrectly

feature 'respond to a question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do

  scenario 'user responds to a question' do
    visit question_path(1)
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    fill_in 'Description', with: "Fifty characters makes an answer yaaaaaaaaaaaaaaaayu"
    click_button "Add Response"
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    expect(page).to have_content("Fifty characters makes an answer yaaaaaaaaaaaaaaaayu")
  end

  scenario 'user provides an invalid description' do
    visit question_path(1)
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    fill_in 'Description', with: "Tooshort!"
    click_button "Add Response"
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    expect(page).to have_no_content("Tooshort!")

  end
end
