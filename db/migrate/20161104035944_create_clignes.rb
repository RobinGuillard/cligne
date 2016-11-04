class CreateClignes < ActiveRecord::Migration
  def change
    create_table :clignes do |t|
      t.string :status
      t.date :date

      t.timestamps null: false
    end
  end
end
