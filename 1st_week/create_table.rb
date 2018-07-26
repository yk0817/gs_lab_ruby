require './common'

class CreateHeadlines < ActiveRecord::Migration[5.0]
  create_table :headlines do |t|
    t.column :title, :text
    t.column :label, :string
    t.timestamps
  end
end
