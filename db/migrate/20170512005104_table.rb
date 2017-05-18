class Table < ActiveRecord::Migration[5.0]
  def change
    create_table "chatrooms", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "title"
      t.integer  "user_id"
  end
end
end
