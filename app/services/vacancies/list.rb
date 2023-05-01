require 'rest-client'

module Vacancies
  class List < ApplicationService
    def initialize
      @api_url = 'https://prod.api.sinaxys.com/v2/jobs'
      @errors = []
    end

    def call
      response = RestClient.get(@api_url)
      JSON.parse(response.body)
    end
  end
end
