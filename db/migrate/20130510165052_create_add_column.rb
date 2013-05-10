class CreateAddColumn < ActiveRecord::Migration
  def change
    add_column :users, :last_log_in, :time
  end
end
