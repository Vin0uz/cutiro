FactoryBot.define do
  factory :cleaning do
    email { "spec@example.com" }
    teachers { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/teachers.csv") }
    payrolls { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/payrolls.csv") }
  end
end
