class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :number
      t.string :name
      t.string :duration
      t.string :start
      t.string :finish
      t.integer :predecessors
      t.string :resources

      t.timestamps null:false
    end
  end
end
