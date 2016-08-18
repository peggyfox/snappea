class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.string :category
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
