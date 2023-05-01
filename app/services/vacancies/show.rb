require 'rest-client'

module Vacancies
  class Show < ApplicationService
    def initialize(params)
      @api_url = "https://prod.api.sinaxys.com/v2/jobs/#{params['id']}"
      @errors = []
    end

    def call
      response = RestClient.get(@api_url)
      JSON.parse(response.body)
    end
  end
end
