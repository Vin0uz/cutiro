class Cleaning < ApplicationRecord
  broadcasts_to ->(cleaning) { :cleaning }

  has_one_attached :payrolls
  has_one_attached :teachers

  validates_presence_of :email, :payrolls, :teachers
end
