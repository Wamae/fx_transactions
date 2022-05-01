# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table(:currencies) do |t|
      t.string :code, null: false
      t.timestamps
    end
  end
end
