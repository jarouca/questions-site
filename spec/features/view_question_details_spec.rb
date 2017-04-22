require "rails_helper"

feature "user views a question's details" do
    # As a user
    # I want to view a question's details
    # So that I can effectively understand the question
    #
    # Acceptance Criteria
    #
    # - I must be able to get to this page from the questions index
    # - I must see the question's title
    # - I must see the question's description
  scenario "user views details" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)

    visit "/questions"
    click_link "Why is the sky blue?"
    expect(page).to have_content("Why is the sky blue?")
    expect(page).to have_content("Why isn't it orange or green?")
  end
end
