# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_11_132134) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dataset_classes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_dataset_classes_on_dataset_id"
  end

  create_table "datasets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "goal"
    t.string "folder_path"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_datasets_on_customer_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file_path"
    t.integer "dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_images_on_dataset_id"
  end

  create_table "labels", force: :cascade do |t|
    t.float "x_pos"
    t.float "y_pos"
    t.integer "user_id"
    t.integer "dataset_class_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_class_id"], name: "index_labels_on_dataset_class_id"
    t.index ["image_id"], name: "index_labels_on_image_id"
    t.index ["user_id"], name: "index_labels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
