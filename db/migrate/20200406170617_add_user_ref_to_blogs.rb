# frozen_string_literal: true

class AddUserRefToBlogs < ActiveRecord::Migration[5.2]
  def up
    add_reference :blogs, :user, foreign_key: true, null: false
  end

  def down
    add_reference :blogs, :user, foreign_key: false, null: true
  end
end
