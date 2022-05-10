class FxTransaction < ApplicationRecord
  STATUSES = %w(Cancelled New Pending Paid)

  belongs_to :customer
  belongs_to :in_currency, :class_name => 'Currency', :foreign_key => 'in_currency_id'
  belongs_to :out_currency, :class_name => 'Currency', :foreign_key => 'out_currency_id'

  validates :identifier, presence: true, uniqueness: true
  validates :in_currency, presence: true
  validates :out_currency, presence: true
  validates :in_amount, :out_amount, numericality: { greater_than: 0 }
  validates :out_amount, :out_amount, numericality: { greater_than: 0 }
  validates :status ,inclusion: STATUSES
end