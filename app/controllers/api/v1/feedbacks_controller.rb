module Api
  module V1
    class FeedbacksController < ActionController::API
      def index
        render json: { feedbacks: Feedback.all.to_a }
      end

      def create
        @feedback = Feedback.new(feedback_params)
        @feedback.save
        render json: {status: 200}
      end

      private

      def feedback_params
        params.require(:feedback).permit(
          :rating,
          :feedback,
          :email
        )
      end
    end
  end
end

