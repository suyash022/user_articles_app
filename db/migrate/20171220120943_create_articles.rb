class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title

      t.timestamps
    end
  end
end
