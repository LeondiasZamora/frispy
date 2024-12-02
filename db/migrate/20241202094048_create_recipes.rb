class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :fat
      t.integer :calories
      t.integer :sugar
      t.integer :preparation_time

      t.timestamps
    end
  end
end
