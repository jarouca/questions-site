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
    visit "/questions/new"
    fill_in('Title', :with => 'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop')
    fill_in('Markdown', :with => %Q{### The purpose of this question is to find out how you are and to have minimum of 50 characters})
    click_button("Create Question")

    expect(page).to have_content("Question posted successfully")
    expect(page).to have_content("The purpose of this question is to find out how you are and to have minimum of 50 characters")
  end

  scenario "user submits an answer in markdown" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)

    visit "/questions"
    click_link "Why is the sky blue?"
    fill_in('Markdown', :with => %Q{### qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop})
    click_button('Submit Answer')

    expect(page).to have_content("Answer submitted")
    expect(page).to have_content("qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop")
  end
end
