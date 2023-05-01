require 'rails_helper'
require 'webmock/rspec'

RSpec.describe '/vacancies', type: :request do
  let(:user) { create :user }

  describe 'GET /index' do
    before do
      response_body = File.read('spec/fixtures/vacancies_response.json')
      stub_request(:get, 'https://prod.api.sinaxys.com/v2/jobs')
        .to_return(status: 200, body: response_body)

      get '/vacancies', headers: headers_html
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns 200, OK' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    before do
      response_body = File.read('spec/fixtures/vacancy_response.json')
      stub_request(:get, 'https://prod.api.sinaxys.com/v2/jobs/5941')
        .to_return(status: 200, body: response_body)

      get '/vacancies/5941', headers: headers_html
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns 200, OK' do
      expect(response.status).to eq(200)
    end
  end
end
