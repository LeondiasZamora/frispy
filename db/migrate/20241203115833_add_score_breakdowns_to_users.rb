class AddScoreBreakdownsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :charity_score, :integer
    add_column :users, :consumed_score, :integer
    add_column :users, :expired_score, :integer
  end
end
