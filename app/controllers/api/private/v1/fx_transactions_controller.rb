module Api
  module Private
    module V1
      class FxTransactionsController < BaseController
        def index
          render json: { message: 'Success', data: ActiveModelSerializers::SerializableResource.new(FxTransaction.all, each_serializer: ::FxTransactionSerializer), status: 200 }.to_json
        end

        def create
          fx_transaction = FxTransaction.new({ identifier: SecureRandom.uuid, customer_id: fx_transaction_params[:customer_id].to_i, in_amount: fx_transaction_params[:in_amount].to_f, in_currency: Currency.find(fx_transaction_params[:in_currency_id].to_i), out_amount: fx_transaction_params[:out_amount].to_f, out_currency: Currency.find(fx_transaction_params[:out_currency_id].to_i) })

          if fx_transaction.valid?
            fx_transaction.save!
            render json: { message: 'Success', data: fx_transaction, status: 201 }.to_json
          else
            render json: { message: fx_transaction.errors.full_messages.first, data: nil, status: 400 }.to_json
          end
        end

        def show
          render json: { message: 'Success', data: ActiveModelSerializers::SerializableResource.new(FxTransaction.find(fx_transaction_params[:id]), serializer: ::FxTransactionSerializer), status: 200 }.to_json
        end

        private

        def fx_transaction_params
          params.permit(:id, :in_amount, :in_currency_id, :out_amount, :out_currency_id, :customer_id)
        end
      end
    end
  end
end
