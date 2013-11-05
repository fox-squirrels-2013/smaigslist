class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to  :category
      t.string      :title
      t.string      :description
      t.integer     :price
      t.string      :contact_email

      t.timestamps
    end
  end
end
