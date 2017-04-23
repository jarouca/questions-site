require "rails_helper"
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last

feature "user views the answers for a question" do
  scenario "user views answers" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)
    first_answer = Answer.create(body: 'firstanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: first_user.id)
    second_answer = Answer.create(body: "secondnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop", question_id: first_question.id, user_id: first_user.id)

    visit "/questions"
    click_link "Why is the sky blue?"
    expect(page).to have_content('firstanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop')
    expect(page).to have_content("secondnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop")
  end
end
