require 'rails_helper'

RSpec.describe '/candidacies', type: :request do
  let(:user) { create :user }

  describe 'POST /create' do
    context 'with user logged in' do
      before(:each) do
        sign_in user
        post '/candidacies', params: {
          vacancy_id: 5941
        }, headers: headers_form_data
      end

      it 'creates a new Candidacy' do
        expect change(Candidacy, :count).by(1)
      end
    end

    context 'with user not logged in' do
      before(:each) do
        post '/candidacies', params: {
          vacancy_id: 5941
        }, headers: headers_form_data
      end

      it 'not creates a new Candidacy' do
        expect change(Candidacy, :count).by(0)
      end
    end
  end
end
