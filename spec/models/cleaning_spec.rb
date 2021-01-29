require "rails_helper"

describe Cleaning do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:payrolls) }
  it { should validate_presence_of(:teachers) }
end
