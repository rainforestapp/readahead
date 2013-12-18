class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false, limit: 2 ** 12

      t.timestamps
    end
  end
end
