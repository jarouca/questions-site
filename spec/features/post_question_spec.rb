require "rails_helper"

feature "user posts a question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 20 characters long
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "user successfully posts a question" do
    visit "/questions/new"
    fill_in 'Title', with: 'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    fill_in 'Description', with:  'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    click_button("Create Question")

    expect(page).to have_content("Question posted successfully")
  end

  scenario "title is too short" do
    visit "/questions/new"
    fill_in 'Title', with: 'qwertyuiopqwertyuio'
    fill_in 'Description', with: 'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    click_button("Create Question")

    expect(page).to have_content('Title is too short (minimum is 20 characters)')
  end

  scenario "description is too short" do
    visit "/questions/new"
    fill_in 'Title', with: 'qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiop'
    fill_in 'Description', with: 'qwertyuiopqwertyuio'
    click_button "Create Question"

    expect(page).to have_content('Description is too short (minimum is 50 characters)')
  end
end
