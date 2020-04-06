class AddColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :lat, :float, null: false
    add_column :blogs, :lng, :float, null: false
  end
end
