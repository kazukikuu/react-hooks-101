class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.float :x
      t.float :y
      t.timestamp null: false
    end
  end
end
