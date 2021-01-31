class CleaningsController < ApplicationController
  def show
    @cleaning = Cleaning.find(session[:cleaning_id] || 3)
  end

  def new
    @cleaning = Cleaning.new
  end

  def create
    cleaning = Cleaning.create(cleaning_params)
    if cleaning.persisted?
      DestroyFilesJob.set(wait: 30.minutes).perform_later(cleaning: cleaning)
      session[:cleaning_id] = cleaning.id

      response = MatcherApi.new.call(params: matcher_api_params(cleaning))
      if response.code == 200
        redirect_to cleaning_path
      else
        redirect_to root_path(error: response.code)
      end
    else
      redirect_to root_path(error: "creation")
    end
  end

  def update
    cleaning = Cleaning.find(cleaning_update_params[:id])
    if cleaning.update(result_url: cleaning_update_params[:result_url])
      render status: 200
    else
      render status: 500
    end
  end

  private
  def cleaning_params
    params.require(:cleaning).permit(:email, :payrolls, :teachers)
  end

  def cleaning_update_params
    params.require(:cleaning).permit(:id, :result_url)
  end

  def matcher_api_params(cleaning)
    {
      email: cleaning.email,
      payrolls_url: url_for(cleaning.payrolls),
      teachers_url: url_for(cleaning.teachers),
      batch_id: cleaning.id,
    }
  end
end
