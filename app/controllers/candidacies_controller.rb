class CandidaciesController < ApplicationController
  before_action :require_login, only: :create

  def create
    @candidacy = current_user.candidacies.new(canditacy_params)
    if @candidacy.save
      redirect_to root_url, notice: t('controller.notice.candidacy_was_successfully_created')
    else
      flash[:alert] = @candidacy.errors.full_messages
      redirect_to root_url
    end
  end

  private

  def canditacy_params
    params.permit(:vacancy_id)
  end

  def require_login
    return if current_user

    flash[:error] = t('controller.error.you_must_be_logged_in_to_apply_for_a_job')
    redirect_to new_user_session_path
  end
end
