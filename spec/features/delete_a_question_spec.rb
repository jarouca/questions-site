require "rails_helper"
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted
  # - I will be directed to the root after deleting
feature "user deletes a question" do
  scenario "deletes a question from the question edit page" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)
    first_answer = Answer.create(body: 'firstanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: first_user.id)
    second_answer = Answer.create(body: 'secondnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: first_user.id)

    visit "/questions/#{first_question.id}"
    click_link "Edit Question"
    click_button "Delete Question"

    expect(page).to not_have_content("Why is the sky blue?")
  end

  scenario "deletes a question from the question details page" do
    first_user = User.create(provider: "github", uid: "3", username: "Yaz")
    first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)
    first_answer = Answer.create(body: 'firstanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: first_user.id)
    second_answer = Answer.create(body: 'secondnanswerqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop', question_id: first_question.id, user_id: first_user.id)

    visit "/questions/#{first_question.id}"
    click_button "Delete Question"

    expect(page).to not_have_content("Why is the sky blue?")
  end
end
