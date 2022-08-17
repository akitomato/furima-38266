class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :commodity,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
