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
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error("API request failed: #{e.response}")
      nil
    rescue StandardError => e
      Rails.logger.error("Failed with error: #{e.message}")
      nil
    end
  end
end
