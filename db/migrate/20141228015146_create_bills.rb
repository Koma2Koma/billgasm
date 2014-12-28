class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.time :due_at
      t.integer :amount
      t.boolean :paid
      t.boolean :is_late
      t.references :user

      t.timestamps
    end
  end
end
