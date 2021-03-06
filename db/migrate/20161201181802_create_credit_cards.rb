class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.integer :user_id
      t.float :debt
      t.float :interest_rate

      t.timestamps
    end
  end
end
