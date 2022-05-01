class Currency < ApplicationRecord
  has_many :fx_transactions
end