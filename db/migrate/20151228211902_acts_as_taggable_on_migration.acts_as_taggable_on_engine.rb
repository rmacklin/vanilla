# This migration comes from acts_as_taggable_on_engine (bboe combined)
class ActsAsTaggableOnMigration < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :taggings_count, default: 0, null: false
    end

    create_table :taggings do |t|
      t.references :tag, null: false

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, polymorphic: true, null: false
      t.references :tagger, polymorphic: true

      # Limit is created to prevent MySQL error on index
      # length for MyISAM table type: http://bit.ly/vgW2Ql
      t.string :context, limit: 128, null: false

      t.datetime :created_at, null: false
    end

    add_index :tags, :name, unique: true
    add_index :taggings,
              [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type],
              unique: true, name: 'taggings_idx'
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end
end
