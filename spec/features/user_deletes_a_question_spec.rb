require 'rails_helper'

# [ ] I must be able delete a question from the question edit page
# [ ] I must be able delete a question from the question details page
# [ ] All answers associated with the question must also be deleted

feature 'delete a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do

  scenario 'user successfully deletes a question' do
    visit new_question_path
    fill_in 'Title', with: "This is a test question and I hope to destroy it"
    fill_in 'Description', with: "this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative this is just unreasonably repetative "
    click_button 'Add Question'
    click_link 'Delete this question'
    expect(page).to have_content('Question deleted!')
    expect(page).to have_no_content("This is a test question and I hope to destroy it")
  end

end
