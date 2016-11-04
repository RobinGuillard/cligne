class CreateCligneurs < ActiveRecord::Migration
  def change
    create_table :cligneurs do |t|
      t.string :user_name
      t.references :cligne, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
