class CreateJoinTableCustomerTask < ActiveRecord::Migration
  def change
    create_join_table :customers, :tasks do |t|
      # t.index [:customer_id, :task_id]
      # t.index [:task_id, :customer_id]
    end
  end
end
