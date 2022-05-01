require "rails_helper"
require 'factory_bot_rails'
RSpec.describe(Api::Private::V1::FxTransactionsController, type: 'request') do
  describe '#index' do
    context 'when a user' do
      context 'requests transactions list' do
        it 'returns transactions' do
          get '/api/private/v1/fx_transactions'
          aggregate_failures do
            expect(response.content_type).to(eq('application/json; charset=utf-8'))
            expect(response).to(have_http_status(:ok))
            json_body = JSON.parse(response.body)
            serialized_fx_transactions = ActiveModel::Serializer::CollectionSerializer.new(FxTransaction.all, serializer: FxTransactionSerializer)
            expect(json_body['message']).to(eq 'Success')
            expect(json_body['data']).to(eq(JSON.parse(serialized_fx_transactions.to_json)))
            expect(json_body['status']).to(eq 200)
          end
        end
      end
    end
  end
  describe '#create' do
    context 'when a user' do
      context 'with correct params' do
        let(:valid_params) { { in_amount: 500.00, in_currency_id: create(:currency).id, out_amount: 450.00, out_currency_id: create(:currency).id, customer_id: create(:customer).id } }
        it ' creates transaction' do
          post '/api/private/v1/fx_transactions', params: valid_params
          aggregate_failures do
            expect(response.content_type).to(eq('application/json; charset=utf-8'))
            expect(response).to(have_http_status(:ok))
            json_body = JSON.parse(response.body)
            expect(json_body['message']).to(eq 'Success')
            expect(json_body['status']).to(eq 201)
          end
        end
      end
      context 'with incorrect params' do
        let(:invalid_params) { { in_amount: 500.00, in_currency_id: create(:currency).id, out_amount: 450.00, out_currency_id: create(:currency).id} }
        it ' created transaction' do
          post '/api/private/v1/fx_transactions', params: invalid_params
          aggregate_failures do
            expect(response.content_type).to(eq('application/json; charset=utf-8'))
            expect(response).to(have_http_status(:ok))
            json_body = JSON.parse(response.body)
            expect(json_body['message']).to(eq 'Customer must exist')
            expect(json_body['status']).to(eq 400)
          end
        end
      end
    end
  end
  describe '#show' do
    context 'when a user' do
      context 'with correct params' do
        let(:id) { create(:fx_transaction).id }
        it ' shows transaction' do
          get "/api/private/v1/fx_transactions/#{id}"
          expect(response.content_type).to(eq('application/json; charset=utf-8'))
          expect(response).to(have_http_status(:ok))
          json_body = JSON.parse(response.body)
          expect(json_body['message']).to(eq 'Success')
          expect(json_body['status']).to(eq 200)
        end
      end
    end
    context 'with incorrect params' do
      let(:id) { 99999999 }
      it ' created transaction' do
        get "/api/private/v1/fx_transactions/#{id}"
        expect(response.content_type).to(eq('application/json; charset=utf-8'))
        expect(response).to(have_http_status(:ok))
        json_body = JSON.parse(response.body)
        expect(json_body['message']).to(eq 'Record not found')
        expect(json_body['status']).to(eq 404)
      end
    end
  end
end