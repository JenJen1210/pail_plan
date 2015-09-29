class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :likes
      t.boolean :incomplete
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
