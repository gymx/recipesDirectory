class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :course
      t.string :main_ingredient
      t.string :source
      t.text   :description
      t.text   :ingredients
      t.text   :directions
      t.string :prep_time
      t.string :cook_time
      t.string :total_time
      t.string :serving

      t.timestamps
    end
  end
end
