class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :duration
      t.string :start
      t.string :finish
      t.belongs_to :users

      t.timestamps null: false
    end
  end
end
