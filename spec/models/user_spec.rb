# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  name                    :string           not null
#  professional_experience :text
#  remember_created_at     :datetime
#  reset_password_sent_at  :datetime
#  reset_password_token    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }

  describe 'validations' do
    describe 'presence of' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:name) }
    end

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'it not valid with invalid password' do
      user.password = '45'
      expect(user).to_not be_valid
    end

    it 'it not valid with invalid email' do
      user.email = 'teste_email'
      expect(user).to_not be_valid
    end
  end
end
