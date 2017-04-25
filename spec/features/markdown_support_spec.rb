require "rails_helper"

feature "markdown support for questions and answers" do
  # As a user
  # I want to write my questions and answers with markdown
  # So I can easily format my questions and answers
  #
  # Acceptance Criteria
  #
  # - I can write my questions and answers using markdown syntax
  # - Questions and answers, when shown, should be the HTML rendered from the
  # markdown
  scenario "user submits a question in markdown" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "How are you?", description: %Q{### The purpose of this question is to find out how you are}, user_id: first_user.id)

    visit "/questions"
    click_link "Why is the sky blue?"
    expect(page).to have_content("Why is the sky blue?")
    expect(page).to have_content("Why isn't it orange or green?")
  end

  scenario "user submits an answer in markdown" do

  end
end
