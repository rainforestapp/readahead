class CreateLinkLists < ActiveRecord::Migration
  def change
    create_table :link_lists do |t|
      t.belongs_to :link, index: true, null: false
      t.belongs_to :list, index: true, null: false
      t.datetime :read_at

      t.timestamps
    end
  end
end
