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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_160_209_103_012) do
  create_table 'active_admin_comments', force: :cascade do |t|
    t.string   'namespace',     limit: 191
    t.text     'body',          limit: 65_535
    t.string   'resource_id',   limit: 191,   null: false
    t.string   'resource_type', limit: 191,   null: false
    t.integer  'author_id',     limit: 4
    t.string   'author_type',   limit: 191
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'active_admin_comments', %w(author_type author_id), name: 'index_active_admin_comments_on_author_type_and_author_id', using: :btree
  add_index 'active_admin_comments', ['namespace'], name: 'index_active_admin_comments_on_namespace', using: :btree
  add_index 'active_admin_comments', %w(resource_type resource_id), name: 'index_active_admin_comments_on_resource_type_and_resource_id', using: :btree

  create_table 'admin_users', force: :cascade do |t|
    t.string   'email',                  limit: 191, default: '', null: false
    t.string   'encrypted_password',     limit: 191, default: '', null: false
    t.string   'reset_password_token',   limit: 191
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', limit: 4, default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip',     limit: 191
    t.string   'last_sign_in_ip',        limit: 191
    t.datetime 'created_at',                                      null: false
    t.datetime 'updated_at',                                      null: false
    t.string   'name',                   limit: 191
    t.string   'avatar_file_name',       limit: 191
    t.string   'avatar_content_type',    limit: 191
    t.integer  'avatar_file_size',       limit: 4
    t.datetime 'avatar_updated_at'
    t.string   'info',                   limit: 191
    t.string   'vk',                     limit: 191
    t.string   'fb',                     limit: 191
    t.string   'twitter',                limit: 191
    t.string   'instagram',              limit: 191
    t.string   'rss',                    limit: 191
    t.string   'occupy',                 limit: 191
    t.boolean  'is_journalist'
  end

  add_index 'admin_users', ['email'], name: 'index_admin_users_on_email', unique: true, using: :btree
  add_index 'admin_users', ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true, using: :btree

  create_table 'attachinary_files', force: :cascade do |t|
    t.integer  'attachinariable_id',   limit: 4
    t.string   'attachinariable_type', limit: 191
    t.string   'scope',                limit: 191
    t.string   'public_id',            limit: 191
    t.string   'version',              limit: 191
    t.integer  'width',                limit: 4
    t.integer  'height',               limit: 4
    t.string   'format',               limit: 191
    t.string   'resource_type',        limit: 191
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'attachinary_files', %w(attachinariable_type attachinariable_id scope), name: 'by_scoped_parent', using: :btree

  create_table 'ckeditor_assets', force: :cascade do |t|
    t.string   'data_file_name',    limit: 191, null: false
    t.string   'data_content_type', limit: 191
    t.integer  'data_file_size',    limit: 4
    t.integer  'assetable_id',      limit: 4
    t.string   'assetable_type',    limit: 30
    t.string   'type',              limit: 30
    t.integer  'width',             limit: 4
    t.integer  'height',            limit: 4
    t.datetime 'created_at',                    null: false
    t.datetime 'updated_at',                    null: false
  end

  add_index 'ckeditor_assets', %w(assetable_type assetable_id), name: 'idx_ckeditor_assetable', using: :btree
  add_index 'ckeditor_assets', %w(assetable_type type assetable_id), name: 'idx_ckeditor_assetable_type', using: :btree

  create_table 'comments', force: :cascade do |t|
    t.text     'text',             limit: 65_535
    t.integer  'commentable_id',   limit: 4
    t.string   'commentable_type', limit: 191
    t.string   'ancestry',         limit: 191
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.string   'name',             limit: 191
    t.string   'image',            limit: 191
  end

  create_table 'pages', force: :cascade do |t|
    t.string   'header',             limit: 191
    t.text     'body',               limit: 65_535
    t.boolean  'main'
    t.datetime 'created_at',                       null: false
    t.datetime 'updated_at',                       null: false
    t.string   'slug',               limit: 191
    t.string   'theme',              limit: 191
    t.string   'category',           limit: 191
    t.string   'thumb_file_name',    limit: 191
    t.string   'thumb_content_type', limit: 191
    t.integer  'thumb_file_size',    limit: 4
    t.datetime 'thumb_updated_at'
    t.string   'preview', limit: 191
    t.datetime 'published_at'
  end

  create_table 'pages_admin_users', force: :cascade do |t|
    t.integer  'page_id',       limit: 4
    t.integer  'admin_user_id', limit: 4
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  create_table 'polls', force: :cascade do |t|
    t.string   'topic', limit: 191
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'punches', force: :cascade do |t|
    t.integer  'punchable_id',   limit: 4,              null: false
    t.string   'punchable_type', limit: 20,             null: false
    t.datetime 'starts_at',                             null: false
    t.datetime 'ends_at',                               null: false
    t.datetime 'average_time',                          null: false
    t.integer  'hits', limit: 4, default: 1, null: false
  end

  add_index 'punches', ['average_time'], name: 'index_punches_on_average_time', using: :btree
  add_index 'punches', %w(punchable_type punchable_id), name: 'punchable_index', using: :btree

  create_table 'taggings', force: :cascade do |t|
    t.integer  'tag_id',        limit: 4
    t.integer  'taggable_id',   limit: 4
    t.string   'taggable_type', limit: 191
    t.integer  'tagger_id',     limit: 4
    t.string   'tagger_type',   limit: 191
    t.string   'context',       limit: 128
    t.datetime 'created_at'
  end

  add_index 'taggings', %w(tag_id taggable_id taggable_type context tagger_id tagger_type), name: 'taggings_idx', unique: true, using: :btree
  add_index 'taggings', %w(taggable_id taggable_type context), name: 'index_taggings_on_taggable_id_and_taggable_type_and_context', using: :btree

  create_table 'tags', force: :cascade do |t|
    t.string  'name',           limit: 255
    t.integer 'taggings_count', limit: 4, default: 0
  end

  add_index 'tags', ['name'], name: 'index_tags_on_name', unique: true, using: :btree

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  limit: 191, default: '', null: false
    t.string   'encrypted_password',     limit: 191, default: '', null: false
    t.string   'reset_password_token',   limit: 191
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', limit: 4, default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip',     limit: 191
    t.string   'last_sign_in_ip',        limit: 191
    t.datetime 'created_at',                                      null: false
    t.datetime 'updated_at',                                      null: false
    t.string   'provider',               limit: 191
    t.string   'uid',                    limit: 191
    t.string   'name',                   limit: 191
    t.string   'image',                  limit: 191
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['provider'], name: 'index_users_on_provider', using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  add_index 'users', ['uid'], name: 'index_users_on_uid', using: :btree

  create_table 'vote_options', force: :cascade do |t|
    t.string   'title',      limit: 191
    t.integer  'poll_id',    limit: 4
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  add_index 'vote_options', ['poll_id'], name: 'index_vote_options_on_poll_id', using: :btree

  create_table 'votes', force: :cascade do |t|
    t.integer  'user_id',        limit: 4
    t.integer  'vote_option_id', limit: 4
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  add_index 'votes', ['user_id'], name: 'index_votes_on_user_id', using: :btree
  add_index 'votes', %w(vote_option_id user_id), name: 'index_votes_on_vote_option_id_and_user_id', unique: true, using: :btree
  add_index 'votes', ['vote_option_id'], name: 'index_votes_on_vote_option_id', using: :btree

  add_foreign_key 'vote_options', 'polls'
  add_foreign_key 'votes', 'users'
  add_foreign_key 'votes', 'vote_options'
end
