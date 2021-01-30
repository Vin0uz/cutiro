require "rails_helper"

feature "Anyone goes to the new cleaning page" do
  scenario "and sees the right content" do
    visit new_cleaning_path

    expect(page).to have_content("Let's Go")
    expect(page).to have_content("Upload your teachers and payroll databases below")
  end

  scenario "and can fill the cleaning form" do
    visit new_cleaning_path
    stub_request(:get, ENV.fetch("CUTIRO_API_URL"))


    attach_file(:cleaning_teachers, File.join(Rails.root, "/spec/fixtures/teachers.csv"))
    attach_file(:cleaning_payrolls, File.join(Rails.root, "/spec/fixtures/payrolls.csv"))
    fill_in :cleaning_email, with: "admin@example.com"
    click_on "Send"

    expect(page).to have_current_path(root_path(success: true))
  end
end
