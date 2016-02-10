class RemoveCustomerIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :customer_id, :integer
  end
end
