class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name, null: false, index: true, limit: 50
      t.integer :comparison_operator, null: false, default: 0

      t.timestamps null: false
    end
  end
end
