class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :image
      t.belongs_to :user
      t.integer :rating
      t.belongs_to :book

      t.timestamps
    end
  end
end
