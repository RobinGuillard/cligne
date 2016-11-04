class CreateBlinks < ActiveRecord::Migration
  def change
    create_table :blinks do |t|
      t.string :status
      t.date :date

      t.timestamps null: false
    end
  end
end
