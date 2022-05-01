# frozen_string_literal: true

class CreateFxTransactions < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table(:fx_transactions) do |t|
      t.uuid(:identifier, null: false)
      t.decimal :in_amount, precision: 10, scale: 2
      t.references :in_currency, index: true, foreign_key: { to_table: :currencies }
      t.decimal :out_amount, precision: 10, scale: 2
      t.references :out_currency, index: true, foreign_key: { to_table: :currencies }
      t.references(:customer, foreign_key: true, null: false, index: true)
      t.timestamps
    end
  end
end
