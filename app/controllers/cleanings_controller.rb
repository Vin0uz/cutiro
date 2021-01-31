class CleaningsController < ApplicationController

  def show
    @cleaning = session[:cleaning_id]
  end

  def new
    @cleaning = Cleaning.new
  end

  def create
    cleaning = Cleaning.create(cleaning_params)
    if cleaning.persisted?
      DestroyFilesJob.set(wait: 30.minutes).perform_later(cleaning: cleaning)
      session[:cleaning_id] = cleaning.id

      response = MatcherApi.new.call(email: cleaning.email, payrolls_url: url_for(cleaning.payrolls), teachers_url: url_for(cleaning.teachers))

      if response.code == "200"
        redirect_to root_path(success: true)
      else
        redirect_to root_path(error: response.code)
      end
    else
      redirect_to root_path(error: "creation")
    end
  end

  private
  def cleaning_params
    params.require(:cleaning).permit(:email, :payrolls, :teachers)
  end
end
