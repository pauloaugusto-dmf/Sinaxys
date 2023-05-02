module Users
  class Candidacies < ApplicationService
    def initialize(user)
      @user = user
      @vacancies_list = vacancies
      @errors = []
    end

    def call
      @candidacies = candidacies_json
    end

    def vacancies
      Vacancies::List.call
    end

    def candidacies_json
      @user.candidacies.map do |candidacy|
        {
          id: candidacy.id,
          vacancy: @vacancies_list.find { |vacancy| vacancy['id'] == candidacy.vacancy_id }
        }
      end
    end
  end
end
