class CleaningsController < ApplicationController
  def new
    @cleaning = Cleaning.new
  end

  def create
    cleaning = Cleaning.create(cleaning_params)
    if cleaning.persisted?
      DestroyFilesJob.set(wait: 30.minutes).perform_later(cleaning: cleaning)
      redirect_to root_path
    else
      raise "Problem in the creation"
    end
  end

  private
  def cleaning_params
    params.require(:cleaning).permit(:email, :payrolls, :teachers)
  end
end
