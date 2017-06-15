require "rails_helper"
# As a user
# I want to mark an answer as the best answer
# So that others can quickly find the answer
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must be able mark an answer as the best
# - I must see the "best" answer above all other answers in the answer list
feature "user marks an answer as best answer" do
  scenario "user marks an answer as best answer" do
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: 1)
    first_answer = Answer.create(body: 'firstanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: 1)
    # second_answer = Answer.create(body: "secondnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop", question_id: first_question.id, user_id: first_user.id)
    # third_answer = Answer.create(body: "thirdnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop", question_id: first_question.id, user_id: first_user.id)
    visit "/questions"
    click_link "Why is the sky blue?"
    click_link "Mark as best answer"
    first_answer.reload
    expect(first_answer.best_answer).to eq(true)
  end
end
