class ChangeInColomnRecipes < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :text, :description
    change_column :recipes, :description, :text
  end
end
