class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :status, null: false, default: 0
      t.string :sport_name, null: false, index: true

      t.timestamps null: false
    end
  end
end
