class CreateFooBazs < ActiveRecord::Migration[6.1]
  def change
    create_table :foo_bazs do |t|
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
