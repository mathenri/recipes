class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :url
      t.string :tags

      t.timestamps
    end
  end
end
