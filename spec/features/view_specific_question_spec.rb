require 'rails_helper'

# - [x] I must be able to get to this page from the questions index
# - [x] I must see the question's title
# - [x] I must see the question's description

feature 'view specific question', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do
  scenario 'click on question to visit show page' do
    visit root_path
    click_link "Wow this is really long!!! Kind of silly for a title, second"
    expect(page).to have_content(Question.second.description)
  end


end
