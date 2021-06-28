class CreateSideEffectsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :side_effects do |t|
      t.references :study, foreign_key: true
      t.text :side_effect
      t.timestamps
    end
  end
end
