class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.datetime :date
      t.boolean :completed
      t.belongs_to :customer, index: true, foreign_key:true

      t.timestamps null: false
    end
  end
end
