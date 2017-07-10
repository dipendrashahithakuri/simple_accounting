class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.text :title
      t.date :date
      t.float :amount
      t.timestamps null: false
    end
  end
end
