# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121023213804) do

  create_table "client_balances", :force => true do |t|
    t.integer  "client_id"
    t.integer  "promotion_id"
    t.integer  "balance"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "client_balances", ["client_id"], :name => "index_client_balances_on_client_id"
  add_index "client_balances", ["promotion_id"], :name => "index_client_balances_on_promotion_id"

  create_table "clients", :force => true do |t|
    t.string   "cpf"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["cpf"], :name => "index_clients_on_cpf"
  add_index "clients", ["user_id"], :name => "index_clients_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "employees", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "employees", ["company_id"], :name => "index_employees_on_company_id"
  add_index "employees", ["user_id"], :name => "index_employees_on_user_id"

  create_table "exchanges", :force => true do |t|
    t.integer  "promotion_id"
    t.integer  "client_id"
    t.string   "observation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "exchanges", ["client_id"], :name => "index_exchanges_on_client_id"
  add_index "exchanges", ["promotion_id"], :name => "index_exchanges_on_promotion_id"

  create_table "points", :force => true do |t|
    t.integer  "client_id"
    t.decimal  "value",        :precision => 10, :scale => 0
    t.integer  "points"
    t.integer  "promotion_id"
    t.integer  "company_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "points", ["client_id"], :name => "index_points_on_client_id"
  add_index "points", ["company_id"], :name => "index_points_on_company_id"
  add_index "points", ["promotion_id"], :name => "index_points_on_promotion_id"

  create_table "promotion_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "promotions", :force => true do |t|
    t.string   "name"
    t.date     "initial_date"
    t.date     "ending_date"
    t.integer  "points"
    t.decimal  "value",                 :precision => 10, :scale => 0
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.integer  "promotion_category_id"
    t.integer  "points_to_exchange"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "promotions", ["company_id"], :name => "index_promotions_on_company_id"
  add_index "promotions", ["promotion_category_id"], :name => "index_promotions_on_promotion_category_id"
  add_index "promotions", ["user_id"], :name => "index_promotions_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
    t.string   "temporary_password"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
