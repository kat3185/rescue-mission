require 'rails_helper'

# [ ] I must provide valid information
# [ ] I must be presented with errors if I fill out the form incorrectly
# [ ] I must be able to get to the edit page from the question details page

feature 'user edits a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  scenario 'user edits a question with valid information' do
    visit question_path(1)
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    click_link 'Edit this question'
    fill_in 'Title', with: 'Wow this is really long!!! Kind of silly for a title test'
    click_button 'Submit Changes'
    expect(page).to have_content("test")
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
  end

  scenario 'user edits a question with invalid information' do
    visit question_path(1)
    expect(page).to have_content("Wow this is really long!!! Kind of silly for a title")
    click_link 'Edit this question'
    fill_in 'Title', with: ' test'
    click_button 'Submit Changes'
    expect(page).to have_no_content("test")
    expect(page).to have_content("Title must be 40 characters, description must be 150")

  end

end
