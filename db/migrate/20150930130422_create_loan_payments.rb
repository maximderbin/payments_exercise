class CreateLoanPayments < ActiveRecord::Migration
  def change
    create_table :loan_payments do |t|
      t.integer :loan_id, null: false
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
