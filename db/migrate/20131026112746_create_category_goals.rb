class CreateCategoryGoals < ActiveRecord::Migration
  def change
    create_table :category_goals do |t|
      t.belongs_to :category
      t.belongs_to :goal

      t.timestamps
    end

    add_index :category_goals, [:category_id, :goal_id], unique: true
  end
end
