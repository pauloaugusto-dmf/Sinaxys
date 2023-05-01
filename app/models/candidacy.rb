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
class Candidacy < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :vacancy_id, uniqueness: { scope: :user_id }, numericality: true
  end
end
