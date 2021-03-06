require "rails_helper"
feature "edit a question" do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates
  #
  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page
  scenario "successfully edit a question" do
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: 1)

    visit "/questions/#{first_question.id}"
    click_link "Edit Question"
    fill_in 'Title', with:  'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    fill_in 'Description', with:  'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    click_button "Update Question"

    expect(page).to have_content("Question edited successfully")
  end

  scenario "unsuccessfully edit a question" do
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: 1)

    visit "/questions/#{first_question.id}"
    click_link "Edit Question"
    fill_in 'Title', with: ""
    fill_in 'Description', with: ""
    click_button "Update Question"
    expect(page).to have_content('Title is too short (minimum is 20 characters)')
    expect(page).to have_content('Description is too short (minimum is 50 characters)')
  end
end
