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
      candidacies = []
      @user.candidacies.each do |candidacy|
        vacancy = @vacancies_list.find { |vacancy| vacancy['id'] == candidacy.vacancy_id }
        if vacancy.present?
          candidacies << {
            id: candidacy.id,
            vacancy: vacancy
          }
        end
      end

      candidacies
    end

  end
end
