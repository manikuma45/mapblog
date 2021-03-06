# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
