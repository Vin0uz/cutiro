require "rails_helper"

feature "Anyone goes to the new cleaning page" do
  scenario "and sees the right content" do
    visit new_cleaning_path

    expect(page).to have_content("Let's Go")
    expect(page).to have_content("Upload your teachers and payroll databases below")
  end

  scenario "and can fill the cleaning form" do
    visit new_cleaning_path

    attach_file("teachers", File.join(Rails.root, "/spec/fixtures/teachers.csv"))
    attach_file("payrolls", File.join(Rails.root, "/spec/fixtures/payrolls.csv"))

    click_on "Send"

    expect(page).to have_current_path(root_path)
  end
end
