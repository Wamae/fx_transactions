class FxTransactionSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :status, :in_amount, :out_amount, :customer_id, :created_at, :updated_at

  def in_amount
    object.in_amount.to_f
  end

  def out_amount
    object.out_amount.to_f
  end
end