module Api
  module Private
    module V1
      class BaseController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

        private


        def record_not_found
          render json: { message: 'Record not found', data: nil, status: 404 }.to_json
        end
      end
    end
  end
end