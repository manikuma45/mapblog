class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :blog, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
