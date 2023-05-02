class CandidaciesController < ApplicationController
  before_action :require_login, only: :create

  def create
    @candidacy = current_user.candidacies.new(canditacy_params)
    if @candidacy.save
      redirect_to root_url, notice: t('controller.notice.candidacy_was_successfully_created')
    else
      redirect_to root_url, alert: @candidacy.errors.full_messages
    end
  end

  private

  def canditacy_params
    params.permit(:vacancy_id)
  end

  def require_login
    return if current_user

    redirect_to new_user_session_path, alert: t('controller.error.you_must_be_logged_in_to_apply_for_a_job')
  end
end
