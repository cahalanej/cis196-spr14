class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :User, index: true
      t.belongs_to :Post, index: true

      t.timestamps
    end
  end
end
