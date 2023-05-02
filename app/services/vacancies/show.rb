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
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error("API request failed: #{e.response}")
      nil
    rescue StandardError => e
      Rails.logger.error("Failed with error: #{e.message}")
      nil
    end
  end
end
