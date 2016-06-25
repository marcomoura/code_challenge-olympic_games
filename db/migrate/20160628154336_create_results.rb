class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :athlete_code, index: true, null: false
      t.integer :score, null: false, default: 0

      t.timestamps null: false
    end
  end
end
