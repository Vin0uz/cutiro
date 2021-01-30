class DestroyFilesJob < ApplicationJob
  def perform(cleaning:)
    cleaning.teachers.purge
    cleaning.payrolls.purge
  end
end
