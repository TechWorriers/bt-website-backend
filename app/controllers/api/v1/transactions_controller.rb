module Api
  module V1
    class TransactionsController < ActionController::API
      def index
        render json: { transactions: Transaction.all.to_a }
      end

      def create
        Transaction.create!(transaction_params)
        render json: { status: 200, message: "Transaction Successful" }
      end

      private

      def transaction_params
        params.require('transaction').permit(
          :ref_id,
          :transaction_type,
          :to_account,
          :amount,
          :bank_name,
          :code
        )
      end
    end
  end
end
