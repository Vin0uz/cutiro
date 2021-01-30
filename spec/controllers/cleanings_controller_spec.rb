require "rails_helper"

describe CleaningsController do
  include ActiveJob::TestHelper

  describe "#create" do
    after(:each) do
      clear_enqueued_jobs
    end

    it "should enqueue DestroyFilesJob" do
      stub_request(:get, ENV.fetch("CUTIRO_API_URL"))

      post(:create, params: {
        cleaning: {
          teachers: fixture_file_upload(File.join(Rails.root, "/spec/fixtures/teachers.csv")),
          payrolls: fixture_file_upload(File.join(Rails.root, "/spec/fixtures/payrolls.csv")),
          email: "test@example.com",
        },
      })

      cleaning = Cleaning.last

      expect(Cleaning.count).to eq(1)
      expect(DestroyFilesJob)
        .to have_been_enqueued
        .with(cleaning: cleaning)
    end

    it "should not enqueue DestroyFilesJob if files are not given" do
      post(:create, params: {
        cleaning: {
          email: "test@example.com",
        },
      })

      expect(response).to redirect_to(root_path(error: "creation"))
      expect(Cleaning.count).to eq(0)
      expect(DestroyFilesJob).not_to have_been_enqueued
    end
  end
end
