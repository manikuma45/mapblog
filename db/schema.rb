ActiveRecord::Schema.define(version: 2020_04_02_074438) do

  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
