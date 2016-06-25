class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name, null: false, limit: 50
      t.string :code, null: false, limit: 50
      t.references :competition, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
