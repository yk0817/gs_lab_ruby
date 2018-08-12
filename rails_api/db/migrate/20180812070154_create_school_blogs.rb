class CreateSchoolBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :school_blogs do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
