class ChangeInstructionsToString < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :instructions, :string
  end
end
