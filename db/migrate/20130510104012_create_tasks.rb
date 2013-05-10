class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :completed, :default => false
      t.integer :list_id
      t.timestamps
    end
  end
end
