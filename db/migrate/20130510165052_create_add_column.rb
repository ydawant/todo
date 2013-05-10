class CreateAdd_column < ActiveRecord::Migration
  def change
    create_table :add_column do |t|

      t.timestamps

    end
  end
end
