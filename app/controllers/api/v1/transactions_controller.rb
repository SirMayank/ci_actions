module Api
  module V1
    class TransactionsController < ApplicationController
      def create
        user = User.find_by(id: transaction_params[:user_id])
        return render_user_not_found unless user

        transaction = user.transactions.new(transaction_params)
        if transaction.save
          render json: { status: 'success', transaction_id: transaction.transaction_id }, status: :created
        else
          render json: { status: 'error', message: transaction.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def bulk_transactions
        transactions = []
        invalid_transactions = []
        user_ids = transactions_params[:transactions].map { |t| t[:user_id] }
        
        valid_user_ids = User.where(id: user_ids).pluck(:id)

        transactions_params[:transactions].each do |transaction_data|
          unless valid_user_ids.include?(transaction_data[:user_id].to_i)
            invalid_transactions << { transaction_data: transaction_data, errors: ['Invalid user_id'] }
            next
          end

          transaction = Transaction.new(transaction_data.permit(:transaction_id, :points, :user_id, :status))
          unless transaction.valid?
            invalid_transactions << { transaction_data: transaction_data, errors: transaction.errors.full_messages }
            next
          end

          transactions << transaction
        end

        if transactions.any?
          result = Transaction.import(transactions)
          processed_count = result.ids.size
        else
          processed_count = 0
        end

        if invalid_transactions.any?
          render json: { status: 'error', processed_count: processed_count, invalid_transactions: invalid_transactions }, status: :unprocessable_entity
        else
          render json: { status: 'success', processed_count: processed_count }, status: :created
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(:transaction_id, :points, :user_id, :status)
      end

      def transactions_params
        params.permit(transactions: [:transaction_id, :points, :user_id, :status])
      end

      def render_user_not_found
        render json: { status: 'error', message: 'User not found' }, status: :not_found
      end
    end
  end
end

