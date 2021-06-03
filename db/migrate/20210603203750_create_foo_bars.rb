class CreateFooBars < ActiveRecord::Migration[6.1]
  def change
    create_table :foo_bars do |t|

      t.timestamps
    end
  end
end
