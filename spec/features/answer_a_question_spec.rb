require "rails_helper"

feature "answering a question" do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario "user successfully answers question" do
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: 1)

    visit "/questions"
    click_link "Why is the sky blue?"
    fill_in 'Body', with: 'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    click_button 'Submit Answer'

    expect(page).to have_content("Answer submitted")
  end

  scenario "user fills out form incorrectly" do
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: 1)

    visit "/questions"
    click_link "Why is the sky blue?"
    fill_in('Body', with: 'qwertyuiopqwertyuiopqwerty'
    click_button 'Submit Answer'

    expect(page).to have_content('Body is too short (minimum is 50 characters)')
  end
end
