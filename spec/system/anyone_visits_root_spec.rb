require "rails_helper"

feature "Anyone visits the root of the website" do
  scenario "and sees the right content" do
    visit root_path

    expect(page).to have_content("Keep Ghost Teachers out of education")
    expect(page).to have_content("An easy-to-use solution to synchronize education and payroll teacher databases")
  end

  scenario "and can access the new cleaning page" do
    visit root_path

    click_on "Clean my data now!"

    expect(page).to have_current_path(new_cleaning_path)
  end
end
