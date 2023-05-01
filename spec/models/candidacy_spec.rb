# == Schema Information
#
# Table name: candidacies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  vacancy_id :bigint           not null
#
# Indexes
#
#  index_candidacies_on_user_id                 (user_id)
#  index_candidacies_on_user_id_and_vacancy_id  (user_id,vacancy_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Candidacy, type: :model do
  subject(:user) { create :user }
  subject(:candidacy) { build :candidacy, vacancy_id: 1234, user: user }
  subject(:candidacy_two) { build :candidacy, user: user }

  describe 'associations' do
    it { expect(belong_to(:user)) }
  end

  describe 'validations' do
    describe 'presence of' do
      it { should validate_presence_of(:vacancy_id) }
    end

    it 'is valid with valid attributes' do
      expect(candidacy).to be_valid
    end

    it 'is not valid with invalid vacancy_id' do
      candidacy.vacancy_id = 'teste'
      expect(candidacy).to_not be_valid
    end

    it 'is not valid with repeated vacancy_id' do
      candidacy.save
      candidacy_two.vacancy_id = 1234
      expect(candidacy_two).to_not be_valid
    end

    it 'is valid with different vacanct_id' do
      candidacy.save
      candidacy_two.vacancy_id = 4321
      expect(candidacy_two).to be_valid
    end
  end
end
