require 'rails_helper'

# - [x] I must see the title of each question
# - [x] I must see questions listed in order, most recently posted first

feature 'view questions list', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  scenario 'view question index, ordered most recent first' do
    visit root_path
    expect(page).to have_content(Question.first.title)
    expect(page).to have_content(Question.last.title)
  end

end
