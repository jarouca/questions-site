require "rails_helper"

feature "user views recently posted questions" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario "user views recently posted questions" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)

    visit "/questions"
    expect(page).to have_content("Why is the sky blue?")
  end
end
