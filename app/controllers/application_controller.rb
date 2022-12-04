class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
    private
    def unprocessable_entity_method e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end
end
