class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.integer :month
      t.integer :week
      t.boolean :finished
      t.references :goal

      t.timestamps
    end

    add_index :goals, :goal_id
  end
end
