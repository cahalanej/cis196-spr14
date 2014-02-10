class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :category
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
