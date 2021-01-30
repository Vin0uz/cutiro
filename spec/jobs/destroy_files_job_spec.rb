require "rails_helper"

describe DestroyFilesJob do
  it "purges the attached files" do
    cleaning = FactoryBot.create(:cleaning,
      teachers: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/teachers.csv"),
      payrolls: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/payrolls.csv"),
      email: "test@example.com",
    )

    DestroyFilesJob.perform_now(cleaning: cleaning)

    expect(cleaning.teachers).not_to be_attached
    expect(cleaning.payrolls).not_to be_attached

    expect(cleaning.teachers.reload).to be_nil
    expect(cleaning.payrolls.reload).to be_nil
  end
end
