require 'rails_helper'

# - [x] I must provide a title that is at least 40 characters long
# - [x] I must provide a description that is at least 150 characters long
# - [x] I must be presented with errors if I fill out the form incorrectly

feature 'post a new question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  scenario 'post a new question' do
    visit new_question_path
    fill_in 'Title', with: "This is a test question so I really hope this works"
    fill_in 'Description', with: "this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative "
    click_button 'Add Question'
    expect(page).to have_content("Your question was submitted.")
    expect(page).to have_content("This is a test question so I really hope this works")
  end

  scenario 'try to post an invalid question' do
    visit new_question_path
    fill_in 'Title', with: "Failure"
    fill_in 'Description', with: "Sheesh"
    click_button 'Add Question'
    expect(page).to have_content('Title must be 40 characters, description must be 150.')
  end

end
