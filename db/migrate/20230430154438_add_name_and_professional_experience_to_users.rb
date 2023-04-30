class AddNameAndProfessionalExperienceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :professional_experience, :text
  end
end
