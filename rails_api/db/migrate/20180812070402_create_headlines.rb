class CreateHeadlines < ActiveRecord::Migration[5.2]
  def change
    create_table :headlines do |t|
      t.text :title
      t.string :label
      t.references :school_blog, foreign_key: true

      t.timestamps
    end
  end
end
