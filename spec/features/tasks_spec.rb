require 'rails_helper'

feature 'Tasks' do
  scenario 'user can add tasks to a task list' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "New Task"
    fill_in "task_description", with: "Do laundry"

    two_days_from_now = 3.days.from_now.to_date
    select two_days_from_now.strftime("%Y"), from: "task_due_date_1i"
    select two_days_from_now.strftime("%B"), from: "task_due_date_2i"
    select two_days_from_now.strftime("%-d"), from: "task_due_date_3i"
    click_on "Create Task"

    # expect(page).to have_content("Do laundry")
    # expect(page).to have_content("Task was created successfully!")
    # expect(page).to have_content("2 days")

    click_on "Completed"
    expect(page).to have_no_content "Do laundry"
  end
end