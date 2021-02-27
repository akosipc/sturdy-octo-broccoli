class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
