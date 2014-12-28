class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.datetime :due_at
      t.integer :amount
      t.boolean :paid, default: false
      t.boolean :is_late
      t.references :user

      t.timestamps
    end
  end
end
