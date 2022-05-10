class AddStatusToFxTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :fx_transactions, :status, :string, default: 'New'
    add_index :fx_transactions, :status
  end
end
