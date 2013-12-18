class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user, index: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
