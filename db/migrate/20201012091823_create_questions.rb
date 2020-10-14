class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :pri
      t.string :question
      t.string :teaming_stages
      t.integer :appears
      t.integer :frequency
      t.string :question_type
      t.boolean :is_required
      t.string :conditions
      t.references :role, foreign_key: true
      t.references :mapping, foreign_key: true

      t.timestamps
    end
  end
end
