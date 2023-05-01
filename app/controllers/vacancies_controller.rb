class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancies::List.call
  end

  def show
    @vacancy = Vacancies::Show.call(params)
  end
end
