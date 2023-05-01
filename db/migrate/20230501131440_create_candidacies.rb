class CreateCandidacies < ActiveRecord::Migration[7.0]
  def change
    create_table :candidacies do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :vacancy_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :candidacies, [:user_id, :vacancy_id], unique: true
  end
end
