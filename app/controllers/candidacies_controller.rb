# rubocop: disable Rails/I18nLocaleTexts

class CandidaciesController < ApplicationController
  before_action :require_login, only: [:index, :show, :create]

  def index; end

  def show; end

  def create
    @candidacy = current_user.candidacies.new(canditacy_params)
    if @candidacy.save
      redirect_back fallback_location: root_path, notice: 'Candidacy was successfully created.'
    else
      flash[:alert] = @candidacy.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  private

  def canditacy_params
    params.permit(:vacancy_id)
  end

  def require_login
    return if current_user

    flash[:error] = 'You must be logged in to apply for a job'
    redirect_to new_user_session_path
  end
end

# rubocop: enable Rails/I18nLocaleTexts
